/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.CustomerDAO;
import dal.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;
import model.Customer;
import model.Staff;

/**
 *
 * @author hoangduc
 */
public class OtpServlet extends HttpServlet {

    CustomerDAO cud = new CustomerDAO();
    StaffDAO std = new StaffDAO();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OtpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OtpServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        HttpSession session = request.getSession();
        // lấy account đã được đẩy lên session 
        String username = (String) session.getAttribute("username");

        //gửi mã otp
        SendEmail sm = new SendEmail();
        String code = sm.getRandom();
        String mess = "<p>Mã xác nhận là : " + code+"</p>";
        if (sm.sendEmail(username, mess)) {
            session.setAttribute("code", code);
        } else {
            String err = "không gửi được code!!!";
            request.setAttribute("err", err);
        }
        request.getRequestDispatcher("otp.jsp").forward(request, response);
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
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        // lấy account đã được đẩy lên session khi sign up
        String username = (String) session.getAttribute("username");
        String code = (String) session.getAttribute("code");
        String err = "";
        // lấy otp mà khách hàng đăng nhập
        try {
            String otp = request.getParameter("otp");
            if (otp.equals(code)) {
                session.removeAttribute("code");
                String setpass = (String) session.getAttribute("setpass");
                //nếu session này tồn tại thì sẽ đổi mật khẩu
                if (setpass != null) {

                    String passwordRandom = randomPassword();
                    String passwordMd5 = md5Hash(passwordRandom);
                    // 1 là status password : dùng để kiểm tra xem đây là đăg nhập lần đầu
                    if (setpass.equals("customer")) {
                        if (cud.setPassWordAccount(username, passwordMd5, "1")) {
                            SendEmail sm = new SendEmail();
                            String mess = "<p>Mật khẩu mới là: " + passwordRandom+"</p>";
                            // gửi mật khẩu mới
                            sm.sendEmail(username, mess);
                            // xóa session account
                            session.removeAttribute("username");
                            response.sendRedirect("loginGoogleHandler");
                        } else {
                            err = "không cập nhật được mật khẩu";
                        }
                    } else if (setpass.equals("staff")) {
                        /// lỗi
                        if (std.setPassWordAccount(username, passwordMd5, "1")) {
                            SendEmail sm = new SendEmail();
                            String mess = "Mật khẩu mới là: " + passwordRandom;
                            // gửi mật khẩu mới
                            sm.sendEmail(username, mess);
                            // xóa session account
                            session.removeAttribute("username");
                            response.sendRedirect("loginGoogleHandler");
                        } else {
                            err = "không cập nhật được mật khẩu";
                        }
                    } else {
                        err="lỗi2" ;
                        request.getRequestDispatcher("loginGoogleHandler").forward(request, response);
                    }
                } else {// thêm tài khoản đăng kí  
                    Customer acc = (Customer) session.getAttribute("account") ;
                    if (cud.addCustomer(acc.getUsername(), acc.getPassword(), "0", "0")) {
                        Customer account = cud.getCustomerByUsername(acc.getUsername());
                        session.setAttribute("account", account);
                        // sửa
                        response.sendRedirect("exploreshow");
                        return;

                    } else {
                        err = "lỗi " + acc.getUsername() +"    " + acc.getPassword();
                    }
                }
            } else {
                err = "OTP không đúng, hãy kiểm tra lại !!!";
            }
            request.setAttribute("err", err);
            request.getRequestDispatcher("otp.jsp").forward(request, response);
            return;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static String randomPassword() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder stringBuilder = new StringBuilder(8);

        for (int i = 0; i < 8; i++) {
            int index = random.nextInt(characters.length());
            stringBuilder.append(characters.charAt(index));
        }

        return stringBuilder.toString();
    }

    // mã hóa mật khẩu
    public String md5Hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());

            // Chuyển byte array thành dạng hex string
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
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
