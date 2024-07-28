/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;

/**
 *
 * @author M7510
 */
public class FeedbackDAO extends EntityDAO {
//
//   feedback_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
//   order_uid INT NOT NULL,
//   order_id INT NOT NULL,
//   rated_star FLOAT NOT NULL,
//   feedback VARCHAR(MAX) NOT NULL,
//   status INT NOT NULL,
//   FOREIGN KEY (order_uid) REFERENCES [Order_User],
//   FOREIGN KEY (order_id) REFERENCES [Order]

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new Feedback(
                rs.getInt("feedback_id"),
                rs.getInt("order_uid"),
                rs.getInt("rated_star"),
                rs.getFloat("rated_star"),
                rs.getString("feedback"),
                rs.getInt("status"),
                rs.getInt("laptop_id")
        );
    }

    public int saveFeedback(int orderUid, String orderId, String productId, String rating, String feedbackText) {
        String sql = "INSERT INTO Feedback (order_uid, order_id, rated_star, laptop_id, feedback, status) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, orderUid);
            stm.setInt(2, Integer.parseInt(orderId));
            stm.setFloat(3, Float.parseFloat(rating));
            stm.setString(4, productId);
            stm.setString(5, feedbackText);
            stm.setInt(6, 1);
            stm.executeUpdate();

            try (ResultSet generatedKeys = stm.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Return -1 if insertion failed
    }

    public void updateFeedback(int feedbackId, String rating, String feedbackText) {
        String sql = "UPDATE Feedback SET rated_star = ?, feedback = ? WHERE feedback_id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setFloat(1, Float.parseFloat(rating));
            stm.setString(2, feedbackText);
            stm.setInt(3, feedbackId);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Feedback> getFeedbackForLaptop(int laptopId) {
        String sql = "SELECT * FROM Feedback WHERE laptop_id = ?";
        List<Feedback> feedbackList = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, laptopId);
            rs = stm.executeQuery();
            while (rs.next()) {
                feedbackList.add((Feedback) createEntity(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public Feedback getFeedbackByOrderIdAndLaptopIdAndUserId(int order_id, int parseInt, int orderUid) {
        String sql = "SELECT * FROM Feedback WHERE order_id = ? and laptop_id = ? and order_uid = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);
            stm.setInt(2, parseInt);
            stm.setInt(3, orderUid);
            rs = stm.executeQuery();
            if (rs.next()) {
                return (Feedback) createEntity(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Feedback getFeedbackByOrderIdAndUserId(int order_id, int parseInt) {
        String sql = "SELECT * FROM Feedback WHERE order_id = ? and laptop_id is null and order_uid = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, order_id);
            stm.setInt(2, parseInt);
            rs = stm.executeQuery();
            if (rs.next()) {
                return (Feedback) createEntity(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Feedback> getAllGeneralFeedback() {
        String sql = "SELECT * FROM Feedback WHERE laptop_id = 0";
        List<Feedback> feedbackList = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                feedbackList.add((Feedback) createEntity(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }

    public boolean deleteFeedback(int id) throws SQLException {
        boolean success = false;
        connection.setAutoCommit(false);
        try {
            // First, delete associated images
            String deleteImagesSQL = "DELETE FROM Feedback_Image WHERE feedback_id = ?";
            stm = connection.prepareStatement(deleteImagesSQL);
            stm.setInt(1, id);
            stm.executeUpdate();

            // Then, delete the feedback
            String deleteFeedbackSQL = "DELETE FROM Feedback WHERE feedback_id = ?";
            stm = connection.prepareStatement(deleteFeedbackSQL);
            stm.setInt(1, id);
            int rowsAffected = stm.executeUpdate();

            connection.commit();
            success = rowsAffected > 0;
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
                System.out.println(rollbackEx);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException autoCommitEx) {
                System.out.println(autoCommitEx);
            }
        }
        return success;
    }
}
