/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/AdvancedFilter.java to edit this template
 */
package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;
import java.util.logging.*;
import model.User;
import service.*;

/**
 *
 * @author M7510
 */
@WebFilter(filterName = "authUser", urlPatterns = {"/*"})
public class authUser implements Filter {
    
    protected RoleAuthorization roleAuth = new RoleAuthorization();

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        request.setCharacterEncoding("UTF-8");

        String requestedResource = URLfilter.getResourceUrl(req.getRequestURI());
        boolean allowedAnyone = roleAuth.isAllowAnyOneToAccess(requestedResource);

        if (allowedAnyone) {
            chain.doFilter(request, response);
            return;
        }

        User currentUser = (User) req.getSession(true).getAttribute("user");
        if (currentUser != null) {
            String resource = URLfilter.getResourceUrl(req.getRequestURI());
            boolean isAllowed = roleAuth.isAllowToAccess(currentUser, resource);
            Logger.getLogger("Allow " + roleAuth.getRoleTypeById(currentUser.getRole().getRole_id())
                    + " to access to" + req.getRequestURL() + ": " + isAllowed);

            if (isAllowed) {
                chain.doFilter(request, response);
                return;
            }

            Logger.getLogger("Not Allow " + roleAuth.getRoleTypeById(currentUser.getRole().getRole_id()) + " to access to" + req.getRequestURL());
        }

        Logger.getLogger("Requesting resource " + requestedResource + " Not allow to access");
        res.sendRedirect("login");
    }
}
