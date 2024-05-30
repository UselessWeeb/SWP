package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;
import model.Laptop;
import model.Order;
import model.OrderItem;
import model.Order_Information;
import model.Slider;
import model.User;

public class OrderDetailDAO extends EntityDAO {

//    public Vector<Order_Information> getOrderDetail(int orderId) {
//        Vector<Order_Information> vector = new Vector<>();
//        String sql = "SELECT oi.information_id, u.full_name, u.address, u.email, u.phone_number, l.title, o.order_date, l.original_price, o.quantity "
//                + "FROM [Order_Information] oi "
//                + "INNER JOIN [Laptop] l ON oi.laptop_id = l.laptop_id "
//                + "INNER JOIN [User] u ON oi.user_id = u.user_id "
//                + "INNER JOIN [Order] o ON oi.information_id = o.information_id "
//                + "WHERE o.order_id = ?";
//        try (PreparedStatement stm = connection.prepareStatement(sql)) {
//            stm.setInt(1, orderId);
//            try (ResultSet rs = stm.executeQuery()) {
//                while (rs.next()) {
//                    int in4_id = rs.getInt(1);
//                    String fname = rs.getString(2);
//                    String address = rs.getString(3);
//                    String email = rs.getString(4);
//                    String phone = rs.getString(5);
//                    String title = rs.getString(6);
//                    Date date = rs.getDate(7);
//                    float price = rs.getFloat(8);
//                    int quality = rs.getInt(9);
//
//                    Order_Information oi = new Order_Information();
//                    oi.setIn4_id(in4_id);
//
//                    User u = new User();
//                    u.setFullName(fname);
//                    u.setAddress(address);
//                    u.setEmail(email);
//                    u.setPhoneNumber(phone);
//                    oi.setUser(u);
//
//                    Laptop l = new Laptop();
//                    l.setTitle(title);
//                    l.setOriginalPrice(price);
//                    oi.setLaptop(l);
//
//                    Order o = new Order();
//                    o.setOrder_date(date);
//                    o.setQuality(quality);
//                    oi.setOrder(o);
//
//                    vector.add(oi);
//                }
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//
//        return vector;
//    }
    public Vector<OrderItem> getOrderDetail(int orderId) {
    Vector<OrderItem> vector = new Vector<>();
    String sql = "SELECT oi.order_item_id, oi.order_id, oi.laptop_id, oi.quantity, oi.price "
            + "FROM [Order_Item] oi "
            + "INNER JOIN [Order] o ON oi.order_id = o.order_id "
            + "WHERE oi.order_id = ?";
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        stm.setInt(1, orderId);
        try (ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                int orderItemId = rs.getInt(1);
                int orderID = rs.getInt(2);
                int laptopID = rs.getInt(3);
                int quantity = rs.getInt(4);
                float price = rs.getFloat(5);

                // Retrieve the Laptop object from the database using the getLaptopById method
               LaptopDAO ldao = new LaptopDAO();
                Laptop laptop = ldao.getLaptopById(laptopID);

                OrderItem oi = new OrderItem();
                oi.setOrderItemId(orderItemId);
                oi.setLaptopId(laptop);
                oi.setQuantity(quantity);
                oi.setPrice(price);

                vector.add(oi);
            }
        }
    } catch (SQLException e) {
        System.out.println(e);
    }

    return vector;
}


    public static void main(String[] args) {
        // Khởi tạo OrderDAO và kết nối cơ sở dữ liệu
        OrderDetailDAO orderDAO = new OrderDetailDAO();
        // Giả sử bạn có một order ID cần kiểm tra
        int orderId = 1;

        // Gọi phương thức getOrderDetail
        Vector<OrderItem> orderItems = orderDAO.getOrderDetail(orderId);

        // In ra thông tin của các order item
        for (OrderItem orderItem : orderItems) {
            System.out.println("Order Item ID: " + orderItem.getOrderItemId());
            System.out.println("Order ID: " + orderItem.getOrderId());
            System.out.println("laptop ID: " + orderItem.getLaptopId().getLaptopId());

            System.out.println();
        }
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

   

}
