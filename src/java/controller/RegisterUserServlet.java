

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.UserDAO;
import dao.TokenDAO;
import model.User;
import model.Token;
import email.EmailService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import service.UserActivationService;
import util.HashUtil;
import util.RandomString;

@WebServlet(urlPatterns = {"/register"})
public class RegisterUserServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        UserDAO userDao = new UserDAO();
        HashUtil hash = new HashUtil();
        HttpSession session = request.getSession(true);

        UserActivationService activate = new UserActivationService();

        String referer = request.getHeader("referer");
        String email = request.getParameter("username");

        if (userDao.checkIfUserExist(email)) {
            session.setAttribute("registerErr", "Email already exist!");
            System.out.println("Email already exist!");
        } else if (userDao.checkIfPhoneNumberExist(request.getParameter("phonenumber"))) {
            session.setAttribute("registerErr", "Phone number already exist!");
            System.out.println("Phone number already exist!");
        } else {
            User newUser = new User();
            
            userDao.registerUser(newUser);

            activate.activateUser(newUser, request);

            System.out.println(newUser);

            session.setAttribute("registerErr", "We have sent you a verification link, please click on that to proceed");
        }

        response.sendRedirect(referer);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    } // </editor-fold>
}
