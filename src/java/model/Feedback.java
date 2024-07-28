package model;

public class Feedback {
    private int feedback_id;
    private int order_uid;
    private int order_id;
    private float rated_star;
    private String feedback;
    private int status;
    private int laptop_id;

    // Constructor
    public Feedback(int feedback_id, int order_uid, int order_id, float rated_star, String feedback, int status, int laptop_id) {
        this.feedback_id = feedback_id;
        this.order_uid = order_uid;
        this.order_id = order_id;
        this.rated_star = rated_star;
        this.feedback = feedback;
        this.status = status;
        this.laptop_id = laptop_id;
    }

    // Getters and Setters
    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public int getOrder_uid() {
        return order_uid;
    }

    public void setOrder_uid(int order_uid) {
        this.order_uid = order_uid;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getLaptop_id() {
        return laptop_id;
    }

    public void setLaptop_id(int laptop_id) {
        this.laptop_id = laptop_id;
    }
}
