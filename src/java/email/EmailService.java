/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package email;

import org.simplejavamail.api.email.Email;
import org.simplejavamail.api.mailer.Mailer;
import org.simplejavamail.api.mailer.config.TransportStrategy;
import org.simplejavamail.email.EmailBuilder;
import org.simplejavamail.mailer.MailerBuilder;

/**
 *
 * @author phamn
 */
//TODO: CHANGE ALL OF THESE :V
public class EmailService {

    private final Mailer mailer = MailerBuilder.withSMTPServer("smtp.gmail.com", 587, "phamnguyenquocanh833@gmail.com", "prao mgzs zbfp qhxf ")
            .withTransportStrategy(TransportStrategy.SMTP_TLS)
            .buildMailer();

    public void sendVerificationEmail(String name, String userMail, String link) {
        Email email = EmailBuilder.startingBlank()
                .from("FROM MAIL", "phamnguyenquocanh833@gmail.com")
                .to(name, userMail)
                .withSubject("Xác thực tài khoản của bạn trên trang ") //TODO ADD WEBSITE NAME HERE
                .withPlainText("") //TODO ADD MAIL MESSSAGE + LINK
                .buildEmail();

        mailer.sendMail(email);
    }
    
    public void sendResetPassEmail(String name, String userMail, String link) {
        String message = "Xin chào " 
                + name 
                + ", chúng tôi xin được gửi cho quý khách link đổi mật khẩu. "
                + "Quý khách vui lòng truy cập vào link được đính kèm trong 30 phút" 
                + " từ khi nhận được thư này. "
                + "Nếu bạn không yêu cầu đổi mật khẩu, bạn có thể an tâm bỏ qua thư này."
                + "\n\nLink đổi mật khẩu: ";
        
        
        Email email = EmailBuilder.startingBlank()
                .from("FROM MAIL", "phamnguyenquocanh833@gmail.com")
                .to(name, userMail)
                .withSubject("Yêu cầu đổi mật khẩu") //TODO ADD WEBSITE NAME HERE
                .withPlainText(message) //TODO ADD MAIL MESSSAGE + TOKEN LINK
                .buildEmail();

        mailer.sendMail(email);
    }
}
