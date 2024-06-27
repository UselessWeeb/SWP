/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.UserAuthModel;

/**
 *
 * @author M7510
 */
public class UserAuthDAO extends EntityDAO{
    //basic crud
    public void create(UserAuthModel entity) {
        //create userauth, via table UserAuth in sql with ResultSet rs and PreparedStatement stm already included in EntityDAO
        String sql = "INSERT INTO UserAuth (url, role_id) VALUES (?, ?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, entity.getUrl());
            stm.setInt(2, entity.getRole_id());
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public UserAuthModel read(int id) {
        //read userauth, via table UserAuth in sql with ResultSet rs and PreparedStatement stm already included in EntityDAO
        String sql = "SELECT * FROM UserAuth WHERE auth_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                return (UserAuthModel) createEntity(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public UserAuthModel readByUrl(String url) {
        //read userauth by url, via table UserAuth in sql with ResultSet rs and PreparedStatement stm already included in EntityDAO
        String sql = "SELECT * FROM UserAuth WHERE url = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, url);
            rs = stm.executeQuery();
            if (rs.next()) {
                return (UserAuthModel) createEntity(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void update(UserAuthModel entity) {
        //update userauth, via table UserAuth in sql with ResultSet rs and PreparedStatement stm already included in EntityDAO
        String sql = "UPDATE UserAuth SET url = ?, role_id = ? WHERE auth_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, entity.getUrl());
            stm.setInt(2, entity.getRole_id());
            stm.setInt(3, entity.getAuth_id());
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        //delete userauth, via table UserAuth in sql with ResultSet rs and PreparedStatement stm already included in EntityDAO
        String sql = "DELETE FROM UserAuth WHERE auth_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //advanced function

    public boolean isAllowedAnyOneToAccess(String url) {
        //check if url is allowed to be accessed by anyone
        String sql = "SELECT * FROM UserAuth WHERE url = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, url);
            rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkIfCurrentUserAbleToAccess(String url, int role_id) {
        //check if current user is able to access url
        String sql = "SELECT * FROM UserAuth WHERE url = ? AND role_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, url);
            stm.setInt(2, role_id);
            rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new UserAuthModel(
            rs.getInt("auth_id"),
            rs.getString("url"),
            rs.getInt("role_id")
        );
    }
}
