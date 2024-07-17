/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controler;

/**
 *
 * @author hoangduc
 */
public class CHECK {
    public static void main(String[] args) {
        String a="aa";
        String email ="hoangvietduc19602@gmail.com";
        String mess = "<p>Chúng tôi xin chân thành xin lỗi vì một số vấn đề không mong muốn đã xảy ra khiến sự kiện "+a+" phải tạm dừng. Chúng tôi sẽ hoàn lại toàn bộ số tiền mà quý khách đã thanh toán. Xin vui lòng thực hiện các bước sau để được hoàn tiền:</p>\n"
                                + "        <div class=\"steps\">\n"
                                + "            <ol>\n"
                                + "                <li>Đăng nhập vào tài khoản của quý khách.</li>\n"
                                + "                <li>Chọn mục \"Lịch sử mua hàng\".</li>\n"
                                + "                <li>Chọn đơn hàng có vấn đề.</li>\n"
                                + "                <li>Chọn \"Hủy vé\" và điền đầy đủ thông tin cần thiết để được hoàn tiền.</li>\n"
                                + "            </ol>\n"
                                + "        </div>\n"
                                + "        <p class=\"note\"><strong>Lưu ý:</strong> Thao tác này chỉ được thực hiện một lần duy nhất, vì vậy xin vui lòng kiểm tra kỹ thông tin trước khi xác nhận.</p>";
                    
                        SendEmail sm = new SendEmail();
                        if(sm.sendEmail("hoangvietduc19602@gmail.com", mess)){
                        }

    }
}
