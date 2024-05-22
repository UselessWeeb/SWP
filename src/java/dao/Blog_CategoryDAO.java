/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Blog_Category;

/**
 *
 * @author M7510
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Blog_CategoryDAO extends EntityDAO {
    // Constructor and other methods...

    public List<Blog_Category> findById(int cBlog) {
        List<Blog_Category> categories = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Blog_Category WHERE CBlog = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, cBlog);
            rs = stm.executeQuery();
            while (rs.next()) {
                categories.add(createEntity(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return categories;
    }

    @Override
    public Blog_Category createEntity(ResultSet rs) throws SQLException {
        return new Blog_Category(
                rs.getInt("CBlog"),
                rs.getInt("blog_id"),
                rs.getString("Category")
        );
    }
}
