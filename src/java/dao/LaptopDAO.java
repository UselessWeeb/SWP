/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author M7510
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Laptop;

public class LaptopDAO extends EntityDAO {

    public List<Laptop> findAll() {
        List<Laptop> laptops = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Laptop";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Laptop laptop = (Laptop) this.createEntity(rs);
                laptops.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return laptops;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new Laptop(
                rs.getInt("laptop_id"),
                rs.getString("title"),
                rs.getString("category"),
                rs.getString("image"),
                rs.getFloat("original_price"),
                rs.getString("products_detail"),
                rs.getFloat("sale_price"),
                rs.getInt("status")
        );
    }
}
