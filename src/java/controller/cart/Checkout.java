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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.CartList;
import model.Laptop;

/**
 *
 * @author M7510
 */
@WebServlet(name = "Checkout", urlPatterns = {"/checkout"})
public class Checkout extends HttpServlet {

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
        //using the cart session here
        HttpSession session = request.getSession();
        String ids = request.getParameter("ids");
        //simple validation
        if (ids == null || ids.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }
        //check if all the items is integer
        try {
            String[] idList = ids.split(",");
            List<Integer> idIntList = new ArrayList<>();
            for (String id : idList) {
                idIntList.add(Integer.parseInt(id));
            }
            CartList cartList = (CartList) session.getAttribute("cart");
            LaptopDAO lapdao = new LaptopDAO();
            HashMap<String, Integer> cartMap = cartList.getCart();
            HashMap<Laptop, Integer> cart = new HashMap<>();
            cartMap.forEach((k, v) -> {
                //check if the key is in the idList
                for (int id : idIntList) {
                    System.out.println("k = "+ k);
                    System.out.println("id = " + id);
                    if (Integer.parseInt(k) == id) {
                        Laptop lap = lapdao.getLaptopById(id);
                        cart.put(lap, v);
                    }
                }
            });
            request.setAttribute("carts", cart);
            int shipMethod;
            //if the number of product along with their quantity is greater than 3, set shipMethod to 2(heavy ship)
            if (this.getTotalQuantity(cart) > 3){
                shipMethod = 2;
            } else {
                shipMethod = 1;
            }
            request.setAttribute("shipMethod", shipMethod);
            request.setAttribute("selectedItems", ids);
            //this is the checkout page, so we just need to forward to the checkout.jsp
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("cart");
            return;
        }
    }

    public static int getTotalQuantity(HashMap<Laptop, Integer> cart) {
        int totalQuantity = 0;
        for (int quantity : cart.values()) {
            totalQuantity += quantity;
        }
        return totalQuantity;
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
