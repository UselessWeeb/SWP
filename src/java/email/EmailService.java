/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package email;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Laptop;
import model.Order;
import model.OrderInformation;
import model.Order_User;
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

    public void sendPurchaseConfirmationEmail(Order_User orderUser, HashMap<Laptop, Integer> purchasedProducts, String deliveryDate, String paymentMethod) {
        StringBuilder message = new StringBuilder();
        message.append("<p>Xin chào ")
                .append((orderUser.getGender().equals("Male"))? "ông ": "bà ")
                .append(orderUser.getFullname()).append(",</p>")
                .append("<p>Cảm ơn quý khách đã mua hàng! Dưới đây là thông tin đơn hàng của quý khách:</p>")
                .append("<ul>");

        for (Map.Entry<Laptop, Integer> entry : purchasedProducts.entrySet()) {
            Laptop laptop = entry.getKey();
            int quantity = entry.getValue();
            message.append("<li>").append(laptop.getTitle()).append(" x").append(quantity).append("</li>");
        }

        message.append("</ul>")
                .append("<p>Đơn hàng sẽ được giao vào ngày: ").append(deliveryDate).append("</p>");
                //if the payment is direct, tell user to wait for a call from the store to confirm the order, as well a reminder to prepare the money
                if (paymentMethod.equals("direct")) {
                                message
                                .append("<p>Quý khách vui lòng chờ điện thoại xác nhận đơn hàng từ cửa hàng. Đồng thời, hãy vui lòng chú ý điện thoại để thanh toán cho đơn hàng.</p>")
                                .append("<p>Chúng tôi sẽ giao hàng đến địa chỉ mà quý khách đã cung cấp trong thời gian sớm nhất.</p>");
                }
                else {
                //tell user that this order only last for 24 hours, if user refused to pay, the order will be canceled
                //guide the user on how to pay
                //tell user that the order will be delivered to the address provided as soon as possible
                        message
                        .append("<p>Đơn hàng của quý khách sẽ được giữ trong vòng 24 giờ. Nếu quý khách không thanh toán trong thời gian này, đơn hàng sẽ bị hủy.</p>")
                        .append("<p>Để thanh toán, quý khách có thể trở lại trang và nhấn vào nút 'Purchase', hoặc tới phần myOrder, chọn đơn hàng và làm tương tự</p>");
                }
                message
                .append("<p>Nếu quý khách có bất kỳ câu hỏi hoặc lo lắng nào, xin đừng ngần ngại liên hệ với chúng tôi.</p>")
                .append("<p>Cảm ơn quý khách đã mua sắm tại cửa hàng của chúng tôi!</p>");

        Email email = EmailBuilder.startingBlank()
                .from(SENDER_NAME, SENDER_EMAIL)
                .to(orderUser.getEmail())
                .withSubject("Xác nhận đơn hàng")
                .withHTMLText(message.toString())
                .buildEmail();

        mailer.sendMail(email);
    }
}
