/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.CartDAO;
import dao.LaptopDAO;
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
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import model.CartList;
import model.Laptop;
import model.Order;
import model.OrderItem;
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

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        ObjectMapper objectMapper = new ObjectMapper();
        LaptopDAO laptopDAO = new LaptopDAO();
        String id = request.getParameter("id");
        int quantity = 1;
        Laptop laptop = laptopDAO.getLaptopById(Integer.parseInt(id));
        System.out.println(id);
        String action = (request.getParameter("action") == null) ? "" : request.getParameter("action");
        if (request.getParameter("orderId") == null) {
            try {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            } catch (NumberFormatException e) {
                session.setAttribute("noti", "Invalid quantity for the selected laptop.");
                response.sendRedirect(request.getHeader("referer"));
                return;
            }

            if (session != null && session.getAttribute("user") != null) {
                // Registered user
                User user = (User) session.getAttribute("user");
                CartDAO cartDAO = new CartDAO(user);

                switch (action) {
                    case "+":
                        if (quantity < laptop.getStock()) {
                            cartDAO.overrideCart(id, ++quantity);
                        } else {
                            session.setAttribute("noti", "Quantity exceeds stock.");
                        }
                        break;
                    case "-":
                        if (quantity > 1) {
                            cartDAO.overrideCart(id, --quantity);
                        } else {
                            session.setAttribute("noti", "Minimum quantity is 1.");
                        }
                        break;
                    default:
                        if (quantity > 1 && quantity < laptop.getStock()) {
                            cartDAO.overrideCart(id, quantity);
                        } else {
                            if (quantity < 1) {
                                cartDAO.overrideCart(id, 1);
                                session.setAttribute("noti", "The " + laptop.getTitle() + " quantity is 0 means that system will remove it, do you want to continue ?");
                                session.setAttribute("choose", true);
                                session.setAttribute("id", id);
                            } else if (quantity > laptop.getStock()) {
                                cartDAO.overrideCart(id, laptop.getStock());
                                session.setAttribute("noti", "The " + laptop.getTitle() + " current quantity is larger than the stock, please try again");
                                session.setAttribute("id", id);
                            } else {
                                cartDAO.overrideCart(id, quantity);
                            }
                        }
                }

                CartList updatedCart = new CartList(cartDAO.getCart());
                session.setAttribute("cart", updatedCart);

            } else {
                // Guest user
                CartList cart = getCartFromCookies(request, objectMapper);

                if (cart == null) {
                    cart = new CartList();
                }

                switch (action) {
                    case "+":
                        if (quantity < laptop.getStock()) {
                            cart.overrideCart(id, ++quantity);
                        } else {
                            session.setAttribute("noti", "Quantity exceeds stock.");
                        }
                        break;
                    case "-":
                        if (quantity > 1) {
                            cart.overrideCart(id, --quantity);
                        } else {
                            session.setAttribute("noti", "Minimum quantity is 1.");
                        }
                        break;
                    default:
                        if (quantity > 1 && quantity < laptop.getStock()) {
                            cart.overrideCart(id, quantity);
                        } else {
                            if (quantity < 1) {
                                cart.overrideCart(id, 1);
                                session.setAttribute("noti", "The " + laptop.getTitle() + " quantity is 0 means that system will remove it, do you want to continue ?");
                                session.setAttribute("choose", true);
                                session.setAttribute("id", id);
                            } else if (quantity > laptop.getStock()) {
                                cart.overrideCart(id, laptop.getStock());
                                session.setAttribute("noti", "The " + laptop.getTitle() + " current quantity is larger than the stock, please try again");
                                session.setAttribute("id", id);
                            } else {
                                cart.overrideCart(id, quantity);
                            }
                        }
                }

                updateCartCookie(response, objectMapper, cart);
                session.setAttribute("cart", cart);
            }
        } else {
            updateOrder(action, quantity, laptop, request, response);
        }

        response.sendRedirect(request.getHeader("referer"));
    }

    private CartList getCartFromCookies(HttpServletRequest request, ObjectMapper objectMapper) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("cart".equals(cookie.getName())) {
                    try {
                        byte[] decodedBytes = Base64.getDecoder().decode(cookie.getValue());
                        String cartJson = new String(decodedBytes);
                        return objectMapper.readValue(cartJson, CartList.class);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return null;
    }

    private void updateCartCookie(HttpServletResponse response, ObjectMapper objectMapper, CartList cart) {
        try {
            String cartJson = objectMapper.writeValueAsString(cart);
            String encodedCart = Base64.getEncoder().encodeToString(cartJson.getBytes());
            Cookie cartCookie = new Cookie("cart", encodedCart);
            cartCookie.setPath("/");
            cartCookie.setMaxAge(60 * 60 * 24); // 1 day
            response.addCookie(cartCookie);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
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

    private void updateOrder(String action, int quantity, Laptop laptop, HttpServletRequest request, HttpServletResponse response) {
        System.out.println("update order trigger");
        OrderItemDAO orderItemDAO = new OrderItemDAO();
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            List<OrderItem> orderItems = orderItemDAO.getByOrderId(orderId);
            System.out.println(action);
            for (OrderItem orderItem : orderItems) {
                if (orderItem.getLaptopId().getLaptopId() == laptop.getLaptopId()) {
                    //edit said orderItem
                    //check if action is null, if not, use it with validation, else use quantity                   
                    switch (action) {
                        case "+" -> {
                            if (quantity < laptop.getStock()) { // Ensure quantity does not exceed stock
                                orderItemDAO.updateOrderItem(laptop, ++quantity, orderId);
                            } else {
                                session.setAttribute("noti", "The " + laptop.getTitle() + " current quantity is larger than the stock, please try again");
                                session.setAttribute("id", id);
                            }
                        }
                        case "-" -> {
                            if (quantity > 1) { // Ensure quantity does not fall below 1
                                orderItemDAO.updateOrderItem(laptop, --quantity, orderId);
                            } else {
                                session.setAttribute("noti", "The " + laptop.getTitle() + " quantity is 0 means that system will remove it, do you want to continue ?");
                                session.setAttribute("choose", true);
                                session.setAttribute("id", id);
                            }
                        }
                        default -> {
                            if (quantity > 1 && quantity < laptop.getStock()) {
                                orderItemDAO.updateOrderItem(laptop, quantity, orderId);
                            } else {
                                if (quantity < 1) {
                                    orderItemDAO.updateOrderItem(laptop, 1, orderId);
                                    session.setAttribute("noti", "The " + laptop.getTitle() + " quantity is 0 means that system will remove it, do you want to continue ?");
                                    session.setAttribute("choose", true);
                                    session.setAttribute("id", id);
                                } else if (quantity > laptop.getStock()) {
                                    orderItemDAO.updateOrderItem(laptop, laptop.getStock(), orderId);
                                    session.setAttribute("noti", "The " + laptop.getTitle() + " current quantity is larger than the stock, please try again");
                                    session.setAttribute("id", id);
                                } else {
                                    orderItem.setQuantity(quantity);
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {

        }
    }

}
