/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sale;

import dao.AssinDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.OrderItemDAO;
import dao.OrderUserDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Order;
import model.OrderItem;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "orderdetails", urlPatterns = {"/orderdetails"})
public class orderdetails extends HttpServlet {

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
        String id = request.getParameter("id");
        final int TOTAL_PER_PAGE = 10;
        if (id != null || !id.contains("[a-zA-Z]")) {
            OrderDAO orderdao = new OrderDAO();
            Order order = orderdao.getByOrderId(Integer.parseInt(id));
            OrderItemDAO itemDAO = new OrderItemDAO();
            OrderUserDAO uorderDAO = new OrderUserDAO();
            UserDAO userDAO = new UserDAO();
            HttpSession session = request.getSession(true);
            request.setAttribute("order", order);
            request.setAttribute("orderItems", itemDAO.getByOrderId(order.getOrder_id()));
            request.setAttribute("orderUser", uorderDAO.getById(order.getUser_id()));
            AssinDAO assignDAO = new AssinDAO();
            //manifest edit
            request.setAttribute("currentEdit", assignDAO.SalesEditId(Integer.parseInt(id)));
            request.setAttribute("isAbleToEdit", assignDAO.checkAuth((User) session.getAttribute("user"), Integer.parseInt(id)));
            System.out.println(assignDAO.checkAuth((User) session.getAttribute("user"), Integer.parseInt(id)));
            request.setAttribute("salesUser", userDAO.getSalePaging(0, TOTAL_PER_PAGE));
            request.setAttribute("sales", userDAO.findById(String.valueOf(order.getSales_id())));
            request.getRequestDispatcher("orderdetails.jsp").forward(request, response);
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
