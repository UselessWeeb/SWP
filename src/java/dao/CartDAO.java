package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import model.CartItemModel;
import model.Laptop;
import model.User;
import service.CartStrategy;

public class CartDAO extends EntityDAO implements CartStrategy {

    //because user should be here
    User u;

    public CartDAO(User u) {
        this.u = u;
    }

    //cheack if user already has a cart. If yes, return the id, if not, create a new cart and return the id
    public int getCartId() {
        try {
            String query = "SELECT cart_id FROM cart WHERE user_id = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, u.getUserId());
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(this.getCartId());
            } else {
                query = "INSERT INTO cart (user_id) VALUES (?)";
                stm = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
                stm.setInt(1, u.getUserId());
                stm.executeUpdate();
                rs = stm.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        int itemId = rs.getInt("item_id");
        int cartId = rs.getInt("cart_id");
        int laptopId = rs.getInt("laptop_id");
        int quantity = rs.getInt("quantity");
        return new CartItemModel(itemId, cartId, laptopId, quantity);
    }

    @Override
    public void addToCart(Laptop laptop, int quantity) {
        try {
            String query = "INSERT INTO cart_item (cart_id, laptop_id, quantity) VALUES (?, ?, ?)";
            stm = connection.prepareStatement(query);
            stm.setInt(1, this.getCartId()); // Assuming userId is available in this context
            stm.setInt(2, laptop.getLaptopId());
            stm.setInt(3, quantity);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void overrideCart(Laptop laptop, int quantity) {
        try {
            String query = "UPDATE cart_item SET quantity = ? WHERE cart_id = ? AND laptop_id = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, quantity);
            stm.setInt(2, this.getCartId()); // Assuming userId is available in this context
            stm.setInt(3, laptop.getLaptopId());
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteFromCart(Laptop laptop) {
        try {
            String query = "DELETE FROM cart_item WHERE cart_id = ? AND laptop_id = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, this.getCartId()); // Assuming userId is available in this context
            stm.setInt(2, laptop.getLaptopId());
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public HashMap<Laptop, Integer> getCart() {
        HashMap<Laptop, Integer> cart = new HashMap<>();
        try {
            String query = "SELECT * FROM cart_item WHERE cart_id = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, this.getCartId());
            rs = stm.executeQuery();
            while (rs.next()) {
                Laptop laptop = new LaptopDAO().getByID(rs.getString("laptop_id"));
                int quantity = rs.getInt("quantity");
                cart.put(laptop, quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }
}
