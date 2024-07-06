/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.HiddenUrlDAO;
import dao.RoleDAO;
import dao.UserAuthDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRegistration;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import service.URLfilter;

/**
 *
 * @author M7510
 */
@WebServlet(name = "UserAuthorizationServlet", urlPatterns = {"/userauthorization"})
public class UserAuthorizationServlet extends HttpServlet {

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
        //call every servlet in this project
        List<String> urls = new ArrayList<>();
        // Get all servlet mappings
        Map<String, ? extends ServletRegistration> servletRegistrations = request.getServletContext().getServletRegistrations();
        
        UserAuthDAO authdao = new UserAuthDAO();
        // Iterate over the servlet mappings
        for (ServletRegistration servletRegistration : servletRegistrations.values()) {
            urls.addAll(servletRegistration.getMappings());
        }
        HiddenUrlDAO hiddenUrlDAO = new HiddenUrlDAO();
        
        List<String> hiddenUrls = hiddenUrlDAO.getAllUrls();

        //exclude all string from hiddenUrls
        List<String> FullUrls = urls;
        urls = urls.stream().filter(url -> !hiddenUrls.contains(url)).collect(Collectors.toList());

        RoleDAO roledao = new RoleDAO();
        
        request.setAttribute("urls", urls);
        request.setAttribute("roles", roledao.getAll());
        
        //specific, get 1 url
        String url = request.getParameter("url");
        //TO-DO: Get Auth here
        if (url == null || url.isBlank()){
            url = "/";//get default
        }
        request.setAttribute("url",url);
        request.setAttribute("roleSelected", authdao.getRoleForURL(url));
        request.setAttribute("fullUrls", FullUrls);
        request.setAttribute("hiddenUrlsSelected", hiddenUrls);
        System.out.println(hiddenUrls);
        
        request.getRequestDispatcher("userauth.jsp").forward(request, response);
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
