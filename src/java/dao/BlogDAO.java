/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.Blog;

/**
<<<<<<< HEAD
 *
 * @author M7510
 */
public class BlogDAO extends EntityDAO {

    //for now, if changes are needed, fix this
    public List<Blog> findLatest() {
        List<Blog> blogs = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Blog ORDER BY updated_date";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = (Blog) this.createEntity(rs);
=======
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
                        rs.getInt("idBlog"),
                        rs.getInt("idUser"),
                        rs.getString("header"),
                        rs.getString("description"),
                        rs.getDate("date"),
                        rs.getInt("status"),
                        rs.getString("img"),
                        rs.getString("category")
                );
>>>>>>> 9e4940f (add list all blog)
                blogs.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
<<<<<<< HEAD
        }
        return blogs;
    }

    public List<Blog> findFeatured() {
        List<Blog> blogs = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Blog WHERE is_featured = 1";
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
        return new Blog(
                rs.getInt("blog_id"),
                rs.getString("thumbnail"),
                rs.getString("title"),
                rs.getTimestamp("updated_date"),
                rs.getString("category"),
                rs.getString("blog_content"),
                rs.getInt("is_featured"),
                rs.getInt("user_id")
        );
    }
}
=======
        } finally {
            try {
                if (rs != null) rs.close();
                if (stm != null) stm.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return blogs;
    }
}

>>>>>>> 9e4940f (add list all blog)
