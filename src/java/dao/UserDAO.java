/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            Logger.getLogger(UserDAO.class.getName())
                    .log(Level.SEVERE,
                            "Exception thrown while user login", e);
        }
        return u;
    }

    public User findById(String userId) {
        User u = null;
        try {
            String strSelect = "Select * from [user] where idUser = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, userId);
            rs = stm.executeQuery();
            if (rs.next()) {
                u = (User) this.createEntity(rs);
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName())
                    .log(Level.SEVERE,
                            "Exception thrown while getting user by ID", e);
        }
        return u;
    }

    public User findByEmail(String email) {
        User u = null;
        try {
            String strSelect = "Select * from [user] where idUser = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                u = (User) this.createEntity(rs);
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName())
                    .log(Level.SEVERE,
                            "Exception thrown while getting user by email", e);
        }
        return u;
    }

    public int getUserIdByEmail(String email) {
        int userID = -1;

        try {
            String strSelect = "Select * from [user] where idUser = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                userID = rs.getInt("user_id");
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName())
                    .log(Level.SEVERE,
                            "Exception thrown while getting user ID by email", e);
        }
        return userID;
    }

    public boolean checkIfUserExist(String userEmail) {
        String sql = "Select 1 from [User] where email = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, userEmail);

            rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName())
                    .log(Level.SEVERE,
                            "Exception thrown while check if token exist", ex);
        }

        return false;
    }

    public void registerUser(User inputUser) {
        String sql = "Insert into [User] values(?,?,?,?,?,?,?,?,?)";

        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            stm.setString(1, inputUser.getAvatar());
            stm.setString(2, inputUser.getFullName());
            stm.setString(3, inputUser.getGender());
            stm.setString(4, inputUser.getAddress());
            stm.setString(5, inputUser.getEmail());
            stm.setString(6, inputUser.getPhoneNumber());
            stm.setString(7, inputUser.getPassword());
            stm.setString(8, inputUser.getState());
            stm.setInt(9, inputUser.getRoleId());

            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName())
                    .log(Level.SEVERE,
                            "Exception thrown while register user", e);
        }
    }

    //TODO: CHECK AND FIX THIS IF NEEDED
    public void updateUserPassword(int userID, String password) {
        String sql = "Update [User] Set password = ? Where user_id = ?";

        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            stm.setInt(1, userID);
            stm.setString(2, password);

            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName())
                    .log(Level.SEVERE,
                            "Exception thrown while update user password", e);
        }
    }

    public void updateUserState(int userID, String state) {
        String sql = "Update [User] Set state = ? Where user_id = ?";

        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();

            stm.setInt(1, userID);
            stm.setString(2, state);

            stm.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName())
                    .log(Level.SEVERE,
                            "Exception thrown while update user password", e);
        }
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
