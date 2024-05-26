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
    
     public Laptop getByID(String id) {
        Laptop product = null;
        try {
            String strSelect = "SELECT * FROM Laptop WHERE laptop_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                product = (Laptop) this.createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return product;
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

    public List<Laptop> findBySearch(String searchQuery) {
        List<Laptop> laptops = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Laptop WHERE title LIKE ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, "%" + searchQuery + "%");
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

    public List<Laptop> findByCategories(String[] selectedCategories) {
        List<Laptop> laptops = new ArrayList<>();
        try {
            String strSelect = "select * from Laptop INNER JOIN Laptop_Category ON Laptop.laptop_id = Laptop_Category.laptop_id WHERE category IN (";
            for (int i = 0; i < selectedCategories.length; i++) {
                strSelect += "?";
                if (i < selectedCategories.length - 1) {
                    strSelect += ", ";
                }
            }
            strSelect += ")";
            stm = connection.prepareStatement(strSelect);
            for (int i = 0; i < selectedCategories.length; i++) {
                stm.setString(i + 1, selectedCategories[i]);
            }
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

    public List<Laptop> findBySearchAndCategories(String searchQuery, String[] selectedCategories) {
        List<Laptop> laptops = new ArrayList<>();
        try {
            String strSelect = "select * from Laptop INNER JOIN Laptop_Category ON Laptop.laptop_id = Laptop_Category.laptop_id WHERE title LIKE ? AND category IN (";
            for (int i = 0; i < selectedCategories.length; i++) {
                strSelect += "?";
                if (i < selectedCategories.length - 1) {
                    strSelect += ", ";
                }
            }
            strSelect += ")";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, searchQuery);
            for (int i = 0; i < selectedCategories.length; i++) {
                stm.setString(i + 2, selectedCategories[i]);
            }
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

    public List<Laptop> findByPage(int page, int totalPerPage, String order, String condition, String[] categories) {
        List<Laptop> laptops = new ArrayList<>();
        try {
            String strSelect = "select distinct * from Laptop INNER JOIN Laptop_Category ON Laptop.laptop_id = Laptop_Category.laptop_id ";

            // Check if categories are provided and append WHERE clause
            if (categories != null && categories.length > 0) {
                strSelect += " WHERE category IN (";
                for (int i = 0; i < categories.length; i++) {
                    strSelect += "?";
                    if (i < categories.length - 1) {
                        strSelect += ", ";
                    }
                }
                strSelect += ")";
            }

            // Check if condition is not blank and append AND clause
            if (!condition.isBlank()) {
                strSelect += (categories != null && categories.length > 0 ? " AND" : " WHERE") + " title LIKE ?";
            }

            // Append ORDER BY clause and pagination
            strSelect += " ORDER BY " + (order.isBlank() ? "updated_date" : order) + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            System.out.println(strSelect);
            stm = connection.prepareStatement(strSelect);

            // Set parameters based on whether categories and condition are provided
            int paramIndex = 1;
            if (categories != null && categories.length > 0) {
                for (String category : categories) {
                    stm.setString(paramIndex++, category);
                }
            }
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
