/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.cart;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.CartDAO;
import dao.LaptopDAO;
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
import model.Laptop;
import model.OrderItem;
import model.User;

/**
 *
 * @author M7510
 */
@WebServlet(name="DeleteFromCart", urlPatterns={"/deletefromcart"})
public class DeleteFromCart extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        String id = request.getParameter("id");
        ObjectMapper objectMapper = new ObjectMapper();
        if (request.getParameter("orderId") == null){
            if (session != null && session.getAttribute("user") != null) {
                // User is logged in
                User user = (User) session.getAttribute("user");
                CartDAO cartDAO = new CartDAO(user);
                cartDAO.deleteFromCart(id); // Assuming deleteFromCart method updates the DB
                CartList updatedCart = new CartList(cartDAO.getCart()); // Fetch the updated cart
                session.setAttribute("cart", updatedCart); // Update session

                // Optionally, synchronize session cart with cookie
                String cartJson = objectMapper.writeValueAsString(updatedCart);
                String encodedCartJson = Base64.getEncoder().encodeToString(cartJson.getBytes());
                Cookie cartCookie = new Cookie("cart", encodedCartJson);
                cartCookie.setMaxAge(60 * 60 * 24); // 1 day
                response.addCookie(cartCookie);
            } else {
                // User is not logged in
                System.out.println("Delete without user logged in");
                CartList cart = null;
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if ("cart".equals(cookie.getName())) {
                        String decodedCartJson = new String(Base64.getDecoder().decode(cookie.getValue()));
                        cart = objectMapper.readValue(decodedCartJson, CartList.class);
                        break;
                    }
                }

                if (cart == null) {
                    cart = new CartList();
                }
                System.out.println("it goes here");
                cart.deleteFromCart(id); // Update cart in session
                System.out.println(cart);
                session.setAttribute("cart", cart); // Update session

                // Encode cart and store in cookie
                String cartJson = objectMapper.writeValueAsString(cart);
                String encodedCartJson = Base64.getEncoder().encodeToString(cartJson.getBytes());
                Cookie cartCookie = new Cookie("cart", encodedCartJson);
                cartCookie.setMaxAge(60 * 60 * 24); // 1 day
                response.addCookie(cartCookie);
            }
            response.sendRedirect(request.getHeader("referer"));
        } else {
            deleteOrder(request, response);
        }
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("Delete Order !");
        HttpSession session = request.getSession(false);
        String id = request.getParameter("id");
        String orderId = request.getParameter("orderId");
        try {
            int orderIdInt = Integer.parseInt(orderId);
            int laptopId = Integer.parseInt(id);
            OrderItemDAO orderItemDAO = new OrderItemDAO();
            List<OrderItem> orderItems = orderItemDAO.getByOrderId(orderIdInt);
            if (orderItems == null) {
                return;
            }
            if (orderItems.size() == 1){
                //prevent deletion of last item in order, they can just choose to delete the order
                session.setAttribute("err", "The current order has only one item, please delete the order instead");
                response.sendRedirect(request.getHeader("referer"));
                return;
            }
            for (OrderItem orderItem : orderItems) {
                if (orderItem.getLaptopId().getLaptopId() == laptopId){
                    orderItemDAO.deleteOrderItem(orderItem.getOrderItemId());
                }
            }
        } catch (Exception e) {
            PrintWriter out = response.getWriter();
            out.println(e);
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
