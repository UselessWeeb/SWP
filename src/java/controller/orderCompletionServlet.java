/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.LaptopDAO;
import dao.OrderDAO;
import dao.OrderItemDAO;
import dao.OrderUserDAO;
import email.EmailService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Laptop;
import model.Order;
import model.OrderItem;
import model.Order_User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "orderCompletionServlet", urlPatterns = {"/ordercompletion"})
public class orderCompletionServlet extends HttpServlet {

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
        //get order id
        String id = request.getParameter("id");
        //find said order
        OrderDAO order = new OrderDAO();
        LaptopDAO laptop = new LaptopDAO();
        OrderUserDAO orderUserDAO = new OrderUserDAO();
        //validate id
        if (id != null || id.isBlank()) {
            Order currentOrder = order.getByOrderId(Integer.parseInt(id));
            //set current order to submitted
            currentOrder.setStatus(5);
            //TO-DO:replace status to string for easier handler
            //update this to Order
            order.UpdateOrder(currentOrder.getSales_id(), 5, currentOrder.getNotes(), currentOrder.getOrder_id());
            //delete from laptop
            OrderItemDAO item = new OrderItemDAO();
            List<OrderItem> orderedItem = item.getByOrderId(Integer.parseInt(id));
            HashMap<Laptop, Integer> items  = new HashMap<>();
            for (OrderItem i : orderedItem){
                items.put(i.getLaptopId(), i.getQuantity());
            }
            //store all ordered items
            //delete quantity for each
            for (Map.Entry<Laptop, Integer> entry : items.entrySet()) {
                Laptop l = entry.getKey();
                Integer q= entry.getValue();
                laptop.reducedQuantity(l,q);
            }
            
            //check if current user is new
            Order_User user = currentOrder.getUser();
            if (!orderUserDAO.checkUser(user.getEmail())){
                //new user
                orderUserDAO.create(user);
            }
            //send emails to user
            EmailService service = new EmailService();
            service.sendPurchaseConfirmationEmail(user.getFullname(), user.getEmail(), orderedItem, "");//TO-DO:adding delivery date
            //TO-DO: adding payment method
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
