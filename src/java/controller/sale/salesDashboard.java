/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sale;

import com.google.gson.Gson;
import dao.OrderDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.format.ResolverStyle;
import java.time.temporal.ChronoField;
import java.time.temporal.TemporalAccessor;
import java.time.temporal.TemporalField;
import java.time.temporal.WeekFields;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;
import model.User;
import service.AccessRole;

/**
 *
 * @author M7510
 */
@WebServlet(name = "salesDashboard", urlPatterns = {"/salesDashboard"})
@AccessRole(roles = {
    Role.Type.sale_manager,
    Role.Type.sale})
public class salesDashboard extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        try {
            OrderDAO dao = new OrderDAO();
            UserDAO udao = new UserDAO();

            // Get the start and end dates from the request
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            String userIdStr = request.getParameter("userId"); // Assuming the select input has name="userId"

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate;
            Date endDate;

            if (startDateStr != null && endDateStr != null && !startDateStr.isBlank() && !endDateStr.isBlank()) {
                // Parse the dates
                startDate = formatter.parse(startDateStr);
                endDate = formatter.parse(endDateStr);
            } else {
                // Get the current date and the date 7 days ago
                Calendar cal = Calendar.getInstance();
                endDate = cal.getTime();
                cal.add(Calendar.DATE, -6);
                startDate = cal.getTime();
            }

            // Convert the userId to an integer
            String userId = userIdStr != null ? userIdStr : "";

            Map<Date, Integer> successOrders = dao.getSuccessOrders(startDate, endDate, userId);
            Map<Date, Integer> totalOrders = dao.getTotalOrders(startDate, endDate, userId);
            Map<Date, Float> revenue = dao.getPrice(startDate, endDate, userId);

            request.setAttribute("startDate", formatter.format(startDate));
            request.setAttribute("endDate", formatter.format(endDate));

            //return list of all existing sales/sales_manager
            request.setAttribute("sales", udao.getSales());

            // Set the selected user in the request
            request.setAttribute("selectedUser", userId);

            request.setAttribute("successOrders", new Gson().toJson(successOrders));
            request.setAttribute("totalOrders", new Gson().toJson(totalOrders));
            request.setAttribute("revenue", new Gson().toJson(revenue));
            request.getRequestDispatcher("dashboard.jsp").include(request, response);
        } catch (SQLException | ParseException ex) {
            Logger.getLogger(salesDashboard.class.getName()).log(Level.SEVERE, null, ex);
        }
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

