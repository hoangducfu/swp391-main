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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Customer;
import model.Staff;

/**
 *
 * @author hoangduc
 */
public class ChangePasswordServerlet extends HttpServlet {

    StaffDAO std = new StaffDAO();
    CustomerDAO cud = new CustomerDAO();

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
            out.println("<title>Servlet ChangePasswordServerlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordServerlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        if (action != null) {
            request.setAttribute("action", action);
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("loginGoogleHandler");
        }
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String action = request.getParameter("action");
        request.setAttribute("action", action);
        String err = "";

        if (!password.equals(repassword)) {
            err = "Tài khoản và mật khẩu không trùng khớp";
        } else {
            if (!isValidString(password)) {
                err = "Mật khẩu từ 8 đến 20 kí tự bao gồm ít nhất chữ cái thường, chữ hoa, số";
            } else {
                err = "???";
                //mã hóa mật khẩu
                String passwordMd5 = md5Hash(password);
                if (action.equals("customer")) {
                    // set status về 0 sau khi cập nhật được mật khẩu
                    if (cud.setPassWordAccount(username, passwordMd5, "0")) {
                        HttpSession session = request.getSession();
                        Customer account = cud.getCustomerByUsername(username);
                        session.setAttribute("account", account);
                        response.sendRedirect("exploreshow");
                        return;
                    }
                } else if (std.setPassWordAccount(username, passwordMd5, "0")) {
                    HttpSession session = request.getSession();
                    Staff account = std.getStaffByUsername(username);
                    session.setAttribute("account", account);
                    if (account.getRoleId().equals("2")) {
                        response.sendRedirect("createevent");
                    }else{
                        response.sendRedirect("managerlist");
                    }
                    return;

                }

            }
        }
        request.setAttribute("err", err);
        request.getRequestDispatcher("change_password.jsp").forward(request, response);
        return;
    }
    // kiểm tra mật khẩu hợp lệ

    public boolean isValidString(String str) {
        // Sử dụng biểu thức chính quy để kiểm tra chuỗi
        Pattern pattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,20}$");
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
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
