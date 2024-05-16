/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import model.VerificationToken;

/**
 *
 * @author phamn
 */
public class VerificationTokenDAO extends EntityDAO {

    public VerificationToken getByToken(String token) {
        String sql = "Select * from [VerificationToken] where token = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, token);
            rs = stm.executeQuery();

            while (rs.next()) {
                return new VerificationToken(rs.getInt("tokenID"),
                        rs.getString("token"),
                        rs.getInt("userID"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteToken(String token) {
        String sql = "Delete from [VerificationToken]_where token = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, token);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addNewToken(VerificationToken inputToken) {
        String sql = "insert into [VerificationToken] values(?,?)";
        
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, inputToken.getToken());
            stm.setInt(2, inputToken.getUserID());
            //TODO: ADD CREATEDATE TO STATEMENT

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
