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
import java.util.Collections;
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
            String sqlQuery = "Select 1 from [Order]";
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

    public Order getByOrderId(int orderId) {
        try {
            String sqlQuery = "SELECT * FROM [Order] WHERE order_id = ?";
            stm = connection.prepareStatement(sqlQuery);
            stm.setInt(1, orderId);
            rs = stm.executeQuery();
            if (rs.next()) {
                return (Order) this.createEntity(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;//not found
    }

    public List<Order> getOrderPage(int page, int totalPerPage, String order_by, String direction, String search_query, Date start, Date end, String status, String[] selectedLaptopId) {
        List<Order> result = new ArrayList<>();
        try {
            String sqlQuery = "SELECT [Order].*, Order_User.*, MinOrderItem.* FROM [Order] INNER JOIN Order_User ON [Order].order_uid = Order_User.order_uid INNER JOIN (SELECT Order_Item.*, Order_Item.laptop_id as laptopId, MIN(Order_Item.order_item_id) OVER (PARTITION BY Order_Item.order_id) as min_order_item_id FROM Order_Item) as MinOrderItem ON [Order].order_id = MinOrderItem.order_id WHERE MinOrderItem.order_item_id = MinOrderItem.min_order_item_id";
            if (search_query != null && !search_query.isBlank()) {
                try {
                    int id = Integer.parseInt(search_query);
                    sqlQuery += " AND [Order].order_id = ?";
                } catch (NumberFormatException e) {
                    sqlQuery += " AND Order_User.fullname LIKE ?";
                }
            }
            if (start != null) {
                sqlQuery += " AND order_date >= ?";
            }
            if (end != null) {
                Calendar c = Calendar.getInstance();
                c.setTime(end);
                c.add(Calendar.DAY_OF_MONTH, 1);
                end = c.getTime();
                sqlQuery += " AND order_date < ?";
            }
            if (status != null && !status.isBlank()) {
                sqlQuery += " AND status = ?";
            }
            if (selectedLaptopId != null && selectedLaptopId.length > 0) {
                sqlQuery += " AND MinOrderItem.laptopId IN (" + String.join(",", Collections.nCopies(selectedLaptopId.length, "?")) + ")";
            }
            sqlQuery += " ORDER BY " + ((order_by == null || order_by.isBlank()) ? "[Order].order_date" : order_by);
            sqlQuery += " " + ((direction != null && direction.equalsIgnoreCase("desc")) ? "DESC" : "ASC");
            sqlQuery += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            PreparedStatement stm = connection.prepareStatement(sqlQuery);
            int paramIndex = 1;
            if (search_query != null && !search_query.isBlank()) {
                try {
                    int id = Integer.parseInt(search_query);
                    stm.setInt(paramIndex++, id);
                } catch (NumberFormatException e) {
                    stm.setString(paramIndex++, "%" + search_query + "%");
                }
            }
            if (start != null) {
                stm.setDate(paramIndex++, new java.sql.Date(start.getTime()));
            }
            if (end != null) {
                stm.setDate(paramIndex++, new java.sql.Date(end.getTime()));
            }
            if (status != null && !status.isBlank()) {
                stm.setString(paramIndex++, status);
            }
            if (selectedLaptopId != null && selectedLaptopId.length > 0) {
                for (String laptopId : selectedLaptopId) {
                    stm.setString(paramIndex++, laptopId);
                }
            }
            stm.setInt(paramIndex++, page * totalPerPage);
            stm.setInt(paramIndex++, totalPerPage);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = (Order) this.createEntity(rs);
                result.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int countByCriteria(String search_query, Date start, Date end, String status, String[] selectedLaptopId) {
        try {
            String sqlQuery = "SELECT COUNT(*) FROM (SELECT DISTINCT [Order].order_id FROM [Order] INNER JOIN Order_User ON [Order].order_uid = Order_User.order_uid INNER JOIN (SELECT Order_Item.*, Order_Item.laptop_id as laptopId, MIN(Order_Item.order_item_id) OVER (PARTITION BY Order_Item.order_id) as min_order_item_id FROM Order_Item) as MinOrderItem ON [Order].order_id = MinOrderItem.order_id WHERE MinOrderItem.order_item_id = MinOrderItem.min_order_item_id";
            if (search_query != null && !search_query.isBlank()) {
                try {
                    int id = Integer.parseInt(search_query);
                    sqlQuery += " AND [Order].order_id = ?";
                } catch (NumberFormatException e) {
                    sqlQuery += " AND Order_User.fullname LIKE ?";
                }
            }
            if (start != null) {
                sqlQuery += " AND order_date >= ?";
            }
            if (end != null) {
                Calendar c = Calendar.getInstance();
                c.setTime(end);
                c.add(Calendar.DAY_OF_MONTH, 1);
                end = c.getTime();
                sqlQuery += " AND order_date < ?";
            }
            if (status != null && !status.isBlank()) {
                sqlQuery += " AND status = ?";
            }
            if (selectedLaptopId != null && selectedLaptopId.length > 0) {
                sqlQuery += " AND MinOrderItem.laptopId IN (" + String.join(",", Collections.nCopies(selectedLaptopId.length, "?")) + ")";
            }
            sqlQuery += ") as CountQuery";
            PreparedStatement stm = connection.prepareStatement(sqlQuery);
            int paramIndex = 1;
            if (search_query != null && !search_query.isBlank()) {
                try {
                    int id = Integer.parseInt(search_query);
                    stm.setInt(paramIndex++, id);
                } catch (NumberFormatException e) {
                    stm.setString(paramIndex++, "%" + search_query + "%");
                }
            }
            if (start != null) {
                stm.setDate(paramIndex++, new java.sql.Date(start.getTime()));
            }
            if (end != null) {
                stm.setDate(paramIndex++, new java.sql.Date(end.getTime()));
            }
            if (status != null && !status.isBlank()) {
                stm.setString(paramIndex++, status);
            }
            if (selectedLaptopId != null && selectedLaptopId.length > 0) {
                for (String laptopId : selectedLaptopId) {
                    stm.setString(paramIndex++, laptopId);
                }
            }
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public Map<Date, Integer> getSuccessOrders(Date start, Date end, String sales_id) throws SQLException {
        Map<Date, Integer> successOrders = new LinkedHashMap<>();

        String sql = "SELECT order_date, COUNT(*) AS successOrders "
                + "FROM [Order] "
                + "WHERE status = 3 AND order_date BETWEEN ? AND ? ";
        //a sales can't be consider success if no sales_id found
        sql += (sales_id.isBlank()) ? "AND sales_id IS NOT NULL " : " AND sales_id = ? ";
        sql += "GROUP BY order_date";
        try {
            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));
            Calendar cal = Calendar.getInstance();
            cal.setTime(end);
            cal.add(Calendar.DATE, +1);
            java.sql.Date oneDayBeforeEnd = new java.sql.Date(cal.getTimeInMillis());

            stm.setDate(2, oneDayBeforeEnd);
            if (!sales_id.isBlank()) {
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
                + "FROM [Order] "
                + "WHERE order_date BETWEEN ? AND ? ";
        sql += (sales_id.isBlank()) ? "AND sales_id IS NOT NULL " : "AND sales_id = ? ";
        sql += "GROUP BY order_date";

        try {
            stm = connection.prepareStatement(sql);
            stm.setDate(1, new java.sql.Date(start.getTime()));

            Calendar cal = Calendar.getInstance();
            cal.setTime(end);
            cal.add(Calendar.DATE, +1);
            java.sql.Date oneDayBeforeEnd = new java.sql.Date(cal.getTimeInMillis());

            stm.setDate(2, oneDayBeforeEnd);
            if (!sales_id.isBlank()) {
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
        sql += (sales_id.isBlank()) ? " AND sales_id IS NOT NULL" : " AND sales_id = ?";
        try {
            // Prepare the statement
            stm = connection.prepareStatement(sql);

            // Set the parameters as java.sql.Date
            stm.setDate(1, new java.sql.Date(start.getTime()));
            Calendar cal = Calendar.getInstance();
            cal.setTime(end);
            cal.add(Calendar.DATE, +1);
            java.sql.Date oneDayBeforeEnd = new java.sql.Date(cal.getTimeInMillis());

            stm.setDate(2, oneDayBeforeEnd);
            if (!sales_id.isBlank()) {
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

    public boolean validateOrder(int uid, int orderid) {
        try {
            String sql = "SELECT * FROM [Order] where order_id = ? and uid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderid);
            stm.setInt(2, uid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                //if the query returns result
                return true;
            }
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        //if it reaches here, return false
        return false;
    }

    public void UpdateOrder(int sales_id, int status, String notes, int order_id) {
        String sql = "UPDATE [Order] SET sales_id = ?, status = ?, notes = ? WHERE order_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, sales_id);
            stm.setInt(2, status);
            stm.setString(3, notes);
            stm.setInt(4, order_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new Order(
                rs.getInt("order_id"),
                rs.getTimestamp("order_date"),
                rs.getFloat("price"),
                rs.getInt("status"),
                rs.getInt("order_uid"),
                rs.getInt("sales_id")
        );
    }

    
    public int selectSales() {
        //this method find the sales to handle this order by selecting the first one with lowest order count
        try {
            String sql = "SELECT TOP 1 user_id as sales_id, COUNT([Order].order_id) FROM [User] JOIN [Order] ON [User].user_id = [Order].sales_id GROUP BY [User].user_id ORDER BY COUNT([Order].order_id) ASC";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("sales_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1; //no user matched
    }

    public void createOrder(Order order) {
        String sql = "INSERT INTO [Order] (order_date, price, status, order_uid, sales_id) VALUES (?, ?, ?, ?, ?)";
        try {
            stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setTimestamp(1, new java.sql.Timestamp(order.getOrder_date().getTime()));
            stm.setFloat(2, order.getPrice());
            stm.setInt(3, order.getStatus().ordinal());
            stm.setInt(4, order.getUser_id());
            stm.setInt(5, order.getSales_id());

            int affectedRows = stm.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stm.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    order.setOrder_id(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating order failed, no ID obtained.");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOrder(Order order) {
        try {
            String sql = "UPDATE [Order] SET status = ? WHERE order_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order.getStatus().ordinal());
            stm.setInt(2, order.getOrder_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
