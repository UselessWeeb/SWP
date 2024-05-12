package model;

import java.util.Date;

public class Fruit {
    private int id;
    private String name;
    private Date date;
    private String origin;
    private int number;
    private int price;
    private String description;
    private String category;
    private String image;

    public Fruit() {
    }

    public Fruit(int id, String name, Date date, String origin, int number, int price, String description, String category, String image) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.origin = origin;
        this.number = number;
        this.price = price;
        this.description = description;
        this.category = category;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Date getDate() {
        return date;
    }

    public String getOrigin() {
        return origin;
    }

    public int getNumber() {
        return number;
    }

    public int getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public String getCategory() {
        return category;
    }

    public String getImage() {
        return image;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
