package dao;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;

import dao.EntityDAO;
import java.sql.PreparedStatement;

import model.User;

public class UserDAO extends EntityDAO {
    public int changePassword(int userId, String new_pass1) {
        int n = 0;
        try {
            String sql = "UPDATE [User]\n"
                    + "   SET \n"
                    + "      password = ?\n"
                    + " WHERE user_id = ?\n";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, new_pass1);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }

    public int checkUserPassword(int id, String password) {
        int n = 0;
        String sql = "SELECT * FROM [User] WHERE user_id = ? and password = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // User with the given email exists
                n = 1;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
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
            String strSelect = "Select * from [User] where user_id = ?";
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

    public User findByEmail(String email) {
        String strSelect = "Select * from [User] where email = ?";
        User u = null;

        try {
            stm = connection.prepareStatement(strSelect);
            stm.setString(1, email);

            rs = stm.executeQuery();

            if (rs.next()) {
                u = (User) this.createEntity(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }

    public int getUserIdByEmail(String email) {
        String sql = "Select * from [User] where email = ?";
        int userID = -1;

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);

            rs = stm.executeQuery();

            if (rs.next()) {
                userID = rs.getInt("user_id");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return userID;
    }

    public List<User> getAllUser() {
        String sql = "Select * from [User]";
        List<User> userList = new ArrayList<>();

        try {
            stm = connection.prepareStatement(sql);

            rs = stm.executeQuery();

            while (rs.next()) {
                userList.add((User) this.createEntity(rs));
            }

            return userList;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public boolean checkIfUserExist(String userEmail) {
        String sql = "Select 1 from [User] where email = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, userEmail);

            rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public void registerUser(User inputUser) {
        String sql = "Insert into [User] values(?,?,?,?,?,?,?,?,?)";

        try {
            stm = connection.prepareStatement(sql);

            stm.setString(1, inputUser.getAvatar());
            stm.setString(2, inputUser.getFullName());
            stm.setString(3, inputUser.getGender());
            stm.setString(4, inputUser.getAddress());
            stm.setString(5, inputUser.getEmail());
            stm.setString(6, inputUser.getPhoneNumber());
            stm.setString(7, inputUser.getPassword());
            stm.setString(8, inputUser.getState());
            stm.setInt(9, inputUser.getRoleId());

            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateUserPassword(int userID, String password) {
        String sql = "Update [User] Set password = ? Where user_id = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            stm.setString(2, password);

            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateUserState(int userID, String state) {
        String sql = "Update [User] Set state = ? Where user_id = ?";

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            stm.setString(2, state);

            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
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
    
    public int editCustomer(User u) {
        int n = 0;
        String sql = "UPDATE [User]\n"
                + "SET avatar = ?,\n"
                + "    full_name = ?,\n"
                + "    gender = ?,\n"
                + "    address = ?,\n"
                + "    phone_number = ? \n"
                + "WHERE user_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, u.getAvatar());
            stm.setString(2, u.getFullName());
            stm.setString(3, u.getGender());
            stm.setString(4, u.getAddress());
            stm.setString(5, u.getPhoneNumber());
            stm.setInt(6, u.getUserId());
            n = stm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return n;
    }
}