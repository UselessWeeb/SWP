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
import java.util.Date;
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
