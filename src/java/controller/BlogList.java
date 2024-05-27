/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import model.Blog;
import model.Blog_Category;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = {"/blog"})

public class BlogList extends HttpServlet {

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
        BlogDAO blogDAO = new BlogDAO();

        String searchQuery = request.getParameter("search") != null ? request.getParameter("search") : "";
        String orderBy = request.getParameter("order") != null ? request.getParameter("order") : "";

// Step 1: Retrieve the checkbox values
        String[] selectedCategories = request.getParameterValues("category");

        final int totalPerPage = 12;
        int totalBlogs;
        if (searchQuery.isBlank() && (selectedCategories == null || selectedCategories.length == 0)) {
            totalBlogs = blogDAO.getBlogCount(null, null);
        } else if (!searchQuery.isBlank() && (selectedCategories == null || selectedCategories.length == 0)) {
            totalBlogs = blogDAO.getBlogCount(searchQuery, null);
        } else if (searchQuery.isBlank() && selectedCategories != null && selectedCategories.length > 0) {
            totalBlogs = blogDAO.getBlogCount(null, selectedCategories);
        } else {
            totalBlogs = blogDAO.getBlogCount(searchQuery, selectedCategories);
        }
        int totalPage = (int) Math.ceil((double) totalBlogs / totalPerPage);

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
        request.setAttribute("blogList", blogDAO.findByPage(currentPage, totalPerPage, orderBy, "%" + searchQuery + "%", selectedCategories));
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("totalBlogs", totalBlogs);
        request.setAttribute("totalPerPage", totalPerPage);
        request.setAttribute("currentPage", currentPage);

        request.setAttribute("selectedCategories", selectedCategories);

        request.getRequestDispatcher("blog.jsp").forward(request, response);
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
