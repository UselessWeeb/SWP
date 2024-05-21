package dao;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author vudai
 */
public class UserDAO extends EntityDAO {

    public int editUser(User user) {
        int n = 0;
        PreparedStatement pre;
        String sql = "UPDATE [User] SET full_name = ?, gender = ?, address = ?, phone_number = ?, avatar = ? WHERE user_id = ?";
        try {
            pre = connection.prepareStatement(sql);
            pre.setString(1, user.getFullName());
            pre.setString(2, user.getGender());
            pre.setString(3, user.getAddress());
            pre.setString(4, user.getPhoneNumber());
            pre.setString(5, user.getAvatar());
            pre.setInt(6, user.getUserId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int editCustomer(String avatar, String full_name, String gender, String address, String phoneNumber, int userId) {
        int n = 0;
        PreparedStatement pre;
        String sql = "UPDATE [User]\n"
                + "SET avatar = ?,\n"
                + "    full_name = ?,\n"
                + "    gender = ?,\n"
                + "    address = ?,\n"
                + "    phone_number = ? \n"
                + "WHERE user_id = ?";
        try {
            pre = connection.prepareStatement(sql);
            pre.setString(1, avatar);
            pre.setString(2, full_name);
            pre.setString(3, gender);
            pre.setString(4, address);
            pre.setString(5, phoneNumber);
            pre.setInt(6, userId);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return n;
    }

    public User Login(String email, String password) {
        User u = null;
        try {
            String strSelect = "SELECT * FROM [User] WHERE email = ? AND password = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                u = (User) this.createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }

    public User findById(String userId) {
        User u = null;
        try {
            String strSelect = "Select * from [user] where user_id = ?";
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, userId);
            rs = stm.executeQuery();
            if (rs.next()) {
                u = (User) this.createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new User(
                rs.getInt("user_id"),
                rs.getString("avatar"),
                rs.getString("full_name"),
                rs.getString("gender"),
                rs.getString("address"),
                rs.getString("email"),
                rs.getString("phone_number"),
                rs.getString("password"),
                rs.getString("state"),
                rs.getInt("role_id")
        );
    }

}
