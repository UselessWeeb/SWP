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

/**
 *
 * @author M7510
 */
@WebServlet(urlPatterns = {"/productList"})
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

            String searchQuery = request.getParameter("search") != null ? request.getParameter("search") : "";
            String orderBy = request.getParameter("order") != null ? request.getParameter("order") : "";

            // Step 1: Retrieve the checkbox values
            String[] selectedCategories = request.getParameterValues("category");

            final int totalPerPage = 12;
            int totalProducts;
            if (searchQuery.isBlank()) {
                totalProducts = laptopDAO.findAll().size();
            } else if (selectedCategories != null) {
                totalProducts = laptopDAO.findBySearchAndCategories("%" + searchQuery + "%", selectedCategories).size();
            } else {
                // Call a different method if selectedCategories is null
                totalProducts = laptopDAO.findBySearch("%" + searchQuery + "%").size();
            }
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
            request.setAttribute("laptopList", laptopDAO.findByPage(currentPage, totalPerPage, orderBy, "%" + searchQuery + "%", selectedCategories));
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("totalPerPage", totalPerPage);
            request.setAttribute("currentPage", currentPage);

            //next, the hashmap to contains all types of laptop category
            HashMap<String, Integer> categoryMap = new HashMap<>();
            List<Laptop> allLaptops;

            allLaptops = laptopDAO.findAll();

            for (Laptop laptop : allLaptops) {
                List<Laptop_Category> laptopCategory = laptop.getCategory();
                for (Laptop_Category l : laptopCategory){
                    categoryMap.put(l.getCategory(), categoryMap.getOrDefault(l.getCategory(), 0) + 1);
                }
            }

            request.setAttribute("categoryMap", categoryMap);
            
            request.setAttribute("selectedCategories", selectedCategories);

            //lastly, show latest products
            request.setAttribute("latestProducts", laptopDAO.findLatest());

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
