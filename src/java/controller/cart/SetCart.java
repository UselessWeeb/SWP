/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import com.fasterxml.jackson.core.JsonProcessingException;
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
import java.util.Arrays;
import java.util.Base64;
import model.CartList;
import model.Laptop;
import model.User;
import service.Validation;

/**
 *
 * @author M7510
 */
@WebServlet(name = "SetCart", urlPatterns = {"/setcart"})
public class SetCart extends HttpServlet {

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
        ObjectMapper objectMapper = new ObjectMapper();
        response.setContentType("text/html;charset=UTF8");
        HttpSession session = request.getSession(false);
        LaptopDAO laptopDAO = new LaptopDAO();
        String id = request.getParameter("id");
        Laptop laptop = laptopDAO.getLaptopById(Integer.parseInt(id));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String action = (request.getParameter("action") == null) ? "" : request.getParameter("action");

        Validation validation = new Validation();
        CartList cart = null;

        // Try to retrieve the cart from a cookie
        Cookie[] cookies = request.getCookies();
        Cookie cartCookie = Arrays.stream(cookies)
                .filter(c -> "cart".equals(c.getName()))
                .findFirst()
                .orElse(null);

        if (cartCookie != null) {
            // Cart cookie exists, decode and deserialize it
            byte[] decodedBytes = Base64.getDecoder().decode(cartCookie.getValue());
            String cartJson = new String(decodedBytes);
            try {
                cart = objectMapper.readValue(cartJson, CartList.class);
            } catch (IOException e) {
                e.printStackTrace();
                // Handle deserialization error
            }
        }

        if (cart == null) {
            cart = new CartList(); // Initialize a new cart if not found in cookies
        }

        // Update the cart based on action
        if (validation.intValidator(quantity, 1, laptop.getStock())) {
            System.out.println("Idk why was this still here");
            switch (action) {
                case "+":
                    if (quantity < laptop.getStock()) { // Ensure quantity does not exceed stock
                        cart.overrideCart(id, ++quantity);
                    } else {
                        session.setAttribute("noti", "The current quantity is larger than the stock, please try again");
                        session.setAttribute("id", id);
                    }
                    break;
                case "-":
                    if (quantity > 1) { // Ensure quantity does not fall below 1
                        cart.overrideCart(id, --quantity);
                    }else {
                        session.setAttribute("noti", "The quantity is 0 means that system will remove it, do you want to continue ?");
                        session.setAttribute("choose", true);
                        session.setAttribute("id", id);
                    }
                    break;
                default:
                    cart.overrideCart(id, quantity);
                    break;
            }
        }

        // Serialize and encode the updated cart
        try {
            String updatedCartJson = objectMapper.writeValueAsString(cart);
            String encodedCart = Base64.getEncoder().encodeToString(updatedCartJson.getBytes());
            Cookie updatedCartCookie = new Cookie("cart", encodedCart);
            updatedCartCookie.setMaxAge(60 * 60 * 24); // Set cookie to expire in 24 hours
            response.addCookie(updatedCartCookie);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            // Handle serialization error
        }

        session.setAttribute("cart", cart);

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
