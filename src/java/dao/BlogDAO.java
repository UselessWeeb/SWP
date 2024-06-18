/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Blog;

/**
 *
 * @author M7510
 */
public class BlogDAO extends EntityDAO {

    public void incrementViewCount(String id) {
    try {
        String strUpdate = "UPDATE Blog SET [view] = [view] + 1 WHERE blog_id = ?";
        stm = connection.prepareStatement(strUpdate);
        stm.setString(1, id);
        stm.executeUpdate();
    } catch (SQLException e) {
        System.out.println(e);
    }
}


    //for now, if changes are needed, fix this
    public List<Blog> findLatest() {
        List<Blog> blogs = new ArrayList<>();
        try {
            String strSelect = "SELECT TOP 3 * FROM Blog ORDER BY updated_date";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = (Blog) this.createEntity(rs);
                blogs.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return blogs;
    }

    public Blog getByID(String id) {
        Blog blog = null;
        try {
            String strSelect = "SELECT * FROM Blog WHERE blog_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                blog = (Blog) this.createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return blog;
    }

    public List<Blog> getAll() {
        List<Blog> blogs = new ArrayList<>();

        try {
            String strSelect = "SELECT * FROM Blog";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = (Blog) this.createEntity(rs);
                blogs.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return blogs;
    }

    public List<Blog> findByPage(int page, int totalPerPage, String order, String condition, String[] categories) {
        List<Blog> blogs = new ArrayList<>();
        try {
            String strSelect = "select * from Blog INNER JOIN Blog_Category ON Blog.blog_id = Blog_Category.blog_id ";

            // Check if categories are provided and append WHERE clause
            if (categories != null && categories.length > 0) {
                strSelect += " WHERE category IN (";
                for (int i = 0; i < categories.length; i++) {
                    strSelect += "?";
                    if (i < categories.length - 1) {
                        strSelect += ", ";
                    }
                }
                strSelect += ")";
            }

            // Check if condition is not blank and append AND clause
            if (!condition.isBlank()) {
                strSelect += (categories != null && categories.length > 0 ? " AND" : " WHERE") + " title LIKE ?";
            }

            // Append ORDER BY clause and pagination
            strSelect += " ORDER BY " + (order.isBlank() ? "updated_date" : order) + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            System.out.println(strSelect);
            stm = connection.prepareStatement(strSelect);

            // Set parameters based on whether categories and condition are provided
            int paramIndex = 1;
            if (categories != null && categories.length > 0) {
                for (String category : categories) {
                    stm.setString(paramIndex++, category);
                }
            }
            if (!condition.isBlank()) {
                stm.setString(paramIndex++, condition);
            }
            stm.setInt(paramIndex++, page * totalPerPage);
            stm.setInt(paramIndex, totalPerPage);

            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = (Blog) this.createEntity(rs);
                blogs.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return blogs;
    }

    public int getBlogCount(String searchQuery, String[] selectedCategories) {
        int count = 0;
        try {
            StringBuilder strSelect = new StringBuilder("SELECT COUNT(*) FROM Blog INNER JOIN Blog_Category ON Blog.blog_id = Blog_Category.blog_id WHERE 1=1");

            if (searchQuery != null && !searchQuery.isEmpty()) {
                strSelect.append(" AND title LIKE ?");
            }

            if (selectedCategories != null && selectedCategories.length > 0) {
                strSelect.append(" AND category IN (");
                for (int i = 0; i < selectedCategories.length; i++) {
                    strSelect.append("?");
                    if (i < selectedCategories.length - 1) {
                        strSelect.append(", ");
                    }
                }
                strSelect.append(")");
            }

            stm = connection.prepareStatement(strSelect.toString());

            int parameterIndex = 1;
            if (searchQuery != null && !searchQuery.isEmpty()) {
                stm.setString(parameterIndex++, "%" + searchQuery + "%");
            }

            if (selectedCategories != null && selectedCategories.length > 0) {
                for (String category : selectedCategories) {
                    stm.setString(parameterIndex++, category);
                }
            }

            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    public List<Blog> findFeatured() {
        List<Blog> blogs = new ArrayList<>();
        try {
            String strSelect = "SELECT TOP 4 * FROM Blog ORDER BY [views] DESC";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = (Blog) this.createEntity(rs);
                blogs.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return blogs;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        Blog_CategoryDAO blog_cat = new Blog_CategoryDAO();
        return new Blog(
                rs.getInt("blog_id"),
                rs.getString("thumbnail"),
                rs.getString("title"),
                blog_cat.findById(rs.getInt("blog_id")),
                rs.getTimestamp("updated_date"),
                rs.getString("blog_content"),
                rs.getInt("user_id"),
                rs.getInt("views")
        );
    }
}
