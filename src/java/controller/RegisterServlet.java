/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.UserDAO;
import model.User;
import util.HashUtil;

/**
 *
 * @author phamn
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet -specific error occurs
     * @throws IOException if an I /O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/register.jsp").forward(request, response);
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
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        User regUser = new User();
        UserDAO userDAO = new UserDAO();
        HashUtil hash = new HashUtil();

        try {
            regUser.setFullName(request.getParameter("fullName"));
            regUser.setEmail(request.getParameter("email"));
            regUser.setAddress(request.getParameter("address"));
            regUser.setPhoneNumber(request.getParameter("phoneNum"));
            regUser.setRoleId(1);
            regUser.setGender(request.getParameter("gender"));
            regUser.setState("Not Verified");
            regUser.setPassword(hash.md5hash(request.getParameter("password")));

            userDAO.registerUser(regUser);

            //TODO: SEND VERIFY MAIL TO USER HERE
        } catch (Exception e) {

        }
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
