/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author vudai
 */
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
            User u = (User) session.getAttribute("userobj");
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");

            UserDAO dao = new UserDAO();
            int check = dao.checkUserPassword(u.getUserId(), oldPassword);

            if (check > 0) {
                if (newPassword.equals(confirmPassword)) {
                    int n = dao.changePassword(u.getUserId(), newPassword);
                    if (n > 0) {
                        session.setAttribute("notification", "Password successfully changed!");
                        response.sendRedirect("index.jsp");
                    }
                } else {
                    session.setAttribute("notification", "New passwords do not match!");
                    response.sendRedirect("changePassword.jsp");
                }
                if (newPassword.length() <= 6) {
                    session.setAttribute("notification", "Password must be more than 6 characters!");
                    response.sendRedirect("changePassword.jsp");
                }
            } else {
                session.setAttribute("notification", "Please check password right");
                response.sendRedirect("changePassword.jsp");
            }
//            if (!oldPassword.equals(u.getPassword())) {
//                session.setAttribute("notification", "Incorrect password");
//                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
//            } else if (newPassword.length() <= 6) {
//                session.setAttribute("notification", "Password must be more than 6 characters!");
//                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
//            } else if (!newPassword.equals(confirmPassword)) {
//                session.setAttribute("notification", "New passwords do not match!");
//                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
//            } else {
//                // Logic to update the password (e.g., update database) would go here
//                new UserDAO().changePassword(userId, newPassword);
//                session.setAttribute("notification", "Password successfully changed!");
//                request.getRequestDispatcher("index.jsp").forward(request, response);
//            }
            out.close();
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
