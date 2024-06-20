/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author M7510
 */
public class SessionThirst implements Filter {

    public SessionThirst() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        // Attempt to retrieve the session and the user attribute
        HttpSession session = httpRequest.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        // If session is null or doesn't have the user, try to find the cookie
        if (user == null) {
            Cookie[] cookies = httpRequest.getCookies();
            String userId = null;

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("userid".equals(cookie.getName())) {
                        userId = cookie.getValue();
                        break;
                    }
                }
            }

            // If cookie is found, recreate the session user with cookie userid
            if (userId != null) {
                UserDAO userDAO = new UserDAO();
                user = userDAO.findById(userId);

                // If user is found, create a new session and set the user attribute
                if (user != null) {
                    session = httpRequest.getSession(true);
                    session.setAttribute("user", user);
                }
                
                //if cookie found, claim that user already registered, and recreate userAuth
                session.setAttribute("userAuth", user);
            }
        }

        // Continue the filter chain
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
