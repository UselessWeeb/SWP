package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author vudai
 */
public class UserDAO extends DBContext {

    public int editUser(User user) {
        int n = 0;
        PreparedStatement pre;
        String sql = "UPDATE [User]\n"
                + "SET full_name = ?,\n"
                + "    gender = ?,\n"
                + "    address = ?,\n"
                + "    email = ?,\n"
                + "    phone_number = ?,\n"
                + "    password = ?,\n"
                + "    state = ?,\n"
                + "    avatar = ?,\n"
                + "WHERE user_id = ?";
        try {
            pre = connection.prepareStatement(sql);
            pre.setString(1, user.getFullName());
            pre.setString(2, user.getGender());
            pre.setString(3, user.getAddress());
            pre.setString(4, user.getEmail());
            pre.setString(5, user.getPhoneNumber());
            pre.setString(6, user.getPassword());
            pre.setString(7, user.getState());
            pre.setString(7, user.getAvatar());
            pre.setInt(8, user.getUserId());

            n = pre.executeUpdate();
        } catch (SQLException ex) {
        }
        return n;
    }
}
