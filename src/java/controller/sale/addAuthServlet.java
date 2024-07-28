/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.sale;

import dao.AssinDAO;
import dao.OrderDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name="addAuthServlet", urlPatterns={"/addAuth"})
public class addAuthServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        String order_id = request.getParameter("order_id");
        HttpSession session = request.getSession();
        //basic validate
        if(user_id == null || order_id == null){
            session.setAttribute("err", "Both sales id and order id can't be null");
            response.sendRedirect(request.getHeader("referer"));
            return;
        }
        //makes sure both is number
        try{
            Integer.parseInt(user_id);
            Integer.parseInt(order_id);
        }catch(NumberFormatException e){
            System.out.println(e);
            session.setAttribute("err", "Invalid input: both is not number");
            response.sendRedirect(request.getHeader("referer"));
            return;
        }
        //advanced validate(method getById order returns null, vallidate sales from user return false)
        UserDAO udao = new UserDAO();
        AssinDAO adao = new AssinDAO();
        OrderDAO odao = new OrderDAO();
        if (udao.findById(user_id) == null || odao.getByOrderId(Integer.parseInt(order_id)) == null || !udao.validateSales(Integer.parseInt(user_id))){
            session.setAttribute("err", "Invalid input: user inputted is not sales");
            response.sendRedirect(request.getHeader("referer"));
            return;
        }
        adao.addAuth(Integer.parseInt(order_id), Integer.parseInt(user_id));
        odao.UpdateSalesId(Integer.parseInt(user_id), Integer.parseInt(order_id));
        response.sendRedirect(request.getHeader("referer"));
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
