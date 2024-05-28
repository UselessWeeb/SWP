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
import java.io.PrintWriter;
import model.Slider;

/**
 *
 * @author quant
 */
public class SliderDetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int sliderId = Integer.parseInt(request.getParameter("id"));
            Slider slider = getSliderById(sliderId);

            if (slider == null) {
                out.println("Slider not found.");
                return;
            }

            request.setAttribute("slider", slider);
            request.getRequestDispatcher("slider-details.jsp").forward(request, response);
        }
    }

    private Slider getSliderById(int id) {
        // Implement your own logic to retrieve the slider by id
        // For now, we'll just return a sample slider
        return new Slider(id, "Slider 1", "This is the first slider.", "slider1.jpg", "https://example.com/slider1", 1, 1);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}