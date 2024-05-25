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
import util.HashUtil;
import util.RandomString;

/**
 *
 * @author phamn
 */

public class RegisterServlet extends HttpServlet {

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
        } else {
            User newUser = new User();

            newUser.setAvatar("images/avatar/default.jpg");
            newUser.setFullName(request.getParameter("fullname"));
            newUser.setGender(request.getParameter("gender"));
            newUser.setAddress(request.getParameter("address"));
            newUser.setEmail(email);
            newUser.setPhoneNumber(request.getParameter("phonenumber"));
            newUser.setPassword(hash.md5hash(request.getParameter("password")));
            newUser.setState("Not Verified");
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
        String scheme = request.getScheme();
        String serverName = request.getServerName();
        int serverPort = request.getServerPort();
        String contextPath = request.getContextPath();

        String verificationPath = "/verify?token=" + token;

        StringBuilder url = new StringBuilder();
        url.append(scheme).append("://").append(serverName);

        // Append port if not default
        if (serverPort != 80 && serverPort != 443) {
            url.append(":").append(serverPort);
        }

        url.append(contextPath).append(verificationPath);

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
    } // </editor-fold>
}