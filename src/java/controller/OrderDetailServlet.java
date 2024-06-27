package controller;

import dao.AssinDAO;
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
import model.User;

@WebServlet(name = "OrderDetailServlet", urlPatterns = {"/orderdetail"})
public class OrderDetailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        String orderId_raw = request.getParameter("id");
        int orderId = Integer.parseInt(orderId_raw);
        AssinDAO dao = new AssinDAO();
        System.out.println(dao.checkAuth((User)session.getAttribute("user"), orderId));
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        List<OrderItem> orderDetail = orderDetailDAO.getOrderDetail(orderId);
       
        request.setAttribute("orderDetail", orderDetail);
        request.setAttribute("isAbleToEdit", dao.checkAuth((User)session.getAttribute("user"), orderId));
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

