/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.order;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.OrderDAO;
import dao.OrderItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Base64;
import java.util.List;
import model.CartList;
import model.Order;
import model.OrderItem;

/**
 *
 * @author M7510
 */
@WebServlet(name="rebuyOrder", urlPatterns={"/rebuyorder"})
public class rebuyOrder extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        OrderDAO dao = new OrderDAO();
        HttpSession session = request.getSession(true);
        int order = 0;
        try {
            order = Integer.parseInt(request.getParameter("order"));
            Order orderDetails = dao.getByOrderId(order);
            OrderItemDAO orderitemDAO = new OrderItemDAO();
            List<OrderItem> items = orderitemDAO.getByOrderId(order);
            CartList cart = (CartList) session.getAttribute("cart");
            for (OrderItem item : items){
                String LaptopId = String.valueOf(item.getLaptopId().getLaptopId());
                cart.addToCart(LaptopId, item.getQuantity());
            }
            try {
                System.out.println("it reaches here");
                String updatedCartJson = objectMapper.writeValueAsString(cart);
                String encodedCart = Base64.getEncoder().encodeToString(updatedCartJson.getBytes());
                Cookie updatedCartCookie = new Cookie("cart", encodedCart);
                updatedCartCookie.setMaxAge(60 * 60 * 24); // Set cookie to expire in 24 hours
                response.addCookie(updatedCartCookie);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
                // Handle serialization error
            }
            response.sendRedirect("cart");
        } catch (Exception e) {
            session.setAttribute("err", "Something's wrong, please try again later.");
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
