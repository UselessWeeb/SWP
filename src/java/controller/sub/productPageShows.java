/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.sub;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
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
import java.util.List;
import model.Laptop;

/**
 *
 * @author M7510
 */
@WebServlet(name="productPageShows", urlPatterns={"/productPageShows"})
public class productPageShows extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            String search = request.getParameter("search") != null ? request.getParameter("search") : "";

            // Parse productCheck parameters
            String[] productChecks = request.getParameterValues("productCheck");
            List<Integer> checkedLaptops = new ArrayList<>();
            if (productChecks != null) {
                for (String productCheck : productChecks) {
                    checkedLaptops.add(Integer.parseInt(productCheck));
                }
            }

            LaptopDAO ldao = new LaptopDAO();
            List<Laptop> list = ldao.getPaginated(page, pageSize, search);
            int totalLaptops = ldao.findByTitle(search);
            int totalPages = (int) Math.ceil((double) totalLaptops / pageSize);

            JsonArray jsonArray = new JsonArray();
            for (Laptop laptop : list) {
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("laptopId", laptop.getLaptopId());
                jsonObject.addProperty("title", laptop.getTitle());
                jsonObject.addProperty("isChecked", checkedLaptops.contains(laptop.getLaptopId()));
                jsonArray.add(jsonObject);
            }

            JsonObject jsonResponse = new JsonObject();
            jsonResponse.add("laptops", jsonArray);
            jsonResponse.addProperty("totalPages", totalPages);

            response.getWriter().write(jsonResponse.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
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
