/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controler;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Payment;
import model.Event;
import dal.EventDAO;
import dal.PaymentDAO;
import dal.TicketDAO;
/**
 *
 * @author mactu
 */
public class payment_confirm extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet payment_confirm</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet payment_confirm at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String event_id_raw = request.getParameter("event_id");
        String user_name = request.getParameter("user_name");
        String amount_raw = request.getParameter("vnp_Amount");
        String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
        String payment_date = request.getParameter("vnp_PayDate");
        String trasaction_id = request.getParameter("vnp_TransactionNo");
        String status = request.getParameter("vnp_TransactionStatus");
        String payment_method = request.getParameter("vnp_CardType");
        String status_ticket = request.getParameter("status");
        // chia ra các phần tử của mảng là thứ tự các ghế để set status 
        String[] arr = status_ticket.split(",");
        TicketDAO updateStatus = new TicketDAO();
        // In mảng sau khi đã chuyển đổi
        for (String element : arr) {
            updateStatus.updateStatusTiket(element, event_id_raw);
        }
        int event_id, amount;
        try {
            event_id= Integer.parseInt(event_id_raw);
            amount = Integer.parseInt(amount_raw);
            Payment payconfirm = new Payment(event_id, amount, user_name, payment_date, trasaction_id, vnp_OrderInfo, status, payment_method);
            EventDAO evd = new EventDAO();
            Event event_pay_confirm = evd.getEventById(event_id_raw);
            request.setAttribute("event_pay_confirm", event_pay_confirm);
           PaymentDAO paymentDAO = new PaymentDAO();
           paymentDAO.insertPayment(payconfirm);
           request.setAttribute("payconfirm", payconfirm);
            request.getRequestDispatcher("payment_confirm.jsp").forward(request, response);
        } catch (Exception e) {
        }
     } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
