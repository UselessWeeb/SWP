package controller;

import dao.OrderDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import model.Order;
import model.Role;
import model.User;
import service.AccessRole;

/**
 *
 * @author vudai
 */
@MultipartConfig
@WebServlet(urlPatterns = {"/userProfile"})
@AccessRole(roles = {
    Role.Type.admin,
    Role.Type.sale_manager,
    Role.Type.marketing_manager,
    Role.Type.sale,
    Role.Type.marketing,
    Role.Type.customer,})

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
    private static final String UPLOAD_DIRECTORY = "uploads";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String userId = request.getParameter("id");
        String fullName = request.getParameter("fname");
        String gender = request.getParameter("sex");
        String address = request.getParameter("loca");
        String phoneNumber = request.getParameter("phone");
        
        if (phoneNumber.length() != 10) {
            request.setAttribute("error", "Phone Number must have 10 digits");
            request.getRequestDispatcher("userProfile.jsp").forward(request, response);
            return;
        }

        //UserDAO userDAO = new UserDAO();
        UserDAO dao = new UserDAO();

        User user = dao.findById(userId);  // Assuming you have a method to get user by ID

        // Update user details
        user.setFullName(fullName);
        user.setGender(gender);
        user.setAddress(address);
        user.setPhoneNumber(phoneNumber);

        // Handle file upload
        Part filePart = request.getPart("img");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uniqueFileName = System.currentTimeMillis() + "_" + fileName;

            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            File file = new File(uploadPath, uniqueFileName);
            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, file.toPath());
            }

            String userProfileImagePath = UPLOAD_DIRECTORY + "/" + uniqueFileName;
            user.setAvatar(userProfileImagePath);
        }

        session.setAttribute("user", user);

        int n = dao.editCustomer(user);

        if (n > 0) {
            session.setAttribute("success", "Update successful!");
            response.sendRedirect("userProfile.jsp");
        } else {
            request.setAttribute("error", "Update failed!");
            response.sendRedirect("userProfile.jsp");
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
