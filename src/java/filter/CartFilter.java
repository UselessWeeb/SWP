package filter;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import model.CartList;
import model.User;
import dao.CartDAO;

/**
 * CartFilter checks and manages the cart stored in cookies and session.
 */
@WebFilter(filterName = "CartFilter", urlPatterns = {"/*"})
public class CartFilter implements Filter {

    private ObjectMapper objectMapper = new ObjectMapper();

    public void init(FilterConfig filterConfig) throws ServletException {
        objectMapper.enable(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY);
        // Additional configuration or logic here
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(true);

        // Check if there's a cart in the session
        if (session.getAttribute("cart") == null) {
            Cookie[] cookies = httpRequest.getCookies();
            boolean isCookieFound = false;

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("cart".equals(cookie.getName())) {
                        // Cart cookie found, decode it and use it to fill the session
                        isCookieFound = true;
                        byte[] decodedBytes = Base64.getDecoder().decode(cookie.getValue());
                        String cartJson = new String(decodedBytes);

                        // Deserialize the JSON to a HashMap
                        Map<String, Map<String, Integer>> outerMap = objectMapper.readValue(cartJson, new TypeReference<Map<String, Map<String, Integer>>>() {});
                        Map<String, Integer> cartMap = outerMap.get("cart");

                        CartList cart = new CartList((HashMap<String, Integer>) cartMap);
                        session.setAttribute("cart", cart);
                        break;
                    }
                }
            }

            if (!isCookieFound) {
                // No cart cookie found, create a new empty cart and add it to the session
                CartList newCart = new CartList(); // Assuming CartList is your cart object
                session.setAttribute("cart", newCart);

                try {
                    // Serialize the newCart to JSON
                    String cartJson = objectMapper.writeValueAsString(newCart);

                    // Base64 encode the JSON string
                    String encodedCartJson = Base64.getEncoder().encodeToString(cartJson.getBytes());

                    // Create a new cart cookie with the encoded JSON
                    Cookie cartCookie = new Cookie("cart", encodedCartJson);
                    cartCookie.setMaxAge(60 * 60 * 24); // Set cookie to expire in 24 hours
                    httpResponse.addCookie(cartCookie);
                } catch (JsonProcessingException e) {
                    e.printStackTrace();
                    // Handle the error (e.g., log it, send an error response, etc.)
                }
            }
        }

        // Check if user is logged in
        User user = (User) session.getAttribute("user");
        Boolean cartTransferred = (Boolean) session.getAttribute("cartTransferred");
        
        if (user != null && (cartTransferred == null || !cartTransferred)) {
            // User is logged in and cart hasn't been transferred yet
            CartList cart = (CartList) session.getAttribute("cart");
            if (cart != null) {
                CartDAO cartDAO = new CartDAO(user);

                // Transfer items from session cart to database
                HashMap<String, Integer> cartItems = cart.getCart(); // Assuming getItems() returns the HashMap<String, Integer>
                for (Map.Entry<String, Integer> entry : cartItems.entrySet()) {
                    String laptopId = entry.getKey();
                    int quantity = entry.getValue();
                    cartDAO.addToCart(laptopId, quantity);
                }

                // Remove the cart cookie
                Cookie cartCookie = new Cookie("cart", "");
                cartCookie.setMaxAge(0); // Set cookie to expire immediately
                httpResponse.addCookie(cartCookie);
                
                //set the session back
                session.setAttribute("cart", new CartList(cartDAO.getCart()));

                // Mark the cart as transferred
                session.setAttribute("cartTransferred", true);
            }
        }

        chain.doFilter(request, response);
    }

    public void destroy() {
        // Cleanup code if needed
    }
}
