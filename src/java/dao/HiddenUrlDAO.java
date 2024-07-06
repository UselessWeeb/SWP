

package dao;

import model.hiddenUrl;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class HiddenUrlDAO extends EntityDAO {

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        hiddenUrl hiddenUrl = new hiddenUrl();
        hiddenUrl.setId(rs.getInt("urlid"));
        hiddenUrl.setUrl(rs.getString("url"));
        return hiddenUrl;
    }

    public hiddenUrl getByUrl(String url) {
        String query = "SELECT * FROM hiddenUrl WHERE url = ?";
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, url);
            rs = stm.executeQuery();
            if(rs.next()) {
                return (hiddenUrl) createEntity(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void addUrl(String url) {
        String query = "INSERT INTO hiddenUrl (url) VALUES (?)";
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, url);
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteUrl(String url) {
        String query = "DELETE FROM hiddenUrl WHERE url = ?";
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, url);
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<String> getAllUrls() {
        List<String> urls = new ArrayList<>();
        String query = "SELECT * FROM hiddenUrl";
        try {
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while(rs.next()) {
                urls.add(rs.getString("url"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return urls;
    }

    public List<String> fetchPaginatedUrls(int page, int pageSize) {
        List<String> urls = new ArrayList<>();
        String query = "SELECT * FROM hiddenUrl ORDER BY urlid DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            stm = connection.prepareStatement(query);
            stm.setInt(1, (page) * pageSize);
            stm.setInt(2, pageSize);
            rs = stm.executeQuery();
            while(rs.next()) {
                urls.add(rs.getString("url"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return urls;
    }

    public int getTotalUrlsCount() {
        String query = "SELECT COUNT(*) FROM hiddenUrl";
        try {
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            if(rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public void UpdateListUrls(String[] urls) {
        Set<String> newUrls = new HashSet<>(Arrays.asList(urls));
        Set<String> existingUrls = new HashSet<>();

        // Fetch existing URLs from the database
        String selectSql = "SELECT url FROM hiddenUrl";
        String insertSql = "INSERT INTO hiddenUrl (url) VALUES (?)";
        String deleteSql = "DELETE FROM hiddenUrl WHERE url = ?";

        try {
            connection.setAutoCommit(false); // Use transaction for batch processing

            // Step 1: Fetch existing URLs
            try (Statement selectStm = connection.createStatement(); 
                ResultSet rs = selectStm.executeQuery(selectSql)) {
                while (rs.next()) {
                    existingUrls.add(rs.getString("url"));
                }
            }

            // Step 2: Determine URLs to add and delete
            Set<String> urlsToAdd = new HashSet<>(newUrls);
            urlsToAdd.removeAll(existingUrls);

            Set<String> urlsToDelete = new HashSet<>(existingUrls);
            urlsToDelete.removeAll(newUrls);

            System.out.println(urlsToAdd);
            System.out.println(urlsToDelete);

            // Step 3: Insert new URLs
            try (PreparedStatement insertStm = connection.prepareStatement(insertSql)) {
                for (String url : urlsToAdd) {
                    insertStm.setString(1, url);
                    insertStm.addBatch();
                }
                insertStm.executeBatch();
            }

            // Step 4: Delete removed URLs
            try (PreparedStatement deleteStm = connection.prepareStatement(deleteSql)) {
                for (String url : urlsToDelete) {
                    deleteStm.setString(1, url);
                    deleteStm.addBatch();
                }
                deleteStm.executeBatch();
            }

            connection.commit(); // Commit transaction
        } catch (SQLException e) {
            try {
                connection.rollback(); // Rollback in case of error
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                connection.setAutoCommit(true); // Reset auto-commit mode
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

