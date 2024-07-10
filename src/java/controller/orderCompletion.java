package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CartList;
import model.Laptop;
import model.Order;
import model.Order_User;
import service.CurrencyConverter;

/**
 *
 * @author M7510
 */
@WebServlet(urlPatterns={"/completion"})
public class orderCompletion extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession();
        String fullName = request.getParameter("fullName");
        String userAddress = request.getParameter("userAddress");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        System.out.println(gender);
        String add_info = request.getParameter("add-info");
        int shippingMethod = Integer.parseInt(request.getParameter("inputShippingType"));
        float totalPrice = Float.parseFloat(request.getParameter("input-total"));
        
        System.out.println(add_info);

        // Validate user details
        if (fullName == null || fullName.isEmpty() || userAddress == null || userAddress.isEmpty() || phone == null || phone.isEmpty() || email == null || email.isEmpty()) {
            session.setAttribute("err", "Please fill in all the required fields");
            System.out.println("1");
            response.sendRedirect("checkout");
            return;
        }
        if (phone.length() != 10) {
            System.out.println("2");
            session.setAttribute("err", "Phone number must have 10 digits");
            response.sendRedirect("checkout");
            return;
        }
        if (!email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
            System.out.println("3");
            session.setAttribute("err", "Invalid email");
            response.sendRedirect("checkout");
            return;
        }
        try {
            Integer.parseInt(phone);
        } catch (Exception e) {
            System.out.println("4");
            session.setAttribute("err", "Phone number must be a number");
            response.sendRedirect("checkout");
            return;
        }
        if (shippingMethod == 0) {
            System.out.println("5");
            session.setAttribute("err", "Please select a shipping method");
            response.sendRedirect("checkout");
            return;
        }

        // Validate product quantity in the cart
        String ids = request.getParameter("selectedCart");
        if (ids == null || ids.isEmpty()) {
            System.out.println("6");
            response.sendRedirect("cart");
            return;
        }

        LaptopDAO lapdao = new LaptopDAO();
        OrderDAO orderdao = new OrderDAO();
        OrderUserDAO orderUserdao = new OrderUserDAO();

        try {
            String[] idList = ids.split(",");
            List<Integer> idIntList = new ArrayList<>();
            for (String id : idList) {
                idIntList.add(Integer.parseInt(id));
            }
            CartList cartList = (CartList) session.getAttribute("cart");
            HashMap<String, Integer> cartMap = cartList.getCart();
            HashMap<Laptop, Integer> cart = new HashMap<>();
            cartMap.forEach((k, v) -> {
                for (int id : idIntList) {
                    if (Integer.parseInt(k) == id) {
                        Laptop lap = lapdao.getLaptopById(id);
                        cart.put(lap, v);
                    }
                }
            });
            for (Map.Entry<Laptop, Integer> entry : cart.entrySet()) {
                Laptop lap = lapdao.getLaptopById(entry.getKey().getLaptopId());
                int quantity = entry.getValue();
                if (lap.hashCode() < quantity) {
                    session.setAttribute("err", "Not enough quantity for " + lap.getTitle());
                    response.sendRedirect("cart");
                    return;
                }
            }

            String paymentMethod = request.getParameter("paymentMethod");
            if (paymentMethod == null || paymentMethod.isEmpty()) {
                session.setAttribute("err", "Invalid payment method");
                response.sendRedirect("checkout");
                return;
            }

            Order_User orderUser = new Order_User(fullName, userAddress, phone, email, add_info, gender);
            System.out.println(orderUser.getGender());
            Order_User existingUser = orderUserdao.getUserByEmail(email);
            if (existingUser == null) {
                orderUserdao.insertOrderUser(orderUser);
            } else {
                orderUser = existingUser;
            }
            
            System.out.println(orderUser.getGender());

            int salesPersonId = orderdao.selectSales();
            int status = paymentMethod.equals("direct") ? 1 : 0;
            Date order_date = new Date();
            //int order_id, Date order_date, int price, int status, int user_id, int sales_id, String notes
            Order order = new Order(0, order_date, totalPrice, status, orderUser.getOrderUid(),  salesPersonId);
            orderdao.createOrder(order);
            
            System.out.println(order.getOrder_id());
            OrderItemDAO orderItemdao = new OrderItemDAO();
            orderItemdao.insertOrderItem(cart, order.getOrder_id());

            // Calculate estimated delivery date
            String distanceStr = request.getParameter("result");
            if (distanceStr == null || distanceStr.isEmpty()) {
                distanceStr = "1";
            }
            float distance = Float.parseFloat(distanceStr);
            int deliveryDays = calculateDeliveryDays(distance, shippingMethod);
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(order_date);
            calendar.add(Calendar.DAY_OF_MONTH, deliveryDays);
            Date estimatedDeliveryDate = calendar.getTime();

            EmailService emailService = new EmailService();
            emailService.sendPurchaseConfirmationEmail(orderUser, cart, estimatedDeliveryDate.toString(), paymentMethod);
            //reduce the quantity of the product in the database
            for (Map.Entry<Laptop, Integer> entry : cart.entrySet()) {
                Laptop lap = entry.getKey();
                int quantity = entry.getValue();
                lapdao.UpdateQuantity(lap.getLaptopId(), lap.getStock() - quantity);
            }
            // now we can finally add to the front-end yayyyyyyyyyyyy
            // pls end my suffering
            CurrencyConverter currencyConverter = new CurrencyConverter();
            //first, shows all the ordered product
            request.setAttribute("carts", cart);
            //second, the shipping method
            request.setAttribute("shipMethod", shippingMethod);
            //third, the estimated delivery date
            request.setAttribute("deliveryDate", estimatedDeliveryDate);
            //fourth, the payment method
            request.setAttribute("paymentMethod", paymentMethod);
            //fifth, the total price
            request.setAttribute("totalPrice", currencyConverter.convertUsdToVnd(totalPrice));
            //sixth, the order id
            request.setAttribute("orderId", order.getOrder_id());
            //send to the completion.jsp
            request.getRequestDispatcher("completion.jsp").forward(request, response);
        } catch (Exception e) {
            Logger.getLogger(orderCompletion.class.getName()).log(Level.SEVERE, null, e);
            session.setAttribute("err", "Invalid product");
            response.sendRedirect("cart");
        }
    }

    private int calculateDeliveryDays(float distance, int shippingMethod) {
        if (shippingMethod == 1) { // Standard Delivery
            if (distance < 10000) {
                return 3;
            } else if (distance < 30000) {
                return 5;
            } else {
                return 7;
            }
        } else if (shippingMethod == 2) { // Heavy Delivery
            if (distance < 10000) {
                return 5;
            } else if (distance < 30000) {
                return 8;
            } else {
                return 14;
            }
        }
        return 0; // Default case
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
