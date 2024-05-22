/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.Slider;

/**
 *
 * @author vudai
 */
public class OrderDAO extends EntityDAO {

    public Vector<Order> getOrderUser(int id) {
        Vector<Order> vector = new Vector<Order>();
        String sql = "select * from [Order] where user_id = ?";
        PreparedStatement pre;
        try {
            pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int orderid = rs.getInt(1);
                Date orderdate = rs.getDate(2);
                String orderName = rs.getString(3);
                Float price = rs.getFloat(4);
                int status = rs.getInt(5);
                int quality = rs.getInt(6);
                int userid = rs.getInt(7);
                int in4id = rs.getInt(8);
                int lapid = rs.getInt(9);
                Order order = new Order(orderid, orderdate, orderName, price, quality, status, userid, in4id, lapid);
                vector.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
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
}
