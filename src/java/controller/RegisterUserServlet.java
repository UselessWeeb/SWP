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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import model.Token;
import model.User;
import util.HashUtil;
import util.RandomString;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "RegisterUserServlet", urlPatterns = {"/register"})
public class RegisterUserServlet extends HttpServlet {

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
        TokenDAO tokenDao = new TokenDAO();
        EmailService emailService = new EmailService();
        HashUtil hash = new HashUtil();
        RandomString random = new RandomString();

        String referer = request.getHeader("referer");
        String email = request.getParameter("username");
        String token;

        if (userDao.checkIfUserExist(email)) {
            request.setAttribute("err", "Email already exist!");
            response.sendRedirect(referer);
        } 
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        if (!password.equals(repassword)) {
            request.setAttribute("err", "Password doesn't match");
            response.sendRedirect(referer);
        } else {
            User newUser = new User();

            newUser.setAvatar("images/avatar/default.jpg");
            newUser.setFullName(request.getParameter("fullname"));
            newUser.setGender(request.getParameter("gender"));
            newUser.setAddress(request.getParameter("address"));
            newUser.setEmail(email);
            newUser.setPhoneNumber(request.getParameter("phonenumber"));
            newUser.setPassword(hash.md5hash(request.getParameter("password")));
            newUser.setState("unvertified");
            newUser.setRoleId(6);

            userDao.registerUser(newUser);

            while (true) {
                token = random.generateRandomString(32);

                if (!tokenDao.checkIfTokenExist(token)) {
                    break;
                }
            }

            tokenDao.addNewToken(new Token(
                    token,
                    userDao.getUserIdByEmail(email),
                    LocalDateTime.now(),
                    0
            ));

            String link = generateVerificationLink(request, token);

            emailService.sendVerificationEmail(token, email, link);

            //TODO OPEN POP UP TELL USER TO CONFIRM EMAIL
            response.sendRedirect(referer);
        }
    }

    private String generateVerificationLink(HttpServletRequest request, String token) {
        StringBuffer url = request.getRequestURL();

        String verificationPath = "/verify?token=" + token;

        url.append(verificationPath);

        return url.toString();
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
