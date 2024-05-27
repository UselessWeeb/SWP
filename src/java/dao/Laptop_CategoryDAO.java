/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Laptop_Category;

/**
 *
 * @author M7510
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Laptop_CategoryDAO extends EntityDAO {

    public List<Laptop_Category> findById(int cLaptop) {
        List<Laptop_Category> category = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Laptop_Category WHERE laptop_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, cLaptop);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                category.add(createEntity(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return category;
    }

    @Override
    public Laptop_Category createEntity(ResultSet rs) throws SQLException {
        return new Laptop_Category(
                rs.getInt("laptop_id"),
                rs.getString("Category")
        );
    }
}
