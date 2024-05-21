/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Order;
import model.User;

/**
 *
 * @author vudai
 */
@MultipartConfig
@WebServlet(urlPatterns = {"/userProfile"})
public class UserProfileServlet extends HttpServlet {

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
            int userId = Integer.parseInt(request.getParameter("id"));
//            Part part = request.getPart("img");
//            String filename = part.getSubmittedFileName();

            String fullName = request.getParameter("fname");
            String gender = request.getParameter("sex");
            String address = request.getParameter("loca");
            String phoneNumber = request.getParameter("phone");
            HttpSession session = request.getSession();
            String filename = "images/aa";
            System.out.println(filename + fullName + gender + phoneNumber + address + userId);
            UserDAO dao = new UserDAO();
            User u = new User( userId, filename, fullName, gender, address, "", phoneNumber, "", "0", 0);
            int n = dao.editCustomer(u);
            if (n > 0) {
                String path = getServletContext().getRealPath("") + "book";
//                File file = new File(path);
//                part.write(path + File.separator + filename);
                session.setAttribute("success", "Cập nhật tài khoản thành công !");
                response.sendRedirect("userProfile.jsp");
            } else {
                session.setAttribute("error", "Lỗi khi cập nhật !");
                response.sendRedirect("userProfile.jsp");
            }
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
        HttpSession session = request.getSession(false);
        User u = (User) session.getAttribute("user");
        OrderDAO dao = new OrderDAO();
        // Perform the database query
        List<Order> orderList = dao.getOrderUser(u.getUserId());
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("displayOrder.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        String image = request.getParameter("image");
        String fname = request.getParameter("fname");
        String sex = request.getParameter("sex");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone"); 
        String pass = request.getParameter("pass");
        String state = request.getParameter("state");
        int role = Integer.parseInt(request.getParameter("role"));

        User u = new User(id, image, fname, sex, address, email, phone, pass, state, role);
        UserDAO dao = new UserDAO();
        int n = dao.editCustomer(u);
        if (n > 0) {
            session.setAttribute("successMsg", "Update User Successfully");
            response.sendRedirect("editProfile.jsp");
        } else {
            session.setAttribute("failedMsg", "Something wrong on server");
            response.sendRedirect("editProfile.jsp");
        }
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
