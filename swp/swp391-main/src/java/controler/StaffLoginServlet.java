/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

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
import model.Staff;

/**
 *
 * @author hoangduc
 */
public class StaffLoginServlet extends HttpServlet {

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
            out.println("<title>Servlet StaffLoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffLoginServlet at " + request.getContextPath() + "</h1>");
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
        // nhảy về link login của staff
        request.getRequestDispatcher("sign_in_staff.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordMd5 = md5Hash(password);
        String err = "";
        if (std.checkStaffBan(email)) {
            err = "Tài khoản của bạn đã bị cấm";
        } else {
            if (std.checkStaffExist(email, passwordMd5)) {
                if (std.checkStatusPassword(email)) {
                    Staff ac = std.getStaffByUsername(email);
                    session.setAttribute("account", ac);
                    response.sendRedirect("changepassword?action=staff");
                    return;
                } else {
                    // nhay ve home
                    Staff account = std.getStaffByUsername(email);
                    session.setAttribute("account", account);

                    //link này đăng nhập của customer
                    if (account.getRoleId().equals("1")) {
                        response.sendRedirect("report");
                    } else {
                        response.sendRedirect("staffevent");
                    }
                    return;

                }
            } else {
                err = "Tài khoản hoặc mật khẩu không chính xác";
            }
        }
        request.setAttribute("email", email);
        request.setAttribute("err", err);
        request.getRequestDispatcher("sign_in_staff.jsp").forward(request, response);
        return;
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
}
