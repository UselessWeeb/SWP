/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author M7510
 */
public abstract class EntityDAO extends DBContext{
    public PreparedStatement stm;
    public ResultSet rs;
    
    public abstract Object createEntity(ResultSet rs) throws SQLException;
}
