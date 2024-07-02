/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.UserAuthModel;

/**
 *
 * @author M7510
 */
public class UserAuthDAO extends EntityDAO{
    //basic crud
    public void create(UserAuthModel entity) {
        //create userauth, via table UserAuth in sql with ResultSet rs and PreparedStatement stm already included in EntityDAO
        String sql = "INSERT INTO User_Authorization (url, role_id) VALUES (?, ?)";
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
        String sql = "SELECT * FROM User_Authorization WHERE auth_id = ?";
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
        String sql = "SELECT * FROM User_Authorization WHERE url = ?";
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
        String sql = "UPDATE User_Authorization SET url = ?, role_id = ? WHERE auth_id = ?";
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
        String sql = "DELETE FROM User_Authorization WHERE auth_id = ?";
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
        String sql = "SELECT * FROM User_Authorization WHERE url = ?";
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
        String sql = "SELECT url FROM User_Authorization WHERE role_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, role_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                String authorizedUrl = rs.getString("url");
                // Check if the accessed URL starts with the authorized URL
                if (url.startsWith(authorizedUrl)) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public void UpdateAuth(int[] roleIds, String url) {
        // Assuming connection is your database connection object
        String mergeSql = "MERGE INTO User_Authorization AS target " +
                        "USING (VALUES (? , ?)) AS source (role_id, url) " +
                        "ON target.role_id = source.role_id AND target.url = source.url " +
                        "WHEN MATCHED THEN " +
                        "UPDATE SET target.url = source.url " + // This line might be redundant if URLs are always the same
                        "WHEN NOT MATCHED THEN " +
                        "INSERT (role_id, url) VALUES (source.role_id, source.url);";

        try (PreparedStatement stm = connection.prepareStatement(mergeSql)) {
            for (int roleId : roleIds) {
                stm.setInt(1, roleId);
                stm.setString(2, url);
                stm.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Delete roles not in the new list
        String deleteSql = "DELETE FROM User_Authorization WHERE url = ? AND role_id NOT IN (" + Arrays.toString(roleIds).replace("[", "").replace("]", "") + ")";
        try (PreparedStatement stm = connection.prepareStatement(deleteSql)) {
            stm.setString(1, url);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Integer> getRoleForURL(String url){
        //get role for url
        List<Integer> roles = new ArrayList<>();
        String sql = "SELECT role_id FROM User_Authorization WHERE url = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, url);
            rs = stm.executeQuery();
            while (rs.next()) {
                roles.add(rs.getInt("role_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roles;
    }

    public List<String> getURLForRole(int role_id){
        //get url for role
        List<String> urls = new ArrayList<>();
        String sql = "SELECT url FROM User_Authorization WHERE role_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, role_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                urls.add(rs.getString("url"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return urls;
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
