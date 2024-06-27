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
 * @author ASUS
 */
public class AssinDAO extends EntityDAO {

    public boolean checkAuth(User u, int order_id) {

        //if user id is not sale/sale manager, return false immidiately
        if (u.getRole().getRole_id() != 2 && u.getRole().getRole_id() != 4) {
            return false;
        }
        //if user is sale manager, return true
        if (u.getRole().getRole_id() == 2) {
            return true;
        }
        try {
            //otherwise, perform if current user has being assigned or not
            String sql = "SELECT * FROM [SaleAssign] where user_id = ? and order_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, u.getUserId());
            stm.setInt(2, order_id);
            rs = stm.executeQuery();
            if (rs.next()){
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssinDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
