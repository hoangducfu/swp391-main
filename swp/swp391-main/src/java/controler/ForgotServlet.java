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
public class ForgotServlet extends HttpServlet {
    
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
            out.println("<title>Servlet ForgotServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotServlet at " + request.getContextPath() + "</h1>");
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
        if (!action.equals("staff")) {
            action = "customer";
        }
        request.setAttribute("action", action);
        request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
        return;
        
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
        request.setAttribute("username", username);
        String err = "";
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        request.setAttribute("action", action);
        if (action.equals("customer")) {
//            Account ac = new Account(username);
            if (cud.checkCustomerBan(username)) {
                err = "Tài khoản này của bạn đã bị cấm";
            } else {
                if (cud.checkCustomerExistWithGoogle(username)) {
                    err = "tài khoản này đã đăng kí với google nên không đổi mật khẩu được";
                } else {
                    if (cud.checkCustomerExist(username)) {
                        session.setAttribute("username", username);
                        session.setAttribute("setpass", "customer");
                        response.sendRedirect("otp");
                        return;
                    } else {
                        err = "tài khoản email này không tồn tại";
                    }
                }
            }
            request.setAttribute("err", err);
            request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
        } // để đổi mật khẩu nếu là staff
        else if (action.equals("staff")) {
            if (std.checkStaffExist(username)) {
                if (std.checkStaffBan(username)) {
                    err = "tài khoản của bạn đã bị cấm";
                } else {
                    session.setAttribute("username", username);
                    session.setAttribute("setpass", "staff");
                    response.sendRedirect("otp");
                    return;
                }
            } else {
                err = "tài khoản email này không tồn tại";
            }
        } else {
            // chưa có gì
            err = "lỗi";
        }
        request.setAttribute("err", err);
        request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
        
        return;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    // kiểm tra mật khẩu hợp lệ
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
