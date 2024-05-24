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
public class EmailService {
    private static final String SENDER_EMAIL = "phamnguyenquocanh833@gmail.com";
    private static final String SENDER_NAME = "Shop laptop";
    private static final String SENDER_PASSWORD = "prao mgzs zbfp qhxf ";

    private final Mailer mailer = MailerBuilder.withSMTPServer("smtp.gmail.com", 587, SENDER_EMAIL, SENDER_PASSWORD)
            .withTransportStrategy(TransportStrategy.SMTP_TLS)
            .buildMailer();

    public void sendVerificationEmail(String name, String userMail, String link) {
        String message = "Xin chào " + name + ", \n\n"
                + "Xin cảm ơn quý khách đã đăng ký tài khoản ở trang chúng tôi. "
                + "Quý khách vui lòng bấm vào link ở dưới đây TRONG 30 PHÚT "
                + "kể từ khi nhận được thư này để xác thực email và hoàn tất "
                + "việc đăng ký tài khoản của bạn.\n\n"
                + link
                + "\n\nNếu quý khách không có nhu cầu đăng ký tài khoản với email này, "
                + "quý khách có thể bỏ qua thư này.";

        Email email = EmailBuilder.startingBlank()
                //TODO change email information as needed
                .from(SENDER_NAME, SENDER_EMAIL)
                .to(userMail)
                .withSubject("Xác thực tài khoản của bạn")
                .withPlainText(message)
                .buildEmail();

        mailer.sendMail(email);
    }

    public void sendResetPassEmail(String name, String userMail, String link) {
        String message = "Xin chào " + name + ", \n\n"
                + "Chúng tôi vừa nhận được yêu cầu đổi mật khẩu tài khoản của quý khách. "
                + "Xin quý khách vui lòng bấm vào link dưới đây để thay đổi mật khẩu: \n\n"
                + link
                + "\n\nNếu quý khách không có nhu cầu thay đổi mật khẩu, "
                + "quý khách có thể bỏ qua thư này. "
                + "Link trên sẽ hết hạn sau 30 phút kể từ khi quý khách nhận được thư này.";

        //TODO change email information as needed
        Email email = EmailBuilder.startingBlank()
                .from(SENDER_NAME, SENDER_EMAIL)
                .to(userMail)
                .withSubject("Yêu cầu đổi mật khẩu")
                .withPlainText(message)
                .buildEmail();

        mailer.sendMail(email);
    }
}