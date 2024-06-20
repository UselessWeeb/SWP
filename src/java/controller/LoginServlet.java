/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.TokenDAO;
import dao.UserDAO;
import email.EmailService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import model.Token;
import model.User;
import services.UserActivationService;
import util.HashUtil;
import util.RandomString;

/**
 *
 * @author M7510
 */
@WebServlet(urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
        request.getRequestDispatcher("view/login.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        HashUtil hash = new HashUtil();
        String password = request.getParameter("password");
        //encoding password before finding it
        password = hash.md5hash(password);
        String referer = request.getHeader("referer");
        UserDAO userDAO = new UserDAO();

        UserActivationService activate = new UserActivationService();

        User u = userDAO.Login(email, password);
        if (u == null) {
            //if user is not found, redirect back to the page they send request with error message
            request.getSession(false).setAttribute("loginErr", "Incorrect Username/Password");
            response.sendRedirect(referer);
        } else {
            if (u.getState().equals("unverified")) {
                request.getSession(false).setAttribute("loginErr", "Account is not activated yet, please check your email for activation link");
                response.sendRedirect(referer);
                activate.activateUser(u, request);
                return;
            }
            //create session for said user
            //if user choose "remember me, create a cookie and session for said user, otherwise, don't"
            HttpSession session = request.getSession(false);
            session.setAttribute("user", u);
            session.setAttribute("userAuth", u);
            System.out.println("login success");
            //create cookie as well
            if (request.getParameter("session") != null) {
                Cookie userid = new Cookie("userid", String.valueOf(u.getUserId()));

                userid.setMaxAge(60 * 60); // one hour
                userid.setPath("/"); // root path

                response.addCookie(userid);
            }
            response.sendRedirect(referer);
        }
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
