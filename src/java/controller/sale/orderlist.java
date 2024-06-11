/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sale;

import dao.LaptopDAO;
import dao.OrderDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Laptop;
import model.Order;
import model.Role;
import model.User;
import service.AccessRole;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "orderlist", urlPatterns = {"/orderlist"})
//limit roles accessible to only sale/sale manager
@AccessRole(roles = {
    Role.Type.sale_manager,
    Role.Type.sale,})

public class orderlist extends HttpServlet {

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
            OrderDAO dao = new OrderDAO();
            UserDAO userDAO = new UserDAO();
            LaptopDAO laptopDAO = new LaptopDAO();
            final int TOTAL_PER_PAGE = 10;
            int currentPage = 1;
            if (request.getParameter("page") != null) {
                currentPage = Integer.parseInt(request.getParameter("page"));
            }

            int totalOrders = dao.count();
            int totalPages = (int) Math.ceil((double) totalOrders / TOTAL_PER_PAGE);

            List<Order> orderList = dao.getOrderPage(currentPage - 1, TOTAL_PER_PAGE, "", "");
            System.out.println(orderList);
            
            //fetch the user's name
            for(Order order : orderList){
                order.setUser(userDAO.findById(String.valueOf(order.getUser_id())));
                //fetch the laptop's name
                order.setLaptop(laptopDAO.getByID(String.valueOf(order.getLaptop_id())));
                
            }
            request.setAttribute("orderlist", orderList);
            
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);

            request.getRequestDispatcher("orderlist.jsp").forward(request, response);
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
