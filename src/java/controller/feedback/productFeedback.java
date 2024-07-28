/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.feedback;

import dao.FeedbackDAO;
import dao.FeedbackImageDAO;
import dao.OrderUserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import model.Feedback;
import model.FeedbackImage;
import model.Order_User;

/**
 *
 * @author M7510
 */
@WebServlet(name = "productFeedback", urlPatterns = {"/productFeedback"})
public class productFeedback extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        try {
            int laptopId = Integer.parseInt(request.getParameter("laptopId"));
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            OrderUserDAO userDAO = new OrderUserDAO();
            FeedbackImageDAO imageDAO = new FeedbackImageDAO();

            // Fetch feedback for the specified laptop
            List<Feedback> feedbacks = feedbackDAO.getFeedbackForLaptop(laptopId);

            // Validate feedback
            feedbacks = feedbacks.stream()
                    .filter(fb -> fb.getRated_star() >= 1 && fb.getRated_star() <= 5) // Ensure rating is between 1 and 5
                    .filter(fb -> fb.getFeedback() != null && !fb.getFeedback().trim().isEmpty()) // Ensure feedback is not empty
                    .collect(Collectors.toList());

            // Organize feedback by user
            HashMap<Order_User, HashMap<Feedback, List<FeedbackImage>>> feedbackList = new HashMap<>();
            for (Feedback feedback : feedbacks) {
                HashMap<Feedback, List<FeedbackImage>> feedbackByUser = new HashMap<>();
                feedbackByUser.put(feedback, imageDAO.getImagesByFeedbackId(feedback.getFeedback_id()));
                feedbackList.put(userDAO.getById(feedback.getOrder_uid()), feedbackByUser);
            }

            // Add sorted feedback to request attribute
            List<Map.Entry<Order_User, HashMap<Feedback, List<FeedbackImage>>>> sortedFeedbackList = feedbackList.entrySet()
                    .stream()
                    .sorted((entry1, entry2) -> {
                        Feedback fb1 = entry1.getValue().keySet().iterator().next();
                        Feedback fb2 = entry2.getValue().keySet().iterator().next();
                        return Float.compare(fb2.getRated_star(), fb1.getRated_star()); // Sort by rating descending
                    })
                    .collect(Collectors.toList());

            request.setAttribute("listfeedback", sortedFeedbackList);
        } catch (Exception e) {
            session.setAttribute("err", "Something went wrong, please try again later");
            System.out.println(e);
        }
        request.getRequestDispatcher("view/feedback.jsp").include(request, response);
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
