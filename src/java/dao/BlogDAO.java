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

    //for now, if changes are needed, fix this
    public List<Blog> findLatest() {
        List<Blog> blogs = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Blog ORDER BY updated_date";
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
    
    public List<Blog> getAll() {
        List<Blog> blogs = new ArrayList<>();

        try {
            String strSelect = "SELECT * FROM Blog";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog blog = (Blog)this.createEntity(rs);
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
        Blog_CategoryDAO blog_cat = new Blog_CategoryDAO();
        return new Blog(
                rs.getInt("blog_id"),
                rs.getString("thumbnail"),
                rs.getString("title"),
                blog_cat.findById(rs.getInt("blog_id")),
                rs.getTimestamp("updated_date"),
                rs.getString("blog_content"),
                rs.getInt("is_featured"),
                rs.getInt("user_id")
        );
    }
}
