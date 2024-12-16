/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import static controler.ManageListUser.isPhone;
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Customer;
import model.Staff;

/**
 *
 * @author hoangduc
 */
public class ProfileServlet extends HttpServlet {

    public static boolean isPhone(String str) {
        // Biểu thức chính quy để kiểm tra chuỗi chứa tối đa 10 ký tự số
        String regex = "\\d{10,11}";
        return str.matches(regex);
    }
    CustomerDAO cud = new CustomerDAO();
    StaffDAO std = new StaffDAO();

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

    public boolean isValidString(String str) {
        // Sử dụng biểu thức chính quy để kiểm tra chuỗi
        Pattern pattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,20}$");
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }

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

        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        String edit = request.getParameter("edit");
        // đổi mật khẩu
        if (edit.equals("password")) {
            String curpass_raw = request.getParameter("currentPassword");
            String newpass_raw = request.getParameter("newPassword");
            String comfpass_raw = request.getParameter("confirmPassword");
            String curpass = md5Hash(curpass_raw);
            String comfpass = md5Hash(comfpass_raw);
            String error2 = "";
            if (action.equals("customer")) {
                Customer account = (Customer) session.getAttribute("account");
                // kiểm tra mật khẩu cũ
                if (cud.checkCustomerExist(account.getUsername(), curpass)) {
                    // xác nhận 2 mật khẩu có giống nhau hay không
                    if (newpass_raw.equals(comfpass_raw)) {
                        if (isValidString(newpass_raw)) {
                            if (cud.setPassWordAccount(account.getUsername(), comfpass, "0")) {

                                error2 = "Đổi mật khẩu thành công";
                            } else {
                                error2 = "Không đổi được mật khẩu";

                            }
                        } else {
                            error2 = "Mật khẩu từ 8 đến 20 kí tự bao gồm ít nhất chữ cái thường, chữ hoa, số";
                        }
                    } else {
                        error2 = "Mật khẩu xác nhận không trùng khớp";
                    }

                } else {
                    error2 = "Mật khẩu cũ không chính xác!";
                }
            } else {
                Staff account = (Staff) session.getAttribute("account");
                // kiểm tra mật khẩu cũ
                if (std.checkStaffExist(account.getUsername(), curpass)) {
                    // xác nhận 2 mật khẩu có giống nhau hay không
                    if (newpass_raw.equals(comfpass_raw)) {
                        if (isValidString(newpass_raw)) {
                            if (std.setPassWordAccount(account.getUsername(), comfpass, "0")) {

                                error2 = "Đổi mật khẩu thành công";
                            } else {
                                error2 = "Không đổi được mật khẩu";

                            }
                        } else {
                            error2 = "Mật khẩu từ 8 đến 20 kí tự bao gồm ít nhất chữ cái thường, chữ hoa, số";
                        }
                    } else {
                        error2 = "Mật khẩu xác nhận không trùng khớp";
                    }

                } else {
                    error2 = "Mật khẩu cũ không chính xác!";
                }
            }
            request.setAttribute("error2", error2);
        }// đổi thông tin 
        else {

            String password = request.getParameter("password");

            String phone = request.getParameter("phone");
            if (phone != null) {
                if (!isPhone(phone)) {
                    String error = "Số điện thoại không hợp lệ!";
                    request.setAttribute("error", error);

                    request.getRequestDispatcher("profile.jsp").forward(request, response);

                    return;
                }
            }
            String dob = request.getParameter("dob");
            if (action.equals("customer")) {
                Customer account = (Customer) session.getAttribute("account");
                cud.setProfile(password, phone, dob, account.getUsername());
                account = cud.getCustomerByUsername(account.getUsername());
                session.setAttribute("account", account);

            } else {
                Staff account = (Staff) session.getAttribute("account");
                std.setProfile(password, phone, dob, account.getUsername());
                account = std.getStaffByUsername(account.getUsername());
                session.setAttribute("account", account);

            }
        }
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
