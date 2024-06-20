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
            String query = "SELECT cart_id FROM Carts WHERE user_id = ?";
            stm = connection.prepareStatement(query);
            stm.setInt(1, u.getUserId());
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                query = "INSERT INTO Carts (user_id) VALUES (?)";
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
            // Check if the product already exists in the cart
            String checkQuery = "SELECT quantity FROM cart_items WHERE cart_id = ? AND laptop_id = ?";
            PreparedStatement checkStm = connection.prepareStatement(checkQuery);
            checkStm.setInt(1, this.getCartId());
            checkStm.setInt(2, laptop.getLaptopId());

            ResultSet rs = checkStm.executeQuery();

            if (rs.next()) {
                // If the product exists, update the quantity
                int existingQuantity = rs.getInt(1);
                String updateQuery = "UPDATE cart_items SET quantity = ? WHERE cart_id = ? AND laptop_id = ?";
                PreparedStatement updateStm = connection.prepareStatement(updateQuery);
                updateStm.setInt(1, existingQuantity + quantity);
                updateStm.setInt(2, this.getCartId());
                updateStm.setInt(3, laptop.getLaptopId());
                updateStm.executeUpdate();
            } else {
                // If the product doesn't exist, insert a new row
                String insertQuery = "INSERT INTO cart_items (cart_id, laptop_id, quantity) VALUES (?, ?, ?)";
                PreparedStatement insertStm = connection.prepareStatement(insertQuery);
                insertStm.setInt(1, this.getCartId());
                insertStm.setInt(2, laptop.getLaptopId());
                insertStm.setInt(3, quantity);
                insertStm.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void overrideCart(Laptop laptop, int quantity) {
        try {
            String query = "UPDATE cart_items SET quantity = ? WHERE cart_id = ? AND laptop_id = ?";
            PreparedStatement updateStm = connection.prepareStatement(query);
            updateStm.setInt(1, quantity);
            updateStm.setInt(2, this.getCartId()); // Assuming userId is available in this context
            updateStm.setInt(3, laptop.getLaptopId());
            updateStm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteFromCart(Laptop laptop) {
        try {
            String query = "DELETE FROM cart_items WHERE cart_id = ? AND laptop_id = ?";
            PreparedStatement deleteStm = connection.prepareStatement(query);
            deleteStm.setInt(1, this.getCartId()); // Assuming userId is available in this context
            deleteStm.setInt(2, laptop.getLaptopId());
            deleteStm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public HashMap<Laptop, Integer> getCart() {
        HashMap<Laptop, Integer> cart = new HashMap<>();
        try {
            String query = "SELECT * FROM cart_items WHERE cart_id = ?";
            PreparedStatement listStm = connection.prepareStatement(query);
            listStm.setInt(1, this.getCartId());
            ResultSet rs = listStm.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString(3));
                Laptop laptop = new LaptopDAO().getByID(rs.getString(3));
                int quantity = rs.getInt("quantity");
                cart.put(laptop, quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }
}
