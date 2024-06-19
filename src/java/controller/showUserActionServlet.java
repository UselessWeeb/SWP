/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import model.User;
import service.RoleAuthorization;
import service.URLfilter;

/**
 *
 * @author M7510
 */
@WebServlet(name = "showUserActionServlet", urlPatterns = {"/showaction"})
public class showUserActionServlet extends HttpServlet {

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
        //this is a list that will show what user can do right now
        //using the userAuthorization, ofc
        RoleAuthorization auth = new RoleAuthorization();
        URLfilter filter = new URLfilter();
        // Get the current user from the session
        User currentUser = (User) request.getSession(false).getAttribute("userAuth");
        
        // Filter the URLs to only include those that the current user can access
        Set<String> allUrls = RoleAuthorization.currentMapping.keySet();
        List<String> hiddenUrls = filter.hiddenUrls();
        List<String> accessibleUrls = allUrls.stream()
            .filter(url -> auth.isAllowToAccess(currentUser, url) && !hiddenUrls.contains(url)) // Filter out URLs that the user can't access
            .collect(Collectors.toList());

        // Store the list of accessible URLs in the request
        request.setAttribute("accessibleUrls", accessibleUrls);
        // Forward the request to a JSP page to display the list
        request.getRequestDispatcher("/view/showAction.jsp").include(request, response);
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
