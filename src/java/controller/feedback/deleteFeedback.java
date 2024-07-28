package controller.order;

import dao.FeedbackDAO;
import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "deleteFeedback", urlPatterns = {"/deleteFeedback"})
public class deleteFeedback extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String feedbackId = request.getParameter("feedbackId");

        if (feedbackId != null && !feedbackId.isEmpty()) {
            try {
                int id = Integer.parseInt(feedbackId);
                FeedbackDAO feedbackDAO = new FeedbackDAO();
                boolean deleted = feedbackDAO.deleteFeedback(id);

                if (deleted) {
                    session.setAttribute("success", "Feedback successfully deleted");
                } else {
                    session.setAttribute("err", "Failed to delete feedback");
                }
            } catch (NumberFormatException e) {
                session.setAttribute("err", "Invalid feedback ID");
            } catch (SQLException ex) {
                Logger.getLogger(deleteFeedback.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            session.setAttribute("err", "Feedback ID is required");
        }

        response.sendRedirect("feedback"); // Redirect to the feedback page
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

    @Override
    public String getServletInfo() {
        return "Deletes an order";
    }
}
