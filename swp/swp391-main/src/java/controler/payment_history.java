/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.EventDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.PaymentDAO;
import java.util.List;
import model.Payment;
import dal.PaymentCancelDAO;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Customer;
import model.Event;

/**
 *
 * @author mactu
 */
public class payment_history extends HttpServlet {

    List<Payment> pay_history = new ArrayList<>();
    List<Event> listevent = new ArrayList<>();
    EventDAO evd = new EventDAO();

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
            out.println("<title>Servlet payment_history</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet payment_history at " + request.getContextPath() + "</h1>");
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
//        String username = request.getParameter("user_name");
        String err= request.getParameter("err");
        String payStatus = request.getParameter("payStatus");
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("account");
        PaymentDAO pad = new PaymentDAO();
        // để xem nếu tồn tại paystatus thì là đang search
        if (payStatus == null || payStatus.equals("0")) {
            payStatus = "0";
            pay_history = pad.getpaymentById(customer.getId());
        } else {
            pay_history = pad.getPaymentByAccountIdAndStatus(customer.getId(), payStatus);
        }
        // sửa lại
        if (pay_history == null) {
            String mess = "Không có giao dịch nào";
            request.setAttribute("mess", mess);
        }
        listevent = evd.getAllEvent();
        request.setAttribute("listevent", listevent);
        request.setAttribute("payStatus", payStatus);
        request.setAttribute("pay_history", pay_history);
        request.getRequestDispatcher("booking_list.jsp").forward(request, response);
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
//        HttpSession session = request.getSession();
//        Customer customer = (Customer) session.getAttribute("account");
//        PaymentDAO pad = new PaymentDAO();
//        pay_history = pad.getpaymentById(customer.getId());
//        // sửa lại
//        if (pay_history == null) {
//            String mess = "Không có giao dịch nào";
//            request.setAttribute("mess", mess);
//        }
//        
//        request.setAttribute("pay_history", pay_history);
//        request.getRequestDispatcher("booking_list.jsp").forward(request, response);
//        return;
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
