/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import model.Slider;

/**
 *
 * @author quant
 */
public class SlidersList extends HttpServlet {
    private List<Slider> sliders;
    private int currentPage = 1;
    private int pageSize = 5;

    @Override
    public void init() {
        sliders = new ArrayList<>();
        sliders.add(new Slider(1, "Slider 1", "This is the first slider.", "slider1.jpg", "https://example.com/slider1", 1, 1));
        sliders.add(new Slider(2, "Slider 2", "This is the second sample slider.", "slider2.jpg", "https://example.com/slider2", 0, 1));
        sliders.add(new Slider(3, "Slider 3", "This is the third sample slider.", "slider3.jpg", "https://example.com/slider3", 1, 1));
        sliders.add(new Slider(4, "Slider 4", "This is the fourth sample slider.", "slider4.jpg", "https://example.com/slider4", 0, 1));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchText = request.getParameter("searchText");
        int statusIndex = Integer.parseInt(request.getParameter("statusIndex"));
        List<Slider> filteredSliders = getFilteredSliders(searchText, statusIndex);

        request.setAttribute("sliders", filteredSliders);
        request.getRequestDispatcher("sliders.jsp").forward(request, response);
    }

    private List<Slider> getFilteredSliders(String searchText, int statusIndex) {
        return sliders.stream()
                .filter(s -> searchText.isEmpty() || s.getTitle().contains(searchText) || s.getBacklink().contains(searchText))
                .filter(s -> statusIndex == 0 || (statusIndex == 1 && s.getStatus() == 1) || (statusIndex == 2 && s.getStatus() == 0))
                .skip((currentPage - 1) * pageSize)
                .limit(pageSize)
                .collect(Collectors.toList());
    }

    public void hideSlider(Slider slider) {
        slider.setStatus(0);
    }

    public List<Slider> getSliders() {
        return sliders;
    }
}