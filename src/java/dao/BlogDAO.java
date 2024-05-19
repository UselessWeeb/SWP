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
    public List<Blog> findAll() {
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

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        Blog blog = new Blog(
                rs.getInt("blog_id"),
                rs.getString("thumbnail"),
                rs.getString("title"),
                rs.getTimestamp("updated_date"),
                rs.getString("category"),
                rs.getString("blog_content"),
                rs.getInt("user_id")
        );
        return blog;
    }
}
