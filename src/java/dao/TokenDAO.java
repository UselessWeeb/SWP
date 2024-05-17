/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Token;

/**
 *
 * @author phamn
 */
public class TokenDAO extends EntityDAO {

    public Token getByToken(String token) {
        String sql = "SELECT * FROM [TokenTable] WHERE token = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, token);
            rs = stm.executeQuery();

            while (rs.next()) {
                return new Token(rs.getString("token"),
                        rs.getInt("userID"),
                        rs.getTimestamp("expireDate").toLocalDateTime(),
                        rs.getInt("purpose")
                );
            }
        } catch (SQLException e) {
            Logger.getLogger(TokenDAO.class.getName())
                    .log(Level.SEVERE, "Exception thrown while getting token", e);
        }

        return null;
    }

    public void deleteToken(String token) {
        String sql = "DELETE FROM [TokenTable] WHERE token = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, token);
            stm.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(TokenDAO.class.getName())
                    .log(Level.SEVERE, "Exception thrown while deleting token", e);
        }
    }

    public void addNewToken(Token inputToken) {
        String sql = "INSERT INTO [TokenTable] VALUES(?,?,?,?)";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, inputToken.getTokenString());
            stm.setInt(2, inputToken.getUserID());
            stm.setTimestamp(3, inputToken.getExpireDateAsSqlTimestamp());
            stm.setInt(4, inputToken.getPurpose());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TokenDAO.class.getName())
                    .log(Level.SEVERE, "Exception thrown while adding token", ex);
        }

    }
}
