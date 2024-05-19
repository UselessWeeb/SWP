/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vudai
 */
public class Feedback {
    private int feedback_id;
    private int user_id;
    private int order_id;
    private float rated_star;
    private String feedback;
    private String images;
    private int status;

    public Feedback() {
    }

    public Feedback(int feedback_id, int user_id, int order_id, float rated_star, String feedback, String images, int status) {
        this.feedback_id = feedback_id;
        this.user_id = user_id;
        this.order_id = order_id;
        this.rated_star = rated_star;
        this.feedback = feedback;
        this.images = images;
        this.status = status;
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public float getRated_star() {
        return rated_star;
    }

    public void setRated_star(float rated_star) {
        this.rated_star = rated_star;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
