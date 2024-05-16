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
        String sql = "UPDATE user\n"
                + "SET fullName = ?,\n"
                + "    email = ?,\n"
                + "    diaChi = ?,\n"
                + "    phoneNum = ?,\n"
                + "    gender = ?,\n"
                + "    password = ?,\n"
                + "WHERE idUser = ?";
        try {
            pre = connection.prepareStatement(sql);
            pre.setString(1, user.getFullname());
            pre.setString(2, user.getEmail());
            pre.setString(3, user.getDiaChi());
            pre.setString(4, user.getPhoneNum());
            pre.setString(5, user.getGender());
            pre.setString(6, user.getPassword());
            pre.setInt(7, user.getIdUser());

            n = pre.executeUpdate();
        } catch (SQLException ex) {
        }
        return n;
    }
}
