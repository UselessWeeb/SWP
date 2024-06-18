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

    public int count() {
        try {
            int count = 0;
            String sqlQuery = "Select * from [Order]";
            stm = connection.prepareStatement(sqlQuery);
            rs = stm.executeQuery();
            while (rs.next()) {
                count++;
            }
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;//not found
    }

    public List<Order> getOrderPage(int page, int totalPerPage, String order_by, String search_query) {
        List<Order> result = new ArrayList<>();
        try {
            String sqlQuery = "SELECT * \n"
                    + "FROM   Laptop INNER JOIN\n"
                    + "             [Order] ON Laptop.laptop_id = [Order].laptop_id INNER JOIN\n"
                    + "             [User] ON [Order].user_id = [User].user_id";
            //select the order_by, and default to updated_date is null
            sqlQuery += " ORDER BY " + (order_by.isBlank() ? "order_date" : order_by);
            sqlQuery += (!search_query.isBlank()) ? " WHERE [User].fullname LIKE ?" : "";
            //lastly, adding pagination
            sqlQuery += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            System.out.println(sqlQuery);
            stm = connection.prepareStatement(sqlQuery);
            //adding param index
            int paramIndex = 1;
            if (!search_query.isBlank()) {
                stm.setString(paramIndex, search_query);
                paramIndex++;
            }
            //for default, both page and total page is the last
            //limit how many record per pagination
            stm.setInt(paramIndex, page * totalPerPage);
            paramIndex++;
            //showing skip how many records(stimulate pagination)
            stm.setInt(paramIndex, totalPerPage);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order order = (Order) this.createEntity(rs);
                result.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
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
        return new Order(
                rs.getInt("order_id"),
                rs.getTimestamp("order_date"),
                rs.getString("order_name"),
                rs.getInt("status"),
                rs.getInt("quantity"),
                rs.getInt("user_id"),
                rs.getInt("laptop_id")
        );
        
    }
}
