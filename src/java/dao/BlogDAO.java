/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ASUS
 */
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Blog;

/**
 * BlogDAO to handle database operations for Blog entities.
 */
public class BlogDAO extends EntityDAO {

    public List<Blog> getAll() {
        List<Blog> blogs = new ArrayList<>();

        try {
            String strSelect = "SELECT * FROM Blog";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt("blog_id"),
                        rs.getString("thumbnail"),
                        rs.getString("title"),
                        rs.getDate("updated_date"),
                        rs.getString("category"),
                        rs.getString("blog_content"),
                        rs.getInt("user_id")
                );
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

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new Blog(
                rs.getInt("blog_id"),
                rs.getString("thumbnail"),
                rs.getString("title"),
                rs.getDate("updated_date"),
                rs.getString("category"),
                rs.getString("blog_content"),
                rs.getInt("user_id")
        );
    }

    public Blog getByID(String id) {
        Blog blog = null;
        try {
            String strSelect = "SELECT * FROM Blog WHERE ID = ?";
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

}
