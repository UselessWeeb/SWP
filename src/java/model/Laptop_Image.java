/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author M7510
 */
public class Laptop_Image {
    private int iLaptop;
    private int laptopId;
    private String image;

    public Laptop_Image() {
    }

    public Laptop_Image(int iLaptop, int laptopId, String image) {
        this.iLaptop = iLaptop;
        this.laptopId = laptopId;
        this.image = image;
    }

    public int getiLaptop() {
        return iLaptop;
    }

    public void setiLaptop(int iLaptop) {
        this.iLaptop = iLaptop;
    }

    public int getLaptopId() {
        return laptopId;
    }

    public void setLaptopId(int laptopId) {
        this.laptopId = laptopId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Laptop_Image{" + "iLaptop=" + iLaptop + ", laptopId=" + laptopId + ", image=" + image + '}';
    }
}