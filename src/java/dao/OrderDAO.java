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
import java.util.Date;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Laptop;
import model.Order;
import model.Slider;

/**
 *
 * @author vudai
 */
public class OrderDAO extends EntityDAO {

//    public Vector<Order> getOrderUser(int id) {
//        Vector<Order> vector = new Vector<>();
//        String sql = "select o.order_id, o.order_date, l.title, l.original_price, o.quantity, o.status "
//                + "from [Order] o "
//                + "inner join [Laptop] l on l.laptop_id = o.laptop_id "
//                + "where o.user_id = ?";
//        try {
//            stm = connection.prepareStatement(sql);
//            stm.setInt(1, id);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                int orderid = rs.getInt(1);
//                Date orderdate = rs.getDate(2);
//                String product = rs.getString(3);
//                float price = rs.getFloat(4);
//                int quality = rs.getInt(5);
//                int status = rs.getInt(6);
//
//                Order o = new Order();
//                o.setOrder_id(orderid);
//                o.setOrder_date(orderdate);                
//                o.setStatus(status);
//
//                Laptop l = new Laptop();
//                l.setTitle(product);
//                l.setOriginalPrice(price);
//                o.setLaptop(l);
//
//                vector.add(o);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return vector;
//    }

   
    public Vector<Order> getOrderUser(int id) {
    Vector<Order> vector = new Vector<>();
    String sql = "SELECT [order_id], [order_date], [status], [price], [user_id] " +
                 "FROM [Order] " +
                 "WHERE [user_id] = ?";
    try {
        stm = connection.prepareStatement(sql);
        stm.setInt(1, id);
        rs = stm.executeQuery();
        while (rs.next()) {
            int orderid = rs.getInt("order_id");
            Date orderdate = rs.getDate("order_date");
            int status = rs.getInt("status");
            float price = rs.getFloat("price");
            int userId = rs.getInt("user_id");

            Order o = new Order();
            o.setOrder_id(orderid);
            o.setOrder_date(orderdate);
            o.setStatus(status);
            o.setTotal_price(price);
            o.setUser_id(userId);

            vector.add(o);
        }
    } catch (SQLException ex) {
        Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        // Close the resources
        try {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    return vector;
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
