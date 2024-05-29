/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sidebar;

import dao.BlogDAO;
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
import model.Blog;
import model.Blog_Category;

/**
 *
 * @author M7510
 */
@WebServlet(name = "Sidebar", urlPatterns = {"/Sidebar"})
public class Sidebar extends HttpServlet {

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
        String requestedURL = request.getRequestURI();
        System.out.println(requestedURL);
        HashMap<String, Integer> categoryMap = new HashMap<>();
        switch (requestedURL) {
            case "/app-name/single-post.jsp":
            case "/app-name/blog.jsp":
                BlogDAO blogDAO = new BlogDAO();

                List<Blog> allBlogs;

                allBlogs = blogDAO.getAll();

                for (Blog blog : allBlogs) {
                    List<Blog_Category> blogCategory = blog.getCategory();
                    for (Blog_Category b : blogCategory) {
                        categoryMap.put(b.getCategory(), categoryMap.getOrDefault(b.getCategory(), 0) + 1);
                    }
                }

                //lastly, show latest blogs
                request.setAttribute("latestBlogs", blogDAO.findLatest());
                break;
            case "/app-name/shop.jsp":
            case "/app-name/single-product.jsp":
                LaptopDAO laptopDAO = new LaptopDAO();

                categoryMap = laptopDAO.getCategoryCounts();

                float maxCurrentPrice = laptopDAO.findMaxPrice();

                // Step 4: Retrieve the min and max price values
                float minPrice = request.getParameter("minPrice") != null ? Float.parseFloat(request.getParameter("minPrice")) : 0;
                float maxPrice = request.getParameter("maxPrice") != null ? Float.parseFloat(request.getParameter("maxPrice")) : maxCurrentPrice;

                request.setAttribute("categoryMap", categoryMap);

                // Step 3: Set the min and max price attributes
                request.setAttribute("minPrice", minPrice);
                request.setAttribute("maxPrice", maxPrice);

                // Step 4: Set the max price attribute from the database
                request.setAttribute("maxPriceFromDB", maxCurrentPrice);

                //lastly, show latest products
                request.setAttribute("latestProducts", laptopDAO.findLatest());

                break;
        }

        request.setAttribute("categoryMap", categoryMap);

        request.getRequestDispatcher("view/Sidebar.jsp").include(request, response);
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
