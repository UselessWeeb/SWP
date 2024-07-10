/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.Role;

/**
 *
 * @author M7510
 */
public class RoleDAO extends EntityDAO{
    public Role getById(int role_id){
        Role r = null;
        try {
            String strSelect = "Select * from [Role] where role_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setInt(1, role_id);
            rs = stm.executeQuery();
            if (rs.next()) {
                r = (Role) this.createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return r;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new Role(
        rs.getInt(1),
        rs.getString(2)
        );
    }    
}
