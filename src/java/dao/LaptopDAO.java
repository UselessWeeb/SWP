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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

    public int findCountByCriteria(String searchQuery, String[] selectedCategories) {
        int count = 0;
        try {
            StringBuilder strSelect = new StringBuilder("SELECT COUNT(*) FROM Laptop");
            if (searchQuery != null || selectedCategories != null) {
                strSelect.append(" WHERE ");
                if (searchQuery != null) {
                    strSelect.append("title LIKE ? ");
                }
                if (selectedCategories != null) {
                    if (searchQuery != null) {
                        strSelect.append("AND ");
                    }
                    strSelect.append("category IN (");
                    for (int i = 0; i < selectedCategories.length; i++) {
                        strSelect.append("?");
                        if (i < selectedCategories.length - 1) {
                            strSelect.append(", ");
                        }
                    }
                    strSelect.append(") ");
                }
            }
            stm = connection.prepareStatement(strSelect.toString());
            int paramIndex = 1;
            if (searchQuery != null) {
                stm.setString(paramIndex++, "%" + searchQuery + "%");
            }
            if (selectedCategories != null) {
                for (String category : selectedCategories) {
                    stm.setString(paramIndex++, category);
                }
            }
            rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
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

    public HashMap<String, Integer> getCategoryCounts() {
        HashMap<String, Integer> categoryMap = new HashMap<>();

        String query = "SELECT lc.category, COUNT(l.laptop_id) FROM Laptop l INNER JOIN Laptop_Category lc ON l.laptop_id = lc.laptop_id GROUP BY lc.category";

        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String category = rs.getString(1);
                int count = rs.getInt(2);
                categoryMap.put(category, count);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categoryMap;
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
