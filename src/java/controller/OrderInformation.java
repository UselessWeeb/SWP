/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "OrderInformation", urlPatterns = {"/orderinformation"})
public class OrderInformation extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //suppose the id is being sended via id parameter
            String id = request.getParameter("id");
            HttpSession session = request.getSession();
            //prepare header for response
            String referer = response.getHeader("referer");
            //handle if id is null
            if (id == null || id.isBlank() || isAlphabetic(id)) {
                //resend user back with an error
                session.setAttribute("err", "id is not exist, please try again");
                response.sendRedirect(referer);
            }
            //find user with session
            User u = (User) session.getAttribute("user");
            //validate if the current order id is belong to the user
            OrderDAO odao = new OrderDAO();
            if (odao.validateOrder(u.getUserId(), Integer.parseInt(id))) {
                Order o = odao.getByOrderId(Integer.parseInt(id));
                //return this to user
                request.setAttribute("order", o);
                request.getRequestDispatcher("orderinformation.jsp").forward(request, response);
            } else {
                //otherwise, display that user order not found and return an error:
                session.setAttribute("err", "no order found, please try again");
                response.sendRedirect(referer);
            }
        }
    }

    public static boolean isAlphabetic(String str) {
        return str != null && str.chars().allMatch(Character::isLetter);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
