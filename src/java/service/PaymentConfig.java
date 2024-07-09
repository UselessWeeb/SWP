package service;

import jakarta.servlet.http.HttpServletRequest;
import java.security.SecureRandom;
import java.util.Random;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

/**
 *
 * @author M7510
 */
public class PaymentConfig {
    public String TmnCode = "YLXUCMX8";
    public Object vnp_Returnurl = "http:/localhost:9999/app-name/";
    public String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    public String vnp_HashSecret = "GK3EP2NLJ50NMS73S1G443WD29UQ3YU3";
    public static String vnp_ApiUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";

    public String getTmnCode() {
        return TmnCode;
    }

    public void setTmnCode(String TmnCode) {
        this.TmnCode = TmnCode;
    }

    public String getIpAddress(HttpServletRequest req) {
        String ipAddress = req.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {
            ipAddress = req.getRemoteAddr();
        }
        return ipAddress;
    }

    public String getRandomNumber(int length) {
        Random random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(random.nextInt(10)); // Append a random digit (0-9)
        }
        return sb.toString();
    }

    public String hmacSHA512(String key, String data) {
        try {
            Mac sha512_HMAC = Mac.getInstance("HmacSHA512");
            SecretKeySpec secret_key = new SecretKeySpec(key.getBytes(), "HmacSHA512");
            sha512_HMAC.init(secret_key);

            byte[] hash = sha512_HMAC.doFinal(data.getBytes());
            return Base64.getEncoder().encodeToString(hash);
        } catch (Exception e) {
            throw new RuntimeException("Failed to calculate HMAC SHA-512", e);
        }
    }
}