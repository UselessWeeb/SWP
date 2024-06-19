/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sale;

import dao.LaptopDAO;
import dao.OrderDAO;
import dao.OrderItemDAO;
import dao.OrderUserDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Laptop;
import model.Order;
import model.OrderItem;
import model.Role;
import model.User;
import service.AccessRole;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "orderlist", urlPatterns = {"/orderlist"})
//limit roles accessible to only sale/sale manager
@AccessRole(roles = {
    Role.Type.sale_manager,
    Role.Type.sale,})

public class orderlist extends HttpServlet {

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
            OrderDAO dao = new OrderDAO();
            OrderUserDAO userDAO = new OrderUserDAO();
            OrderItemDAO itemDAO = new OrderItemDAO();
            LaptopDAO laptopDAO = new LaptopDAO();
            final int TOTAL_PER_PAGE = 10;
            int currentPage = 1;
            if (request.getParameter("page") != null) {
                currentPage = Integer.parseInt(request.getParameter("page"));
            }
            
            String[] selectedLaptopId = request.getParameterValues("productCheck");
            String sortField = request.getParameter("sortField");
            String sortDirection = request.getParameter("sortDirection");
            String searchQuery = request.getParameter("Search");
            //format string to yyyy-MM-dd format
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = null;
            if (request.getParameter("startDate") != null && !request.getParameter("startDate").isEmpty()) {
                startDate = format.parse(request.getParameter("startDate"));
            }
            Date endDate = null;
            if (request.getParameter("endDate") != null && !request.getParameter("endDate").isEmpty()) {
                endDate = format.parse(request.getParameter("endDate"));
            }
            String status = request.getParameter("status");
            
            //showing total orders
            int totalOrders = dao.count();
            //total page
            int totalPages = (int) Math.ceil((double) totalOrders / TOTAL_PER_PAGE);

            List<Order> orderList = dao.getOrderPage(currentPage - 1, TOTAL_PER_PAGE, sortField, sortDirection, searchQuery, startDate, endDate, status, selectedLaptopId);
            System.out.println(orderList);
            
            List<List<OrderItem>> items = new ArrayList<>();
            
            
            List<Laptop> laptopOrdered = new ArrayList<>();
            
            for(Order order : orderList){
                order.setUser(userDAO.getById(order.getUser_id()));
                items.add(itemDAO.getByOrderId(order.getOrder_id()));
            }
            
            System.out.println(items);
            
            request.setAttribute("startDate", startDate != null ? format.format(startDate) : "");
            request.setAttribute("endDate", endDate != null ? format.format(endDate) : "");
            
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("totalPerPage", orderList.size());
            
            //search
            request.setAttribute("Search", searchQuery);
            //status
            if(status != null && !status.isBlank()){
                request.setAttribute("status", status);
            }
            
            request.setAttribute("ordered", laptopDAO.findOrderedLaptop());
            
            request.setAttribute("laptops", laptopDAO.findAll());

            request.setAttribute("selectedLaptopId", selectedLaptopId);
            
            request.setAttribute("sortField", sortField);
            request.setAttribute("sortDirection", sortDirection);
            request.setAttribute("orderlist", orderList);
            request.setAttribute("items", items);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);

            request.getRequestDispatcher("orderlist.jsp").forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(orderlist.class.getName()).log(Level.SEVERE, null, ex);
        }
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
