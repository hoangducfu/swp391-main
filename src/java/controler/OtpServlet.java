/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.AccountDAO;
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
import model.Account;

/**
 *
 * @author hoangduc
 */
public class OtpServlet extends HttpServlet {

    AccountDAO acd = new AccountDAO();

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
        // lấy account đã được đẩy lên session khi sign up
        Account acc = (Account) session.getAttribute("account");
        //gửi mã otp
        SendEmail sm = new SendEmail();
        String code = sm.getRandom();
        String mess = "Code is: " + code;
        if (sm.sendEmail(acc.getUsername(), mess)) {
            session.setAttribute("code", code);
        } else {
            String err = "k gui duoc code";
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
        Account acc = (Account) session.getAttribute("account");
        String code = (String) session.getAttribute("code");
        String err = "";
        // lấy otp mà khách hàng đăng nhập
        try {
            String otp = request.getParameter("otp");
            if (otp.equals(code)) {
                session.removeAttribute("code");
                //nếu session này tồn tại thì sẽ đổi mật khẩu
                if (session.getAttribute("setpass") != null) {

                    String accountId = acd.getIdByUsername(acc.getUsername());
                    String passwordRandom = randomPassword();
                    String passwordMd5 = md5Hash(passwordRandom);
                    // 1 là status password : dùng để kiểm tra xem đây là đăg nhập lần đầu
                    if (acd.setPassWordAccount(acc.getUsername(), passwordMd5, "1")) {
                        SendEmail sm = new SendEmail();
                        String mess = "Mật khẩu mới là: " + passwordRandom;
                        // gửi mật khẩu mới
                        sm.sendEmail(acc.getUsername(), mess);
                        session.removeAttribute("account");
                        response.sendRedirect("loginGoogleHandler");
                    } else {
                        err = "không cập nhật được mật khẩu";
                    }
                } else {// thêm tài khoản đăng kí  
                    if (acd.addAccount(acc.getUsername(), acc.getPassword(), acc.getRoleid(), "0")) {
                        response.sendRedirect("Home.jsp");
                        return;

                    } else {
                        err = "lỗi " + acc.getUsername();
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
