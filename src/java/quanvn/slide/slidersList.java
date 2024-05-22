/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package quanvn.slide;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextArea;

/**
 *
 * @author quant
 */


public class slidersList {
    private List<Slider> sliders;
    private int currentPage = 1;
    private int pageSize = 5;

    public slidersList() {
        sliders = new ArrayList<>();
        sliders.add(new Slider(1, "Slider 1", "slider1.jpg", "https://example.com/slider1", true, "This is the first slider."));
        sliders.add(new Slider(2, "Slider 2", "slider2.jpg", "https://example.com/slider2", false, "This is the second sample slider."));
        sliders.add(new Slider(3, "Slider 3", "slider3.jpg", "https://example.com/slider3", true, "This is the third sample slider."));
        sliders.add(new Slider(4, "Slider 4", "slider4.jpg", "https://example.com/slider4", false, "This is the fourth sample slider."));
//        sliders.add(new Slider(5, "Slider 5", "slider5.jpg", "https://example.com/slider5", true, "This is a fifth sample slider."));
//        sliders.add(new Slider(6, "Slider 6", "slider6.jpg", "https://example.com/slider6", true, "This is a sixth sample slider."));
//        sliders.add(new Slider(7, "Slider 7", "slider7.jpg", "https://example.com/slider7", false, "This is a seventh sample slider."));
//        sliders.add(new Slider(8, "Slider 8", "slider8.jpg", "https://example.com/slider8", true, "This is an eighth sample slider."));
    }

    public List<Slider> getFilteredSliders(String searchText, int statusIndex) {
        return sliders.stream()
                .filter(s -> searchText.isEmpty() || s.getTitle().contains(searchText) || s.getBacklink().contains(searchText))
                .filter(s -> statusIndex == 0 || (statusIndex == 1 && s.isStatus()) || (statusIndex == 2 && !s.isStatus()))
                .skip((currentPage - 1) * pageSize)
                .limit(pageSize)
                .collect(Collectors.toList());
    }

    public void hideSlider(Slider slider) {
        slider.setStatus(false);
    }

    public List<Slider> getSliders() {
        return sliders;
    }
}