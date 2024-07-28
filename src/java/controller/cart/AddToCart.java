/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.CartDAO;
import dao.LaptopDAO;
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
import model.CartList;
import model.Laptop;
import model.User;

/**
 *
 * @author M7510
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/addtocart"})
public class AddToCart extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        LaptopDAO laptopDAO = new LaptopDAO();
        String id = request.getParameter("id");
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            Integer.parseInt(request.getParameter("quantity"));
        } catch (Exception e) {
            session.setAttribute("err", "The number you want is invalid, please try again");
            response.sendRedirect(request.getHeader("referer"));
            return;
        }
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        if (quantity <= 0 || quantity >= laptopDAO.getByID(id).getStock()) {           
            session.setAttribute("err", "The number you want is invalid, please try again");
        } else {

            if (session != null && session.getAttribute("user") != null) {
                // User is logged in
                User user = (User) session.getAttribute("user");
                CartDAO cartDAO = new CartDAO(user);
                cartDAO.addToCart(id, quantity); // Assuming addToCart method updates the DB
                CartList updatedCart = new CartList(cartDAO.getCart()); // Fetch the updated cart
                session.setAttribute("cart", updatedCart); // Update session

                // Optionally, synchronize session cart with cookie
                String cartJson = objectMapper.writeValueAsString(updatedCart);
                String encodedCartJson = Base64.getEncoder().encodeToString(cartJson.getBytes());
                Cookie cartCookie = new Cookie("cart", encodedCartJson);
                cartCookie.setPath("/");
                cartCookie.setMaxAge(60 * 60 * 24); // 1 day
                response.addCookie(cartCookie);
            } else {
                // User is not logged in
                CartList cart = (CartList) session.getAttribute("cart");
                if (cart == null) {
                    cart = new CartList();
                }
                cart.addToCart(id, quantity); // Update cart in session
                session.setAttribute("cart", cart); // Update session

                // Encode cart and store in cookie
                String cartJson = objectMapper.writeValueAsString(cart);
                String encodedCartJson = Base64.getEncoder().encodeToString(cartJson.getBytes());
                Cookie cartCookie = new Cookie("cart", encodedCartJson);
                cartCookie.setMaxAge(60 * 60 * 24); // 1 day
                response.addCookie(cartCookie);
                System.out.println("and it's supposed to go here");
            }
        }
        response.sendRedirect(request.getHeader("referer"));
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
