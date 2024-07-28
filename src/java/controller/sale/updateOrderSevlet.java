/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sale;

import dao.OrderDAO;
import dao.OrderItemDAO;
import dao.OrderUserDAO;
import email.EmailService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import model.Order;
import model.OrderItem;
import model.Order_User;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "updateOrderSevlet", urlPatterns = {"/updateorder"})
public class updateOrderSevlet extends HttpServlet {

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
        String order = request.getParameter("order");
        String notes = request.getParameter("notes");
        String statusString = request.getParameter("status");
        try {
            int orderId = Integer.parseInt(order);
            int status = getStatus(statusString);
            OrderDAO dao = new OrderDAO();
            HttpSession session = request.getSession();
            dao.UpdateOrder(status, notes, Integer.parseInt(order));
            if (status == 3) {
                //complete, send a feedback mail for user
                EmailService mailService = new EmailService();
                Order currentOrder = dao.getByOrderId(orderId);
                OrderItemDAO itemDAO = new OrderItemDAO();
                List<OrderItem> items = itemDAO.getByOrderId(orderId);
                OrderUserDAO userDAO = new OrderUserDAO();
                Order_User user = userDAO.getById(currentOrder.getUser_id());
                mailService.sendFeedbackRequestMail(items, user);
            }
            //get current date
            dao.editLastUpdate(new Date(), orderId);
            session.setAttribute("success", "Update order information success !");
            response.sendRedirect("/app-name/orderdetails?id=" + order);
        } catch (Exception e) {
            //
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

    public int getStatus(String status) {
        return switch (status) {
            case "Pending" ->
                0;
            case "Submitted" ->
                1;
            case "Shipping" ->
                2;
            case "Delivered" ->
                3;
            case "Cancelled" ->
                4;
            case "Refunded" ->
                5;
            default ->
                -1;
        }; //err
    }
}
