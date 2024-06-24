/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import dao.CartDAO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import model.CartList;
import model.Laptop;
import model.User;

/**
 *
 * @author M7510
 */
@WebFilter(filterName = "CartFilter", urlPatterns = {"/*"})
public class CartFilter implements Filter {
    private ObjectMapper objectMapper = new ObjectMapper();
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(true);

        if (session.getAttribute("cart") == null) {
            Cookie[] cookies = httpRequest.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("cart".equals(cookie.getName())) {
                        String cartJson = cookie.getValue();
                        CartList cart = objectMapper.readValue(cartJson, CartList.class);
                        session.setAttribute("cart", cart);
                        break;
                    }
                }
            }
        }

        if (session != null) {
            if (session.getAttribute("cart") == null) {
                session.setAttribute("cart", new CartList());
            }

            // If user logged in while the cart has some items
            User user = (User) session.getAttribute("user");
            if (user != null && session.getAttribute("cartMerged") == null) {
                CartDAO cartDAO = new CartDAO(user);
                HashMap<Laptop, Integer> cartItems = cartDAO.getCart();

                // Get the session cart items
                CartList sessionCart = (CartList) session.getAttribute("cart");
                HashMap<Laptop, Integer> sessionCartItems = sessionCart != null ? sessionCart.getCart(): new HashMap<>();

                // Merge the session cart items into the user's cart items
                for (Map.Entry<Laptop, Integer> entry : sessionCartItems.entrySet()) {
                    Laptop laptop = entry.getKey();
                    int quantity = entry.getValue();

                    if (cartItems.containsKey(laptop)) {
                        // If the laptop is already in the user's cart, add the quantities together
                        cartItems.put(laptop, cartItems.get(laptop) + quantity);
                    } else {
                        // If the laptop is not in the user's cart, add it
                        cartItems.put(laptop, quantity);
                    }

                    // Update the database with the new quantity
                    cartDAO.overrideCart(laptop, cartItems.get(laptop));
                }

                // Update the session with the merged cart items
                session.setAttribute("cart", new CartList(cartItems));

                // Set the flag indicating that the carts have been merged
                session.setAttribute("cartMerged", true);
            }
        }

        CartList cart = (CartList) session.getAttribute("cart");
        if (cart != null) {
            String cartJson = objectMapper.writeValueAsString(cart);
            Cookie cartCookie = new Cookie("cart", cartJson);
            cartCookie.setPath("/");
            cartCookie.setMaxAge(60 * 60 * 24); // Expires in 1 day
            httpResponse.addCookie(cartCookie);
        }

        chain.doFilter(request, response);

        chain.doFilter(request, response);
    }
}