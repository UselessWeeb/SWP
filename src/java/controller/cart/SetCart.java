/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.cart;

import dao.LaptopDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cart;
import model.Laptop;

/**
 *
 * @author M7510
 */
@WebServlet(name="SetCart", urlPatterns={"/setcart"})
public class SetCart extends HttpServlet {
   
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
        LaptopDAO laptopDAO = new LaptopDAO();
        String id = request.getParameter("id");
        Laptop laptop = laptopDAO.getLaptopById(Integer.parseInt(id));
        Cart cart = (Cart) request.getSession(false).getAttribute("cart");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String action = (request.getParameter("action") != null ? request.getParameter("action") : "");
        switch (action){
            case "plus":
               quantity++;
               break;
            case "minus":
                if (quantity > 1) quantity--;
                break;
        }  
        System.out.println("SetCart.java: " + laptop.getTitle() + " " + quantity);
        cart.overrideCart(laptop, quantity);
        System.out.println(cart.getCart());
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
