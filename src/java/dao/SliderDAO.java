/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Slider;

/**
 *
 * @author M7510
 */
public class SliderDAO extends EntityDAO {

    public List<Slider> findAll() {
        List<Slider> sliders = new ArrayList<>();
        try {
            String strSelect = "SELECT * FROM Slider";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                Slider slider = (Slider) this.createEntity(rs);
                sliders.add(slider);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sliders;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new Slider(
                rs.getInt("slider_id"),
                rs.getString("title"),
                rs.getString("details"),
                rs.getString("images"),
                rs.getString("backlink"),
                rs.getInt("status"),
                rs.getInt("user_id")
        );
    }
}
