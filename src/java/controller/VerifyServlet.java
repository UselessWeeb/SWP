/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TokenDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Token;

@WebServlet(urlPatterns = {"/verify"})
public class VerifyServlet extends HttpServlet {

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
        TokenDAO tokenDao = new TokenDAO();
        UserDAO userDao = new UserDAO();
        HttpSession session = request.getSession(true);

        String token = request.getParameter("token");

        if (token == null || token.length() != 32) {
            session.setAttribute("err", "Invalid token, please try again.");
        } else {
            Token retrievedToken = tokenDao.getToken(token);
            //check token
            System.out.println(retrievedToken);
            if (retrievedToken != null && retrievedToken.getPurpose() == 0) {
                if (!retrievedToken.isExpired()) {
                    userDao.updateUserState(retrievedToken.getUserID(), "verified");
                    session.setAttribute("success", "Verification successful!");
                } else {
                    session.setAttribute("err", "Expired token, please try again.");
                }
                tokenDao.deleteToken(token);
            } else {
                session.setAttribute("err", "Expired token, please try again.");
            }
        }

        response.sendRedirect(request.getContextPath());
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
