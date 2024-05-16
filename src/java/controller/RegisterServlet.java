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
     * Handles the HTTP <code>POST</code> method.
     *
     * @param rq servlet rq
     * @param rs servlet rs
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest rq, HttpServletResponse rs)
            throws ServletException, IOException {
        rs.setContentType("text/html");
        PrintWriter pw = rs.getWriter();
        User regUser = new User();
        UserDAO userDAO = new UserDAO();
        HashUtil hash = new HashUtil();
        
        try {
            regUser.setFullname(rq.getParameter("fullName"));
            regUser.setEmail(rq.getParameter("email"));
            regUser.setDiaChi(rq.getParameter("address"));
            regUser.setPhoneNum(rq.getParameter("phoneNum"));
            regUser.setRole(1);
            regUser.setGender(rq.getParameter("gender"));
            regUser.setPoint(0);
            regUser.setState("Not Verified");
            regUser.setPassword(hash.md5hash(rq.getParameter("password")));
            
            userDAO.registerUser(regUser);
            
            //TODO: SEND VERIFY MAIL TO USER HERE
        } catch(Exception e) {
            
        }
    }
}
