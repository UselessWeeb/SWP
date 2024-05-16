/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import model.User;

/**
 *
 * @author M7510
 */
public class UserDAO extends EntityDAO {

    public User Login(String email, String password) {
        try {
            String strSelect = "Select * from [user] where email = ? and password = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("idUser"),
                        rs.getString("fullname"),
                        rs.getString("email"),
                        rs.getString("diachi"),
                        rs.getString("phoneNum"),
                        rs.getInt("role"),
                        rs.getString("gender"),
                        rs.getInt("point"),
                        rs.getString("state"),
                        rs.getString("password"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void registerUser(User inputUser) {
        String sql = "insert into [user] values(?,?,?,?,?,?,?,?,?)";

        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            stm.setString(1, inputUser.getFullname());
            stm.setString(2, inputUser.getEmail());
            stm.setString(3, inputUser.getDiaChi());
            stm.setString(4, inputUser.getPhoneNum());
            stm.setInt(5, inputUser.getRole());
            stm.setString(6, inputUser.getGender());
            stm.setInt(7, inputUser.getPoint());
            stm.setString(8, inputUser.getState());
            stm.setString(9, inputUser.getPassword());

            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
