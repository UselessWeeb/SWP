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

    public List<Laptop> findFeatured() {
        List<Laptop> laptops = new ArrayList<>();
        try {

            // Create a SQL query to select the latest 2 featured laptops
            String strSelect
                    = "SELECT TOP 2 laptop_id, title, main_image, original_price, stock, products_detail, brief_information, sale_price, status, updated_date "
                    + "FROM Laptop "
                    + "WHERE is_featured = 1";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Laptop laptop = (Laptop) createEntity(rs);
                laptops.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return laptops;
    }

    public List<Laptop> findLatest() {
        List<Laptop> laptops = new ArrayList<>();
        try {
            String strSelect
                    = "SELECT TOP 2 laptop_id, title, main_image, original_price, stock, products_detail, sale_price, brief_information, status, updated_date "
                    + "FROM Laptop "
                    + "ORDER BY updated_date DESC";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Laptop laptop = (Laptop) createEntity(rs);
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
            // Create a SQL query to select a Laptop by its ID
            String strSelect
                    = "SELECT laptop_id, title, main_image, original_price, stock, brief_information, products_detail, sale_price, status, updated_date "
                    + "FROM Laptop "
                    + "WHERE laptop_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                product = (Laptop) createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return product;
    }

    public List<Laptop> findAll() {
        // Create a new list to hold the Laptop objects
        List<Laptop> laptops = new ArrayList<>();
        try {
            String strSelect = 
                "SELECT laptop_id, title, main_image, original_price, brief_information, stock, products_detail, sale_price, status, updated_date " +
                "FROM Laptop ";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Laptop laptop = (Laptop) createEntity(rs);
                laptops.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return laptops;
    }

    public float findMaxPrice() {
        float maxPrice = 0;
        try {
            String strSelect = "SELECT MAX(original_price) FROM Laptop";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            if (rs.next()) {
                // Get the maximum price from the first column of the result
                maxPrice = rs.getFloat(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return maxPrice;
    }

    public int findCountByCriteria(String searchQuery, String[] selectedCategories, float minPrice, float maxPrice) {
        int count = 0; // Initialize the count to 0
        try {
            // Start building the SQL query
            StringBuilder strSelect = new StringBuilder("SELECT COUNT(DISTINCT Laptop.laptop_id) FROM Laptop ");
            strSelect.append("INNER JOIN Laptop_Category ON Laptop.laptop_id = Laptop_Category.laptop_id WHERE 1=1 ");
            List<Object> params = new ArrayList<>(); // List to hold the parameters for the query

            // If a search query is provided, add a condition to the query to filter by title
            if (searchQuery != null) {
                strSelect.append("AND title LIKE ? ");
                params.add("%" + searchQuery + "%"); // Add the search query to the parameters list
            }
            // If categories are selected, add a condition to the query to filter by category
            if (selectedCategories != null && selectedCategories.length > 0) {
                strSelect.append("AND category IN (");
                for (int i = 0; i < selectedCategories.length; i++) {
                    strSelect.append("?");
                    if (i < selectedCategories.length - 1) {
                        strSelect.append(", "); // Add a comma between parameters
                    }
                    params.add(selectedCategories[i]); // Add the category to the parameters list
                }
                strSelect.append(") ");
            }
            // If a minimum price is provided, add a condition to the query to filter by price
            if (minPrice > 0) {
                strSelect.append("AND original_price >= ? ");
                params.add(minPrice); // Add the minimum price to the parameters list
            }
            // If a maximum price is provided, add a condition to the query to filter by price
            if (maxPrice > 0) {
                strSelect.append("AND original_price <= ? ");
                params.add(maxPrice); // Add the maximum price to the parameters list
            }

            // Prepare the SQL statement
            stm = connection.prepareStatement(strSelect.toString());
            // Set the parameters for the SQL statement
            for (int i = 0; i < params.size(); i++) {
                stm.setObject(i + 1, params.get(i));
            }
            // Execute the query and get the result
            rs = stm.executeQuery();
            // If a result is returned, get the count from the first column of the result
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            // Print the exception if one occurs
            System.out.println(e);
        }
        // Return the count
        return count;
    }

    public List<Laptop> findByPage(int page, int totalPerPage, String order, String condition, String[] categories, float minPrice, float maxPrice) {
        List<Laptop> laptops = new ArrayList<>();
        try {
            StringBuilder strSelect = new StringBuilder(
                    "SELECT DISTINCT Laptop.laptop_id, Laptop.title, Laptop.main_image, Laptop.original_price, "
                    + "Laptop.stock, Laptop.products_detail, Laptop.sale_price, Laptop.brief_information, Laptop.status, Laptop.updated_date "
                    + "FROM Laptop INNER JOIN Laptop_Category ON Laptop.laptop_id = Laptop_Category.laptop_id WHERE 1=1 "
            );

            List<Object> params = new ArrayList<>();
            // If a search query is provided, add a condition to the query to filter by title
            if (categories != null && categories.length > 0) {
                strSelect.append("AND Laptop_Category.Category IN (");
                for (int i = 0; i < categories.length; i++) {
                    strSelect.append("?");
                    if (i < categories.length - 1) {
                        strSelect.append(", ");
                    }
                    params.add(categories[i]);
                }
                strSelect.append(") ");
            }
            // If a search query is provided, add a condition to the query to filter by title
            if (!condition.isBlank()) {
                strSelect.append("AND Laptop.title LIKE ? ");
                params.add("%" + condition + "%");
            }
            // If a minimum price is provided, add a condition to the query to filter by price
            if (minPrice > 0) {
                strSelect.append("AND Laptop.original_price >= ? ");
                params.add(minPrice);
            }
            // If a maximum price is provided, add a condition to the query to filter by price
            if (maxPrice > 0) {
                strSelect.append("AND Laptop.original_price <= ? ");
                params.add(maxPrice);
            }
            // If an order is provided, add an ORDER BY clause to the query
            if (order.isBlank()) {
                order = "Laptop.updated_date";
            }
            strSelect.append("GROUP BY Laptop.laptop_id, Laptop.title, Laptop.main_image, Laptop.original_price, "
                    + "Laptop.stock, Laptop.products_detail, Laptop.sale_price, Laptop.status, Laptop.updated_date, Laptop.brief_information "
                    + "ORDER BY ").append(order).append(" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
            //skip ammount of rows to stimulate pagination
            params.add(page * totalPerPage);

            //force how many rows per page
            params.add(totalPerPage);

            System.out.println(strSelect.toString());
            stm = connection.prepareStatement(strSelect.toString());

            //dynamic binding parameters
            for (int i = 0; i < params.size(); i++) {
                stm.setObject(i + 1, params.get(i));
            }

            rs = stm.executeQuery();
            while (rs.next()) {
                Laptop laptop = (Laptop) createEntity(rs);
                laptops.add(laptop);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return laptops;
    }

    public HashMap<String, Integer> getCategoryCounts() {
        HashMap<String, Integer> categoryMap = new HashMap<>();
        try {
            String query
                    = "SELECT lc.category, COUNT(l.laptop_id) FROM Laptop l "
                    + "INNER JOIN Laptop_Category lc ON l.laptop_id = lc.laptop_id "
                    + "GROUP BY lc.category";
            stm = connection.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                // Add the category and count to the map
                categoryMap.put(rs.getString(1), rs.getInt(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryMap;
    }

    public Laptop getLaptopById(int laptopID) {
        Laptop laptop = null;
        try {
            String strSelect = "SELECT laptop_id, title, main_image, original_price, stock, products_detail, sale_price, brief_information, status, updated_date "
                    + "FROM Laptop "
                    + "WHERE laptop_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, laptopID);
            rs = stm.executeQuery();
            if (rs.next()) {
                // Create a new Laptop object from the result set
                laptop = (Laptop) createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        // Return the Laptop object, or null if no Laptop was found
        return laptop;
    }
     
    public List<Integer> findOrderedLaptop(){
        List<Integer> laptopIDs = new ArrayList<>();
        try {
            String strSelect = "SELECT DISTINCT laptop_id FROM Order_Item";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                laptopIDs.add(rs.getInt("laptop_id"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return laptopIDs;
    }

    public void UpdateQuantity(int laptopID, int quantity) {
        try {
            String query = "UPDATE Laptop SET stock = ? WHERE laptop_id = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, quantity);
            stm.setInt(2, laptopID);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
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
                rs.getString("brief_information"),
                rs.getTimestamp("updated_date")
        );
    }
}
