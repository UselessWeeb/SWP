/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ASUS
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ProductDAO extends EntityDAO {

    
//                          ProductList
//    public List<Product> findAll() {
//        List<Product> products = new ArrayList<>();
//        try {
//            String strSelect = "SELECT * FROM Products";
//            stm = connection.prepareStatement(strSelect);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                Product product = (Product) this.createEntity(rs);
//                products.add(product);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return products;
//    }

    public Product getByID(String id) {
        Product product = null;
        try {
            String strSelect = "SELECT * FROM Laptop WHERE laptop_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                product = (Product) this.createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return product;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new Product(
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
