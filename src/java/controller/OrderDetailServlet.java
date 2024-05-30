package controller;

import dao.OrderDetailDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.OrderItem;
import model.Order_Information;

@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/orderdetail"})
public class OrderDetailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        String orderId_raw = request.getParameter("id");
        int orderId = Integer.parseInt(orderId_raw);

        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        List<OrderItem> orderDetail = orderDetailDAO.getOrderDetail(orderId);
        
        System.out.println(orderDetail);

        request.setAttribute("orderDetail", orderDetail);
        request.getRequestDispatcher("orderdetail.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}

