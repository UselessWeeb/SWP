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

/**
 *
 * @author M7510
 */
@WebServlet(name="updateAuth", urlPatterns={"/updateauth"})
public class updateAuth extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Assuming you're passing the URL as a parameter from the frontend
        String url = request.getParameter("url");
        String[] roleStrings = request.getParameterValues("role");
        HttpSession session = request.getSession();
        // Convert role IDs from String to int
        int[] roleIds = null;
        if (roleStrings != null) {
            roleIds = new int[roleStrings.length];
            for (int i = 0; i < roleStrings.length; i++) {
                try {
                    roleIds[i] = Integer.parseInt(roleStrings[i]);
                } catch (NumberFormatException e) {
                    // Handle the case where the role ID is not a valid integer
                    e.printStackTrace();
                    // Optionally, send an error response back to the client
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid role ID: " + roleStrings[i]);
                    return;
                }
            }
        }

        // Call the UpdateAuth method
        try {
            UserAuthDAO authdao = new UserAuthDAO();
            authdao.UpdateAuth(roleIds, url);
            // Optionally, send a success response back to the client
            response.setStatus(HttpServletResponse.SC_OK);
            //
            session.setAttribute("success", "Authentication for page " + url + " successfully !");
        } catch (Exception e) {
            // Handle exceptions, possibly from database operations
            e.printStackTrace();
            // Optionally, send an error response back to the client
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating roles");
            session.setAttribute("err", "There's something wrong when updating authorization for " + url + ". Please try again");
        }
        response.sendRedirect(request.getHeader("referer"));
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
