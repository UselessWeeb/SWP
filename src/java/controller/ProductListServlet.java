/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.LaptopDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import model.Laptop;
import model.Laptop_Category;
import model.Role;
import service.AccessRole;

/**
 *
 * @author M7510
 */
@WebServlet(urlPatterns = {"/productList"})
@AccessRole(roles = {
    Role.Type.customer,
    Role.Type.guest})
public class ProductListServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            LaptopDAO laptopDAO = new LaptopDAO();

            String searchQuery = request.getParameter("search") != null ? request.getParameter("search").trim() : "";
            String orderBy = request.getParameter("order") != null ? request.getParameter("order").trim() : "";

            // Step 2: Retrieve the checkbox values
            String[] selectedCategories = request.getParameterValues("category");
            
            // Step 3: Auto set max value as final value(if not specified):
            float maxCurrentPrice = laptopDAO.findMaxPrice();

            // Step 4: Retrieve the min and max price values
            float minPrice = request.getParameter("minPrice") != null ? Float.parseFloat(request.getParameter("minPrice")) : 0;
            float maxPrice = request.getParameter("maxPrice") != null ? Float.parseFloat(request.getParameter("maxPrice")) : maxCurrentPrice;
            
            

            int totalProducts;
            if (searchQuery.isBlank() && selectedCategories == null) {
                totalProducts = laptopDAO.findCountByCriteria(null, null, minPrice, maxPrice);
            } else if (!searchQuery.isBlank() && selectedCategories != null) {
                totalProducts = laptopDAO.findCountByCriteria("%" + searchQuery + "%", selectedCategories, minPrice, maxPrice);
            } else if (!searchQuery.isBlank() && selectedCategories == null) {
                totalProducts = laptopDAO.findCountByCriteria("%" + searchQuery + "%", null, minPrice, maxPrice);
            } else {
                totalProducts = laptopDAO.findCountByCriteria(null, selectedCategories, minPrice, maxPrice);
            }
            final int totalPerPage = 16;

            int totalPage = (int) Math.ceil((double) totalProducts / totalPerPage);

            int currentPage;
            try {
                currentPage = Integer.parseInt(request.getParameter("page"));
                if (currentPage < 0 || currentPage >= totalPage) {
                    currentPage = 0;
                }
            } catch (NumberFormatException e) {
                currentPage = 0;
            }

            request.setAttribute("searchQuery", searchQuery);
            request.setAttribute("laptopList", laptopDAO.findByPage(currentPage, totalPerPage, orderBy, "%" + searchQuery + "%", selectedCategories, minPrice, maxPrice));
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("totalPerPage", totalPerPage);
            request.setAttribute("currentPage", currentPage);

            request.setAttribute("selectedCategories", selectedCategories);

            request.getRequestDispatcher("shop.jsp").forward(request, response);
        }
    }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
