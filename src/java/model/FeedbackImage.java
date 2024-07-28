package model;

public class FeedbackImage {
    private int fimages;
    private String image;
    private int feedback_id;

    // Constructor
    public FeedbackImage(int fimages, String image, int feedback_id) {
        this.fimages = fimages;
        this.image = image;
        this.feedback_id = feedback_id;
    }

    // Getters and Setters
    public int getFimages() {
        return fimages;
    }

    public void setFimages(int fimages) {
        this.fimages = fimages;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }
}