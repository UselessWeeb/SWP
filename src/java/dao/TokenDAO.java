/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.Token;

/**
 *
 * @author phamn
 */
public class TokenDAO extends EntityDAO {

    public Token getToken(String token) {
        String sql = "SELECT * FROM [Token] WHERE tokenString = ?";
        Token newToken = null;

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, token);
            rs = stm.executeQuery();

            if (rs.next()) {
                newToken = (Token) this.createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return newToken;
    }

    public void deleteToken(String token) {
        String sql = "DELETE FROM [Token] WHERE tokenString = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, token);

            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addNewToken(Token inputToken) {
        String sql = "Insert into [Token] values(?,?,?,?)";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, inputToken.getUserID());
            stm.setString(2, inputToken.getTokenString());
            stm.setTimestamp(3, inputToken.getExpireDateAsSqlTimestamp());
            stm.setInt(4, inputToken.getPurpose());

            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean checkIfTokenExist(String inputToken) {
        String sql = "Select 1 from [Token] where tokenString = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, inputToken);

            rs = stm.executeQuery();
            
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new Token(
                rs.getString("tokenString"),
                rs.getInt("userid"),
                rs.getTimestamp("expireDate").toLocalDateTime(),
                rs.getInt("purpose")
        );
    }
}