package controler;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataHandler;
import javax.activation.DataSource;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author hoangduc
 */
public class SendEmail {

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public boolean sendEmail(String toEmail, String code) {
        boolean test = false;
        String fromEmail = "hoangvietduc19602@gmail.com";
        String password = "ywpcpmfyqgadmwui";

        try {
            Properties pr = new Properties();

            pr.put("mail.smtp.host", "smtp.gmail.com");
            pr.put("mail.smtp.port", "587");
            pr.put("mail.smtp.auth", "true");
            pr.put("mail.smtp.starttls.enable", "true");
//            pr.put("mail.smtp.socketFactory.port", "857");
//            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//            
            Authenticator auth = new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            };

            Session session = Session.getInstance(pr, auth);

            // tạo 1 tin nhắn
            MimeMessage mess = new MimeMessage(session);
            mess.addHeader("Content-type", "text/HTML");
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            // tieu de
            mess.setSubject("[Thông báo]");
            //
            String htmlContent = "<!DOCTYPE html>"
                    + "<html>"
                    + "<head>"
                    + "<style>"
                    + "body {font-family: Arial, sans-serif;}"
                    + ".container {padding: 20px;}"
                    + ".header {background-color: #f2f2f2; padding: 10px; text-align: center; font-size: 24px;}"
                    + ".content {margin-top: 20px;}"
                    + ".footer {margin-top: 20px; text-align: center; font-size: 12px; color: #777;}"
                    + ".steps ol {padding-left: 20px;}"
                    + ".steps li {margin-bottom: 10px; }"
                    + ".note {color: red;}"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<div class='header'>Thông báo từ TicketTicket</div>"
                    + "<div class='content'>"
                    + "<p>Kính gửi Quý khách hàng,</p>"
                    //                    + "<p>Đây là mã xác nhận của bạn:</p>"
                     + code 
                    + "<p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</p>"
                    + "</div>"
                    + "<div class='footer'>"
                    + "<p>&copy; 2024 Ticket Ticket. All rights reserved.</p>"
                    + "</div>"
                    + "</div>"
                    + "</body>"
                    + "</html>";

            mess.setContent(htmlContent, "text/html; charset=UTF-8");
            // noi dung 
//            mess.setText(code);
            Transport.send(mess);
            test = true;
        } catch (Exception e) {
        }
        return test;
    }

    public static void main(String[] args) {
        //
        String content = "  <p>Chúng tôi xin chân thành xin lỗi vì một số vấn đề không mong muốn đã xảy ra khiến sự kiện \"<strong>${eventName}</strong>\" phải tạm dừng. Chúng tôi sẽ hoàn lại toàn bộ số tiền mà quý khách đã thanh toán. Xin vui lòng thực hiện các bước sau để được hoàn tiền:</p>\n"
                + "        <div class=\"steps\">\n"
                + "            <ol>\n"
                + "                <li>Đăng nhập vào tài khoản của quý khách.</li>\n"
                + "                <li>Chọn mục \"Lịch sử mua hàng\".</li>\n"
                + "                <li>Chọn đơn hàng có vấn đề.</li>\n"
                + "                <li>Chọn \"Hủy vé\" và điền đầy đủ thông tin cần thiết để được hoàn tiền.</li>\n"
                + "            </ol>\n"
                + "        </div>\n"
                + "        <p class=\"note\"><strong>Lưu ý:</strong> Thao tác này chỉ được thực hiện một lần duy nhất, vì vậy xin vui lòng kiểm tra kỹ thông tin trước khi xác nhận.</p>\n"
                + "        ";
        SendEmail sm = new SendEmail();
        sm.sendEmail("hang184h@gmail.com", content);
    }
}
