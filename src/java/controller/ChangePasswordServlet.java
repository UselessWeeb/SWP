/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
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
 * @author vudai
 */
@WebServlet(urlPatterns = {"/changepassword"})
public class ChangePasswordServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            int userid = Integer.parseInt(request.getParameter("id"));
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            UserDAO dao = new UserDAO();
            int check = dao.checkUserPassword(userid, oldPassword);

            if (check > 0) {
                if (newPassword.length() <= 5 || confirmPassword.length() <= 5) {
                    session.setAttribute("failedMsg", "Password must be more than 6 characters!");
                    response.sendRedirect("changePassword.jsp");
                } else if (newPassword.equals(oldPassword)) {
                    session.setAttribute("failedMsg", "New password must be different from the old password!");
                    response.sendRedirect("changePassword.jsp");
                } else if (!newPassword.equals(confirmPassword)) {
                    session.setAttribute("failedMsg", "New passwords do not match!");
                    response.sendRedirect("changePassword.jsp");
                } else {
                    int n = dao.changePassword(userid, newPassword);
                    if (n > 0) {
                        session.setAttribute("successMsg", "Password successfully changed!");
                        session.invalidate();
                        response.sendRedirect("changePassword.jsp");
                    } else {
                        session.setAttribute("failedMsg", "Password successfully changed");
                        response.sendRedirect("index.jsp");
                    }
                }
            } else {
                session.setAttribute("failedMsg", "Please check your current password!");
                response.sendRedirect("changePassword.jsp");
            }
        }
    }

//            if (check > 0) {
//                if (newPassword.equals(confirmPassword)) {
//                    int n = dao.changePassword(userid, newPassword);
//                    if (n > 0) {
//                        session.setAttribute("successMsg", "Password successfully changed!");
//                        session.invalidate();
//                        response.sendRedirect("index.jsp");
//                    }
//                } else {
//                    session.setAttribute("failedMsg", "New passwords do not match!");
//                    response.sendRedirect("changePassword.jsp");
//                }
//                if (newPassword.length() <= 5) {
//                    session.setAttribute("failedMsg", "Password must be more than 6 characters!");
//                    response.sendRedirect("changePassword.jsp");
//                }
//            } else {
//                session.setAttribute("failedMsg", "Please check password right");
//                response.sendRedirect("changePassword.jsp");
//            }
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
