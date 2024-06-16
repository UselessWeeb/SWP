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
import java.util.HashMap;
import java.util.List;
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

    public HashMap<Date, Integer> showSuccessOrder(Date start, Date end, User u) throws SQLException {
        HashMap<Date, Integer> success = new HashMap<>();
        String sql = "SELECT order_date, oi.state from [Order] o INNER JOIN Order_Information oi on o.order_id = oi.order_id WHERE oi.state = 1";
//        sql += "AND order_date IN (" + start + "," + end + ")";

        stm = connection.prepareStatement(sql);
        rs = stm.executeQuery();
        while (rs.next()) {
            success.put(rs.getDate(1), success.getOrDefault(rs.getDate(1), 0) + rs.getInt(2));
        }
        return success;
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
