package controller.feedback;

import dao.FeedbackDAO;
import dao.FeedbackImageDAO;
import dao.OrderDAO;
import dao.OrderItemDAO;
import dao.OrderUserDAO;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(name = "feedback", urlPatterns = {"/feedback"})
@MultipartConfig
public class feedback extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String orderId = request.getParameter("orderId");
        HttpSession session = request.getSession();

        if (email != null && !email.isEmpty()) {
            if (!email.matches("^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$")) {
                request.setAttribute("error", "Invalid email format");
            } else {
                try {
                    OrderDAO orderDAO = new OrderDAO();
                    OrderUserDAO userDAO = new OrderUserDAO();
                    Order_User orderUser = userDAO.getUserByEmail(email);
                    List<Order> orders = orderDAO.getByCompletedOrderUser(orderUser);
                    request.setAttribute("email", email);
                    HashMap<Order, List<OrderItem>> items = new HashMap<>();
                    OrderItemDAO itemDAO = new OrderItemDAO();
                    for (Order order : orders) {
                        items.put(order, itemDAO.getByOrderId(order.getOrder_id()));
                    }
                    request.setAttribute("orders", items);

                    if (orderId != null && !orderId.isEmpty()) {
                        Order selectedOrder = orders.stream()
                                .filter(o -> o.getOrder_id() == Integer.parseInt(orderId))
                                .findFirst()
                                .orElse(null);
                        if (selectedOrder != null) {
                            request.setAttribute("selectedOrder", selectedOrder);
                            List<OrderItem> orderItems = itemDAO.getByOrderId(selectedOrder.getOrder_id());
                            request.setAttribute("orderItems", orderItems);
                            if (request.getParameter("productId") != null) {
                                FeedbackDAO feedbackDAO = new FeedbackDAO();
                                if (!request.getParameter("productId").isEmpty()) {
                                    Feedback existingFeedback = feedbackDAO.getFeedbackByOrderIdAndLaptopIdAndUserId(selectedOrder.getOrder_id(), Integer.parseInt(request.getParameter("productId")), orderUser.getOrderUid());
                                    if (existingFeedback != null) {
                                        request.setAttribute("existingFeedback", existingFeedback);
                                        FeedbackImageDAO imageDAO = new FeedbackImageDAO();
                                        List<FeedbackImage> existingImages = imageDAO.getImagesByFeedbackId(existingFeedback.getFeedback_id());
                                        request.setAttribute("existingImages", existingImages);
                                    }
                                } else {
                                    Feedback existingFeedback = feedbackDAO.getFeedbackByOrderIdAndUserId(selectedOrder.getOrder_id(), orderUser.getOrderUid());
                                    if (existingFeedback != null) {
                                        request.setAttribute("existingFeedback", existingFeedback);
                                        FeedbackImageDAO imageDAO = new FeedbackImageDAO();
                                        List<FeedbackImage> existingImages = imageDAO.getImagesByFeedbackId(existingFeedback.getFeedback_id());
                                        request.setAttribute("existingImages", existingImages);
                                    }
                                }
                                request.setAttribute("productId", request.getParameter("productId"));
                            }
                        }
                        request.setAttribute("orderId", orderId);
                    }
                } catch (Exception e) {
                    session.setAttribute("err", "No order found");
                    response.sendRedirect(request.getHeader("referer"));
                    return;
                }
            }
        }
        request.getRequestDispatcher("feedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String orderId = request.getParameter("orderId");
        String productId = request.getParameter("productId");
        String rating = request.getParameter("rating");
        String feedbackText = request.getParameter("feedback");
        String feedbackId = request.getParameter("feedbackId");
        String deleteImage = request.getParameter("action");

        OrderUserDAO userdao = new OrderUserDAO();
        Order_User user = userdao.getUserByEmail(email);
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        FeedbackImageDAO imageDAO = new FeedbackImageDAO();

        HttpSession session = request.getSession(true);

        if (deleteImage != null && !deleteImage.isEmpty()) {
            // Handle image deletion
            String deleteImageId = request.getParameter("imageId");
            int imageId = Integer.parseInt(deleteImageId);
            FeedbackImage image = imageDAO.getFeedbackImageById(imageId);
            if (image != null) {
                String filePath = getServletContext().getRealPath("") + File.separator + image.getImage();
                File file = new File(filePath);
                if (file.exists()) {
                    file.delete();
                }
                imageDAO.deleteImage(imageId);
                session.setAttribute("success", "Image deleted successfully");
            } else {
                session.setAttribute("err", "Image not found");
            }
            response.sendRedirect(request.getHeader("referer"));
            return;
        }

        String uploadPath = getServletContext().getRealPath("") + File.separator + "ratingimage";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        int newFeedbackId;
        if (feedbackId != null && !feedbackId.isEmpty()) {
            // Update existing feedback
            newFeedbackId = Integer.parseInt(feedbackId);
            feedbackDAO.updateFeedback(newFeedbackId, rating, feedbackText);
        } else {
            // Create new feedback
            newFeedbackId = feedbackDAO.saveFeedback(user.getOrderUid(), orderId, productId, rating, feedbackText);
        }

        if (newFeedbackId != -1) {
            List<Part> fileParts = request.getParts().stream()
                    .filter(part -> "images".equals(part.getName()) && part.getSize() > 0)
                    .collect(Collectors.toList());
            for (Part filePart : fileParts) {
                String fileName = System.currentTimeMillis() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String relativePath = "ratingimage" + File.separator + fileName;
                String fullPath = uploadPath + File.separator + fileName;
                filePart.write(fullPath);
                imageDAO.insertFeedbackImage(relativePath, newFeedbackId);
            }
            session.setAttribute("success", "Order feedback updated successfully");
            response.sendRedirect(request.getHeader("referer"));
        } else {
            // Handle the case where feedback insertion failed
            session.setAttribute("err", "Something's wrong, please try again");
            response.sendRedirect(request.getHeader("referer"));
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles feedback submission and image management";
    }
}
