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
import services.UserActivationService;
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
        String fullName = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        String reEnterPassword = request.getParameter("repassword");

        // Save input data in session
        session.setAttribute("inputEmail", email);
        session.setAttribute("inputFullName", fullName);
        session.setAttribute("inputGender", gender);
        session.setAttribute("inputAddress", address);
        session.setAttribute("inputPhoneNumber", phoneNumber);

        // Validation checks
        if (fullName.length() < 3 || fullName.length() > 30) {
            session.setAttribute("registerErr", "Name must be between 3 and 30 characters!");
        } else if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$") || email.length() < 5 || email.length() > 99) {
            session.setAttribute("registerErr", "Invalid email format!");
        } else if (address.length() < 20 || address.length() > 255) {
            session.setAttribute("registerErr", "Address must be between 20 and 255 characters!");
        } else if (phoneNumber.length() != 10 || !phoneNumber.matches("\\d{10}")) {
            session.setAttribute("registerErr", "Phone number should have 10 digits!");
        } else if (password.length() < 4 || password.length() > 100) {
            session.setAttribute("registerErr", "Password must be between 4 and 100 characters!");
        } else if (!password.equals(reEnterPassword)) {
            session.setAttribute("registerErr", "Passwords do not match!");
        } else if (!gender.equalsIgnoreCase("Male") && !gender.equalsIgnoreCase("Female") && !gender.equalsIgnoreCase("Other")) {
            session.setAttribute("registerErr", "Invalid gender! Gender must be Male, Female, or Other.");
        } else if (userDao.checkIfUserExist(email)) {
            session.setAttribute("registerErr", "Email already exists!");
        } else if (userDao.checkIfPhoneNumberExist(phoneNumber)) {
            session.setAttribute("registerErr", "Phone number already exists!");
        } else {
            User newUser = new User();
            newUser.setAvatar("images/avatar/default.jpg");
            newUser.setFullName(fullName);
            newUser.setGender(gender);
            newUser.setAddress(address);
            newUser.setEmail(email);
            newUser.setPhoneNumber(phoneNumber);
            newUser.setPassword(hash.md5hash(password));
            newUser.setState("unverified");
            newUser.setRoleId(6);

            userDao.registerUser(newUser);

            activate.activateUser(newUser, request);

            System.out.println(newUser);

            session.setAttribute("registerSucc", "We have sent you a verification link, please click on that to proceed");
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
