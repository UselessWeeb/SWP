/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.RoleDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import service.GoogleLogin;

/**
 *
 * @author M7510
 */

@WebServlet(urlPatterns = {"/google_login"})
public class loginGoogle extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        //neu nguoi dung huy uy quyen
        if(error != null) {
            response.sendRedirect(request.getContextPath());
        }
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        User acc = gg.getUserInfo(accessToken);

        UserDAO dao = new UserDAO();
        User user = dao.findUserByEmail(acc.getEmail());       
        if(user == null) {
            //add user to database
            user = new User();
            RoleDAO roledao = new RoleDAO();
            user.setEmail(acc.getEmail());
            user.setFullName(acc.getFullName());
            user.setAvatar(acc.getAvatar());
            user.setRoleId(acc.getRoleId());
            user.setPassword("");
            user.setRole(roledao.getById(acc.getRoleId()));
            dao.registerUser(user);
            int user_id = dao.getUserIdByEmail(acc.getEmail());
            user.setUserId(user_id);
        } 
        System.out.println(user);
        
        request.getSession().setAttribute("user", user);
        response.sendRedirect(request.getContextPath());
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
