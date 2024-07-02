/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import dao.UserAuthDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.LinkedHashSet;
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
        UserAuthDAO userAuthDAO = new UserAuthDAO();
        HttpSession session = request.getSession();
        if (session != null && session.getAttribute("userAuth") != null) {
            List<String> urls = userAuthDAO.getURLForRole(((User) session.getAttribute("userAuth")).getRole().getRole_id());
            List<String> hiddenUrl = URLfilter.hiddenUrls();
            // Initialize accessibleUrl as a LinkedHashSet to maintain insertion order
            Set<String> accessibleUrl = new LinkedHashSet<>();
            // Add "/" first to ensure it's at the beginning of the list
            accessibleUrl.add("/");
            // Add the rest of the URLs, excluding the hidden ones
            accessibleUrl.addAll(urls.stream().filter(url -> !hiddenUrl.contains(url) && !url.equals("/")).collect(Collectors.toSet()));
            System.out.println(urls);
            request.setAttribute("accessibleurls", accessibleUrl);
            request.getRequestDispatcher("/view/showAction.jsp").include(request, response);
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

}
