/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import dao.OrderDAO;
import dao.OrderItemDAO;
import dao.OrderUserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import model.Order;
import model.OrderItem;
import model.Order_User;
import model.User;

/**
 *
 * @author M7510
 */
@WebServlet(name = "myOrder", urlPatterns = {"/myorder"})
public class myOrder extends HttpServlet {

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
        OrderDAO dao = new OrderDAO();
        final int TOTAL_PER_PAGE = 10;

        // Get parameters
        String orderTypeParam = request.getParameter("orderType");
        String pageParam = request.getParameter("page");

        // Default values if parameters are missing
        int orderType = (orderTypeParam != null) ? Integer.parseInt(orderTypeParam) : 0;
        int page = (pageParam != null) ? Integer.parseInt(pageParam) : 1;

        //define current user
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        //order user dao
        OrderUserDAO udao = new OrderUserDAO();
        Order_User ouser = udao.getUserByEmail(currentUser.getEmail());
        if (ouser == null) {
            // Handle the case where the user is not found
            // For example, create a new Order_User or redirect to an error page
            udao.insertOrderUser(new Order_User(currentUser.getFullName(), currentUser.getAddress(), currentUser.getPhoneNumber(), currentUser.getEmail(), "", currentUser.getGender()));
            ouser = udao.getUserByEmail(currentUser.getEmail());
        }

        // Get orders based on type and page
        List<Order> orders = dao.getOrderPage(
                page - 1,
                TOTAL_PER_PAGE,
                null,
                null,
                udao.getUserByEmail(currentUser.getEmail()).getFullname(),
                null,
                null,
                String.valueOf(orderType),
                null
        );

        int total = dao.countByCriteria(udao.getUserByEmail(currentUser.getEmail()).getFullname(), null, null, String.valueOf(orderType), null);

        HashMap<Order, List<OrderItem>> items = new HashMap<>();
        OrderItemDAO itemDAO = new OrderItemDAO();
        for (Order order : orders) {
            items.put(order, itemDAO.getByOrderId(order.getOrder_id()));
        }
        // Set attributes and forward to JSP
        request.setAttribute("items", items);
        System.out.println(items);
        request.setAttribute("currentPage", page);
        request.setAttribute("orderType", orderType);

        request.setAttribute("pendingCount", dao.countByCriteria(udao.getUserByEmail(currentUser.getEmail()).getFullname(), null, null, "0", null));
        request.setAttribute("submittedCount", dao.countByCriteria(udao.getUserByEmail(currentUser.getEmail()).getFullname(), null, null, "1", null));
        request.setAttribute("deliveringCount", dao.countByCriteria(udao.getUserByEmail(currentUser.getEmail()).getFullname(), null, null, "2", null));
        request.setAttribute("completedCount", dao.countByCriteria(udao.getUserByEmail(currentUser.getEmail()).getFullname(), null, null, "3", null));
        request.setAttribute("cancelledCount", dao.countByCriteria(udao.getUserByEmail(currentUser.getEmail()).getFullname(), null, null, "4", null));
        request.setAttribute("refundedCount", dao.countByCriteria(udao.getUserByEmail(currentUser.getEmail()).getFullname(), null, null, "5", null));

        request.getRequestDispatcher("myorder.jsp").forward(request, response);
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
