/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author M7510
 */
public class UserDAO extends EntityDAO {

    public User Login(String email, String password) {
        User u = null;
        try {
            String strSelect = "SELECT * FROM [User] WHERE email = ? AND password = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                u = (User) this.createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }

    public User findById(String userId) {
        User u = null;
        try {
            String strSelect = "Select * from [user] where user_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, userId);
            rs = stm.executeQuery();
            if (rs.next()) {
                u = (User) this.createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }

    public int editCustomer(User u) {
        int n = 0;
        String sql = "UPDATE [User]\n"
                + "SET avatar = ?,\n"
                + "    full_name = ?,\n"
                + "    gender = ?,\n"
                + "    address = ?,\n"
                + "    phone_number = ? \n"
                + "WHERE user_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, u.getAvatar());
            stm.setString(2, u.getFullName());
            stm.setString(3, u.getGender());
            stm.setString(4, u.getAddress());
            stm.setString(5, u.getPhoneNumber());
            stm.setInt(6, u.getUserId());
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return n;
    }

    public int changePassword(int userId, String new_pass1) {
        int n = 0;
        try {
            String sql = "UPDATE [User]\n"
                    + "   SET \n"
                    + "      password = ?\n"
                    + " WHERE user_id = ?\n";
            stm = connection.prepareStatement(sql);
            stm.setString(1, new_pass1);
            stm.setInt(2, userId);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }
    
        public int checkUserPassword(int id, String password) {
        int n = 0;
        String sql = "SELECT * FROM [User] WHERE user_id = ? and password = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setString(2, password);
            ResultSet resultSet = stm.executeQuery();

            if (resultSet.next()) {
                // User with the given email exists
                n = 1;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return n;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new User(
                rs.getInt("user_id"),
                rs.getString("avatar"),
                rs.getString("full_name"),
                rs.getString("gender"),
                rs.getString("address"),
                rs.getString("email"),
                rs.getString("phone_number"),
                rs.getString("password"),
                rs.getString("state"),
                rs.getInt("role_id")
        );
    }
}
