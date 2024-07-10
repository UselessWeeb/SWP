/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

    public List<Role> getAll(){
        List<Role> roles = new ArrayList<>();
        try {
            String strSelect = "Select * from [Role]";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                roles.add((Role) this.createEntity(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return roles;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new Role(
        rs.getInt(1),
        rs.getString(2)
        );
    }    
}
