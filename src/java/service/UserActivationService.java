/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.TokenDAO;
import dao.UserDAO;
import email.EmailService;
import jakarta.servlet.http.HttpServletRequest;
import model.Token;
import model.User;
import util.HashUtil;
import util.RandomString;

import java.time.LocalDateTime;

public class UserActivationService {

    private UserDAO userDao = new UserDAO();
    private TokenDAO tokenDao = new TokenDAO();
    private EmailService emailService = new EmailService();
    private HashUtil hash = new HashUtil();
    private RandomString random = new RandomString();

    public void activateUser(User user, HttpServletRequest request) {
        String token;

        while (true) {
            token = random.generateRandomString(32);

            if (!tokenDao.checkIfTokenExist(token)) {
                break;
            }
        }
        
        //if user already send a request before and still able to verify with it, not send email
        if (!tokenDao.checkUserRequest(user.getUserId())) {

            tokenDao.addNewToken(new Token(
                    token,
                    userDao.getUserIdByEmail(user.getEmail()),
                    LocalDateTime.now(),
                    0
            ));

            String link = generateVerificationLink(request, token);

            emailService.sendVerificationEmail(user.getFullName(), user.getEmail(), link);
        }
    }

    private String generateVerificationLink(HttpServletRequest request, String token) {
        String scheme = request.getScheme();             // http
        String serverName = request.getServerName();     // hostname.com
        int serverPort = request.getServerPort();        // 80
        String contextPath = request.getContextPath();   // /app-name

        // Reconstruct original requesting URL
        StringBuilder url = new StringBuilder();
        url.append(scheme).append("://").append(serverName);

        if (serverPort != 80 && serverPort != 443) {
            url.append(":").append(serverPort);
        }

        url.append(contextPath);

        url.append("/verify?token=").append(token);

        return url.toString();
    }
}
