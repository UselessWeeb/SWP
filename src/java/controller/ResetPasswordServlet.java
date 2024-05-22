/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TokenDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Token;

/**
 *
 * @author phamn
 */
public class ResetPasswordServlet extends HttpServlet {

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
        String token = request.getParameter("token");

        if (token == null || token.length() != 32) {
            response.sendRedirect("index.jsp");
            return;
        }

        TokenDAO tokenDao = new TokenDAO();
        UserDAO userDao = new UserDAO();
        Token retrievedToken = tokenDao.getToken(token);

        if (retrievedToken != null && retrievedToken.getPurpose() == 1 && !retrievedToken.isExpired()) {
            request.setAttribute("token", token);
            request.setAttribute("userID", retrievedToken.getUserID());
            request.setAttribute("isValid", true);
            
            request.getRequestDispatcher("reset-password.jsp").forward(request, response);
        } else if (retrievedToken != null && retrievedToken.isExpired()) {
            tokenDao.deleteToken(token);
            response.sendRedirect("index.jsp");
        }
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
