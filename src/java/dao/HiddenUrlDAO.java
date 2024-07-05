

package dao;

import model.hiddenUrl;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
        String query = "SELECT * FROM hiddenUrl LIMIT ? OFFSET ?";
        try {
            stm = connection.prepareStatement(query);
            stm.setInt(1, pageSize);
            stm.setInt(2, (page - 1) * pageSize);
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
}

