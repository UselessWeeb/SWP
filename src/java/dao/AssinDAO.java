/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.SaleAssign;
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
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssinDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void addAuth(int order_id, int sale_id) {
        try {
            //first, check if one order with a  sale already exist
            if (isExist(order_id)) {
                //perform to delete
                deleteAssign(order_id);
            }
            //perform add
            String sql = "INSERT INTO SaleAssign VALUES (?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, sale_id);
            stm.setInt(2, order_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AssinDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean isExist(int order_id) {
        try {
            String sql = "SELECT * FROM SaleAssign WHERE order_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);
            rs = stm.executeQuery();
            if (rs.next()) {
                //record exist, return true
                return true;
            }
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(AssinDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void deleteAssign(int order_id) {
        try {
            String sql = "DELETE FROM SaleAssign WHERE order_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AssinDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int SalesEditId(int order_id) {
        try {
            String sql = "select user_id from SaleAssign WHERE order_id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);
            rs = stm.executeQuery();
            if(rs.next()){
                return rs.getInt("user_id");
            }
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(AssinDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
