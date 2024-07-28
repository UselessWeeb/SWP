/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.order;

import dao.OrderDAO;
import dao.OrderItemDAO;
import dao.OrderUserDAO;
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
import model.Order_User;

/**
 *
 * @author M7510
 */
@WebServlet(name="orderinfo", urlPatterns={"/orderinfo"})
public class orderinfo extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //
        OrderDAO dao = new OrderDAO();
        OrderUserDAO userdao = new OrderUserDAO();
        OrderItemDAO itemdao = new OrderItemDAO();
        HttpSession session = request.getSession();
        int order = 0;
        try {
            order = Integer.parseInt(request.getParameter("orderId"));
            Order orderDetails = dao.getByOrderId(order);
            //get all details
            List<OrderItem> item = itemdao.getByOrderId(orderDetails.getOrder_id());
            Order_User user = userdao.getById(orderDetails.getUser_id());
            request.setAttribute("orderuser", user);
            request.setAttribute("items", item);
            request.setAttribute("order", orderDetails);
            request.getRequestDispatcher("order_information.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect(request.getHeader("referer"));
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
