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

    public List<Laptop> findLatest() {
        List<Laptop> laptops = new ArrayList<>();
        try {
            String strSelect = "SELECT TOP 10 * FROM Laptop ORDER BY updated_date DESC";
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

    public List<Laptop> findByName(String name) {
        List<Laptop> laptops = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Laptop where title LIKE ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, name);
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

    public List<Laptop> findByPage(int page, int totalPerPage, String order, String condition) {
        List<Laptop> laptops = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Laptop ";

            // Check if condition is not blank and append WHERE clause
            if (!condition.isBlank()) {
                strSelect += " WHERE title LIKE ?";
            }

            // Append ORDER BY clause and pagination
            strSelect += " ORDER BY " + (order.isBlank() ? "updated_date" : order) + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            System.out.println(strSelect);
            stm = connection.prepareStatement(strSelect);

            // Set parameters based on whether condition is provided
            int paramIndex = 1;
            if (!condition.isBlank()) {
                stm.setString(paramIndex++, condition);
            }
            stm.setInt(paramIndex++, page * totalPerPage);
            stm.setInt(paramIndex, totalPerPage);

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
        Laptop_CategoryDAO lap_cat = new Laptop_CategoryDAO();
        Laptop_ImageDAO lap_img = new Laptop_ImageDAO();
        return new Laptop(
                rs.getInt("laptop_id"),
                rs.getString("title"),
                lap_cat.findById(rs.getInt("laptop_id")),
                lap_img.findById(rs.getInt("laptop_id")),
                rs.getString("main_image"),
                rs.getFloat("original_price"),
                rs.getString("products_detail"),
                rs.getFloat("sale_price"),
                rs.getInt("stock"),
                rs.getInt("status"),
                rs.getTimestamp("updated_date")
        );
    }
}
