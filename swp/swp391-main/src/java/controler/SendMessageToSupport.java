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
import model.Customer;

/**
 *
 * @author hoangduc
 */
public class SendMessageToSupport extends HttpServlet {

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
            out.println("<title>Servlet SendMessageToSupport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMessageToSupport at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("SendReportToAdmin.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String phone = request.getParameter("phone");
        String mess = request.getParameter("mess");
        request.setAttribute("mess", mess);
        request.setAttribute("phone", phone);
        String err = "";
        String success = "";

        if (isPhone(phone)) {
            if (mess.length() < 1000) {
                Customer customer = (Customer) session.getAttribute("account");
                String emailAdmin = std.getEmailAdmin();
                SendEmail sm = new SendEmail();
                String code = "<p>Một người dùng TicketTicket có email là: " + customer.getUsername() + "</p>"
                        + "<p>Số điện thoại: " + phone + "</p>"
                        + "<p>Đã gửi một thông báo cho bạn:</p>"
                        + "<p>" + mess + "</p>";
                if(sm.sendEmail(emailAdmin, code)){
                    success = "Đã gửi thành công.";
                }else{
                    err="Lỗi không gửi được email";
                }
                
                
            } else {
                err = "Độ dài đoạn tin phải dưới nhỏ hơn 1000 ký tự";
            }
        } else {
            err = "Số điện thoại phải dài từ 10 đến 11 số";
        }
        request.setAttribute("err",err);
        request.setAttribute("success",success);
        request.getRequestDispatcher("SendReportToAdmin.jsp").forward(request, response);
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

    public boolean isPhone(String str) {
        // Biểu thức chính quy để kiểm tra chuỗi chứa tối đa 10 ký tự số
        String regex = "\\d{10,11}";
        return str.matches(regex);
    }
}
