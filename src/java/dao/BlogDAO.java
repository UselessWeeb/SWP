/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ASUS
 */


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
                        rs.getInt("idBlog"),
                        rs.getInt("idUser"),
                        rs.getString("header"),
                        rs.getString("description"),
                        rs.getDate("date"),
                        rs.getInt("status"),
                        rs.getString("img"),
                        rs.getString("category")
                );
                blogs.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
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

