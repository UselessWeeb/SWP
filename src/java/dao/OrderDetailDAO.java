package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;
import model.Laptop;
import model.Order;
import model.Order_Information;
import model.Slider;
import model.User;

public class OrderDetailDAO extends EntityDAO {

    public Vector<Order_Information> getOrderDetail(int orderId) {
        Vector<Order_Information> vector = new Vector<>();
        String sql = "SELECT oi.information_id, u.full_name, u.address, u.email, u.phone_number, l.title, o.order_date, l.original_price, o.quantity "
                + "FROM [Order_Information] oi "
                + "INNER JOIN [Laptop] l ON oi.laptop_id = l.laptop_id "
                + "INNER JOIN [User] u ON oi.user_id = u.user_id "
                + "INNER JOIN [Order] o ON oi.information_id = o.information_id "
                + "WHERE o.order_id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, orderId);
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    int in4_id = rs.getInt(1);
                    String fname = rs.getString(2);
                    String address = rs.getString(3);
                    String email = rs.getString(4);
                    String phone = rs.getString(5);
                    String title = rs.getString(6);
                    Date date = rs.getDate(7);
                    float price = rs.getFloat(8);
                    int quality = rs.getInt(9);

                    Order_Information oi = new Order_Information();
                    oi.setIn4_id(in4_id);

                    User u = new User();
                    u.setFullName(fname);
                    u.setAddress(address);
                    u.setEmail(email);
                    u.setPhoneNumber(phone);
                    oi.setUser(u);

                    Laptop l = new Laptop();
                    l.setTitle(title);
                    l.setOriginalPrice(price);
                    oi.setLaptop(l);

                    Order o = new Order();
                    o.setOrder_date(date);
                    o.setQuality(quality);
                    oi.setOrder(o);

                    vector.add(oi);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return vector;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

