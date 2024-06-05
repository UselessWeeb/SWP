/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;

/**
 *
 * @author M7510
 */
public class CartDAO extends EntityDAO {

    public List<Cart> getByUserId(int userId) {
        try {
            List<Cart> carts = new ArrayList<>();
            String sql = "SELECT * FROM Cart WHERE user_id = ?";
            
            stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            rs = stm.executeQuery();

            while (rs.next()) {
                Cart cart = (Cart) this.createEntity(rs);
                carts.add(cart);
            }
            return carts;
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new Cart(
                rs.getInt("cart_id"),
                rs.getInt("quantity"),
                rs.getInt("user_id"),
                rs.getInt("laptop_id"));
    }

}
