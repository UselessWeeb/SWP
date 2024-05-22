/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author M7510
 */
public class Laptop_Category {
    private int cLaptop;
    private int laptopId;
    private String category;

    public Laptop_Category() {
    }

    public Laptop_Category(int cLaptop, int laptopId, String category) {
        this.cLaptop = cLaptop;
        this.laptopId = laptopId;
        this.category = category;
    }

    public int getcLaptop() {
        return cLaptop;
    }

    public void setcLaptop(int cLaptop) {
        this.cLaptop = cLaptop;
    }

    public int getLaptopId() {
        return laptopId;
    }

    public void setLaptopId(int laptopId) {
        this.laptopId = laptopId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Laptop_Category{" + "cLaptop=" + cLaptop + ", laptopId=" + laptopId + ", category=" + category + '}';
    }
}