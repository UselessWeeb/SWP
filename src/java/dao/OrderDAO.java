/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Laptop;
import model.Order;
import model.Slider;
import model.User;

/**
 *
 * @author vudai
 */
public class OrderDAO extends EntityDAO {

    public Vector<Order> getOrderUser(int id) {
        Vector<Order> vector = new Vector<>();
        String sql = "select o.order_id, o.order_date, l.title, l.original_price, o.quantity, o.status "
                + "from [Order] o "
                + "inner join [Laptop] l on l.laptop_id = o.laptop_id "
                + "where o.user_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                int orderid = rs.getInt(1);
                Date orderdate = rs.getDate(2);
                String product = rs.getString(3);
                float price = rs.getFloat(4);
                int quality = rs.getInt(5);
                int status = rs.getInt(6);

                Order o = new Order();
                o.setOrder_id(orderid);
                o.setOrder_date(orderdate);
                o.setQuality(quality);
                o.setStatus(status);

                Laptop l = new Laptop();
                l.setTitle(product);
                l.setOriginalPrice(price);
                o.setLaptop(l);

                vector.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Map<Date, Integer> getSuccessOrders(Date start, Date end, String sales_id) throws SQLException {
        Map<Date, Integer> successOrders = new LinkedHashMap<>();

        String sql = "SELECT order_date, COUNT(*) AS successOrders "
                + "FROM [Order] o INNER JOIN Order_Information i on o.order_id = i.order_id "
                + "WHERE status = 1 AND order_date BETWEEN ? AND ? ";      
        sql += (sales_id.isBlank()) ? "" : "AND sales_id = ?";
        sql += "GROUP BY order_date";
        try {
            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            Calendar cal = Calendar.getInstance();
            cal.setTime(end);
            cal.add(Calendar.DATE, +1);
            java.sql.Date oneDayBeforeEnd = new java.sql.Date(cal.getTimeInMillis());

            stm.setDate(2, oneDayBeforeEnd);
            if (!sales_id.isBlank()){
                stm.setString(3, sales_id);
            }

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Date date = rs.getDate("order_date");
                int count = rs.getInt("successOrders");

                successOrders.put(date, count);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return successOrders;
    }

    public Map<Date, Integer> getTotalOrders(Date start, Date end, String sales_id) throws SQLException {
        Map<Date, Integer> totalOrders = new LinkedHashMap<>();

        String sql = "SELECT order_date, COUNT(*) AS totalOrders "
                + "FROM [Order] o INNER JOIN Order_Information i on o.order_id = i.order_id "
                + "WHERE order_date BETWEEN ? AND ? ";
        sql += (sales_id.isBlank()) ? "" : "AND sales_id = ?";
        sql += "GROUP BY order_date";

        try {
            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(end);
            cal.add(Calendar.DATE, +1);
            java.sql.Date oneDayBeforeEnd = new java.sql.Date(cal.getTimeInMillis());
            
            stm.setDate(2, oneDayBeforeEnd);
            if (!sales_id.isBlank()){
                stm.setString(3, sales_id);
            }
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Date date = rs.getDate("order_date");
                int count = rs.getInt("totalOrders");

                totalOrders.put(date, count);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return totalOrders;
    }

    public Map<Date, Float> getPrice(Date start, Date end, String sales_id) {
        Map<Date, Float> prices = new HashMap<>();

        String sql = "SELECT order_date, price FROM [Order] WHERE order_date BETWEEN ? AND ?";
        sql += (sales_id.isBlank()) ? "" : "AND sales_id = ?";
        try {
            // Prepare the statement
            stm = connection.prepareStatement(sql);

            // Set the parameters as java.sql.Date
            stm.setDate(1, new java.sql.Date(start.getTime()));
            stm.setDate(2, new java.sql.Date(end.getTime()));
            if (!sales_id.isBlank()){
                stm.setString(3, sales_id);
            }
            // Execute the query
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                // Convert java.sql.Date back to java.util.Date
                Date orderDate = rs.getDate("order_date");
                Float price = rs.getFloat("price");

                // Put the date and price into the map
                prices.put(orderDate, price);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return prices;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new Slider(
                rs.getInt("slider_id"),
                rs.getString("title"),
                rs.getString("details"),
                rs.getString("images"),
                rs.getString("backlink"),
                rs.getInt("status"),
                rs.getInt("user_id")
        );
    }

    public static void main(String[] args) {
        // Assuming you have a UserDAO instance and a connection
        OrderDAO userDAO = new OrderDAO();
        // Assuming you have a user id
        int userId = 1;

        // Call the getOrderUser method
        Vector<Order> orders = userDAO.getOrderUser(1);

        // Print out the orders
        for (Order order : orders) {
            System.out.println("Order ID: " + order.getOrder_id());
            System.out.println("Order Date: " + order.getOrder_date());
            System.out.println("Order Name: " + order.getOrder_name());
            System.out.println("Total Price: " + order.getTotal_price());
            System.out.println("Status: " + order.getStatus());

            System.out.println();
        }
    }
}
