/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.FeedbackImage;

/**
 *
 * @author M7510
 */
public class FeedbackImageDAO extends EntityDAO {

    @Override
    public Object createEntity(ResultSet rs) throws SQLException {
        return new FeedbackImage(
                rs.getInt("fimages"),
                rs.getString("image"),
                rs.getInt("feedback_id")
        );
    }

    public void insertFeedbackImage(String imagePath, int feedbackId) {
        String sql = "INSERT INTO Feedback_Image (image, feedback_id) VALUES (?, ?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, imagePath);
            stm.setInt(2, feedbackId);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Consider logging the error or throwing a custom exception
        }
    }

    public List<FeedbackImage> getImagesByFeedbackId(int feedback_id) {
        String sql = "SELECT * FROM Feedback_Image WHERE feedback_id = ?";
        List<FeedbackImage> images = new ArrayList<>();
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, feedback_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                images.add((FeedbackImage) createEntity(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Consider logging the error or throwing a custom exception
        }
        return images;
    }

    public boolean deleteImage(int imageId) {
        String sql = "DELETE FROM Feedback_Image WHERE fimages = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, imageId);
            int rowsAffected = stm.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public FeedbackImage getFeedbackImageById(int imageId) {
        String sql = "SELECT * FROM Feedback_Image WHERE fimages = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, imageId);
            rs = stm.executeQuery();
            if (rs.next()) {
                return (FeedbackImage) createEntity(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
