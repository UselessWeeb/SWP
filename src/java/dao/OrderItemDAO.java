/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.OrderItem;

/**
 *
 * @author M7510
 */
public class OrderItemDAO extends EntityDAO {
    public List<OrderItem> getByOrderId(int orderId) {
        List<OrderItem> orderItems = new ArrayList<>();
        try {
            String sqlQuery = "SELECT * FROM [Order_Item] WHERE order_id = ?";
            stm = connection.prepareStatement(sqlQuery);
            stm.setInt(1, orderId);
            rs = stm.executeQuery();
            while (rs.next()) {
                orderItems.add((OrderItem) this.createEntity(rs));
            }         
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return orderItems;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        LaptopDAO ldao = new LaptopDAO();
        OrderDAO odao = new OrderDAO();
        OrderItem orderItem = new OrderItem();
        orderItem.setOrderItemId(rs.getInt("order_item_id"));
        orderItem.setOrderId(odao.getByOrderId(rs.getInt("order_id")));
        orderItem.setLaptopId(ldao.getLaptopById(rs.getInt("laptop_id")));
        orderItem.setQuantity(rs.getInt("quantity"));
        orderItem.setPrice(rs.getFloat("price"));
        return orderItem;
    }
    
}
