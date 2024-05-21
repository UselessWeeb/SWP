/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.Laptop_Image;
import java.sql.*;
/**
 *
 * @author M7510
 */
public class Laptop_ImageDAO extends EntityDAO {

    public List<Laptop_Image> findById(int iLaptop) {
        List<Laptop_Image> images = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Laptop_Image WHERE ILaptop = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, iLaptop);
            rs = stm.executeQuery();
            while (rs.next()) {
                images.add(createEntity(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return images;
    }

    @Override
    public Laptop_Image createEntity(ResultSet rs) throws SQLException {
        return new Laptop_Image(
                rs.getInt("ILaptop"),
                rs.getInt("laptop_id"),
                rs.getString("Image")
        );
    }
}
