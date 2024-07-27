/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.CustomerDAO;
import dal.EventDAO;
import dal.PaymentCancelDAO;
import dal.PaymentDAO;
import dal.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Customer;
import model.Event;
import model.Payment;
import model.PaymentCancel;
import model.Staff;
import model.Ticket;

/**
 *
 * @author hoangduc
 */
public class StaffManageCancelTicketServket extends HttpServlet {

    PaymentDAO pad = new PaymentDAO();
    PaymentCancelDAO pcd = new PaymentCancelDAO();
    List<PaymentCancel> listcancel = new ArrayList<>();
    EventDAO evd = new EventDAO();
    List<String> listEventIdOfStaff = new ArrayList<>();
    List<Event> listevent = new ArrayList<>();
    TicketDAO tid = new TicketDAO();
    
    List<Payment> listpay = new ArrayList<>();
    List<Customer> listcustomer = new ArrayList<>();
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
            out.println("<title>Servlet StaffManageCancelTicketServket</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffManageCancelTicketServket at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        //
        listpay.clear();
        // lấy id của staff
        HttpSession session = request.getSession();
        Staff account = (Staff) session.getAttribute("account");
        listevent = evd.getAllEventByAccountId(account.getId());
      String payStatus = request.getParameter("payStatus");
        String keyword = request.getParameter("keyword");
        PaymentDAO pad = new PaymentDAO();
        // để xem nếu tồn tại paystatus thì là đang search
        
        // phải ktra xem nếu list event null thì sao
        if (keyword == null || keyword.trim() == "") {
            if (payStatus == null || payStatus.equals("0")) {
                payStatus = "0";             
            } 
               for (Event event : listevent) {
                    listpay.addAll(pad.getPaymentByEventIdAndStatus(event.getEventId(),payStatus));
                }
        } else {
            if (payStatus == null) {
                payStatus = "0";
            }
            try {
                // xem keyword có phải là int hay không nếu đúng thì nó là id nếu nó là String nó là eventName
                int check = Integer.parseInt(keyword);
                for (Event event : listevent) {
                listpay.addAll(pad.getPaymentBySearchKeyWordIdAndEventId(payStatus, check,event.getEventId()));
                }
            } catch (Exception e) {
                for (Event event : listevent) {
                listpay.addAll(pad.getPaymentBySearchKeyWordNameAndEventId(payStatus, keyword,event.getEventId()));
                }
            }

        }
        listcustomer = cud.getAllListAccountCustomer();
        request.setAttribute("listcustomer", listcustomer);
        request.setAttribute("keyword", keyword);
        request.setAttribute("listevent", listevent);
        request.setAttribute("payStatus", payStatus);
        request.setAttribute("listpay", listpay);
      request.getRequestDispatcher("staffmanagecancelticket.jsp").forward(request, response);
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
       String payid = request.getParameter("payid");
        request.setAttribute("payid", payid);
        String payStatus = request.getParameter("payStatus");
        String keyword = request.getParameter("keyword");
        request.setAttribute("payStatus", payStatus);
        request.setAttribute("keyword", keyword);
        String action = request.getParameter("action");
        // lấy payment cancel có id là 0
        PaymentCancel paymentCancel = pcd.getPaymentCancelByPaymentId(payid);
        // lấy payment by payment id
        Payment payment = pad.getpaymentByID(Integer.parseInt(payid));
        if (action == null) {
            if (payment == null) {
                String check = "0";
                request.setAttribute("check", check);
            }
            request.setAttribute("paymentCancel", paymentCancel);
            request.getRequestDispatcher("DetailBankingStaff.jsp").forward(request, response);
            return;
        }
        if (action.equals("reject")) {
            // 2 là không đồng ý hủy bảng cancel
            pcd.updateStatusPayCancelByPayid(paymentCancel.getCancelTicketId(), "2");
            // 00 là trạng thái giao dịch quay lại thành công
            pad.update_status_payment(String.valueOf(payment.getPayment_id()), "00");
        }
        if (action.equals("accept")) {
            String seat = paymentCancel.getId_seat();
            String[] arr = seat.split(",");
            // lấy id của event
            String eid = paymentCancel.getId_event();
            // bảng cancel 1 là đồng ý hủy
            pcd.updateStatusPayCancelByPayid(paymentCancel.getCancelTicketId(), "1");
            // 01 là đồng ý hủy bảng payment với 01 là hủy
            pad.update_status_payment(String.valueOf(payment.getPayment_id()), "01");
            for (String element : arr) {
                Ticket ticket = tid.getTicketByIdEventAndSeatId(eid, element);
                tid.updateStatusTiket(ticket.getTickID(), "0", null);
            }
            Event event = evd.getEventById(String.valueOf(payment.getEvent_id()));
            Customer customer = cud.getCustomerByCustomerId(payment.getAccountId());
            String mess = "<p>Yêu cầu hủy của bạn đã được xác nhận. Bạn đã hủy thành công vé có mã giao dịch "+payment.getTrasaction_id()+" của sự kiện  \"" + event.getEventName() + "\"</p>\n";
                            
                    SendEmail sm = new SendEmail();
                    sm.sendEmail(customer.getUsername(), mess);
        }
        response.sendRedirect("staffmanagecancelticket?keyword="+keyword+"&payStatus"+payStatus);
    

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
