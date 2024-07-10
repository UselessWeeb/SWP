/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;
import model.Order_User;

/**
 *
 * @author M7510
 */
public class OrderUserDAO extends EntityDAO {

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        Order_User orderUser = new Order_User();
        orderUser.setOrderUid(rs.getInt("order_uid"));
        orderUser.setFullname(rs.getString("fullname"));
        orderUser.setAddress(rs.getString("address"));
        orderUser.setPhoneNumber(rs.getString("phone_number"));
        orderUser.setEmail(rs.getString("email"));
        orderUser.setAddInfo(rs.getString("add_info"));
        orderUser.setGender(rs.getString("gender"));

        return orderUser;
    }

    public Order_User getById(int orderUid) {
        String query = "SELECT * FROM Order_User WHERE order_uid = ?";
        try {
            stm = connection.prepareStatement(query);
            stm.setInt(1, orderUid);
            rs = stm.executeQuery();
            if (rs.next()) {
                return (Order_User) createEntity(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Order_User getUserByEmail(String email) {
        String query = "SELECT * FROM Order_User WHERE email = ?";
        try {
            stm = connection.prepareStatement(query);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                return (Order_User) createEntity(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void insertOrderUser(Order_User orderUser) {
        String query = "INSERT INTO Order_User (fullname, address, phone_number, email, add_info, gender) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            stm = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, orderUser.getFullname());
            stm.setString(2, orderUser.getAddress());
            stm.setString(3, orderUser.getPhoneNumber());
            stm.setString(4, orderUser.getEmail());
            stm.setString(5, orderUser.getAddInfo());
            stm.setString(6, orderUser.getGender());

            int affectedRows = stm.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating order user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stm.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    orderUser.setOrderUid(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating order user failed, no ID obtained.");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
