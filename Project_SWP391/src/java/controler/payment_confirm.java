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
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Customer;
import model.Ticket;

/**
 *
 * @author mactu
 */
public class payment_confirm extends HttpServlet {

    TicketDAO tid = new TicketDAO();

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
            out.println("<title>Servlet payment_confirm</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet payment_confirm at " + request.getContextPath() + "</h1>");
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
        String event_id_raw = request.getParameter("event_id");
        String user_name = request.getParameter("user_name");
        String amount_raw = request.getParameter("vnp_Amount");
        String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");
        String payment_date = request.getParameter("vnp_PayDate");

        HttpSession session = request.getSession();
        Customer acc = (Customer) session.getAttribute("account");
        // chuyển thành định dang năm-tháng-ngày

        // Định dạng ban đầu của chuỗi ngày
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyyMMddHHmmss");

        // Định dạng mong muốn
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            // Phân tích chuỗi ngày gốc thành đối tượng Date
            Date date = inputFormat.parse(payment_date);

            // Chuyển đổi đối tượng Date sang chuỗi ngày với định dạng mong muốn
            String formattedDate = outputFormat.format(date);

            String trasaction_id = request.getParameter("vnp_TransactionNo");
            String status = request.getParameter("vnp_TransactionStatus");
            String payment_method = request.getParameter("vnp_CardType");
//        set lại trạng thái ghế nếu bank not confirm start
            String status_ticket = request.getParameter("status");

            String[] arr = status_ticket.split(",");
            //        
            if (!status.equals("00")) {
                // In mảng sau khi đã chuyển đổi
                for (String element : arr) {
                    //set lại trạng thái ghế nếu bank not confirm
//                    tid.updateStatusTiketNotConfirm(element, event_id_raw);

                    Ticket ticket = tid.getTicketByIdEventAndSeatId(event_id_raw, element);
                    tid.updateStatusTiket(ticket.getTickID(), "0", null);

//                    tid.deleteStatusTiketCheckSeatNotConfirm(ticket.getTickID());
                }
            }
            //end
            int event_id, amount;
            try {
                event_id = Integer.parseInt(event_id_raw);
                // chia 100 để add vào bảng payment
                amount = Integer.parseInt(amount_raw) / 100;
                // có nên thay id seat thành ticketid
                Payment payconfirm = new Payment(event_id, amount, acc.getId(), formattedDate, trasaction_id, vnp_OrderInfo, status, payment_method, status_ticket);
                PaymentDAO pad = new PaymentDAO();
                pad.insertPayment(payconfirm);
                // lấy lại payment ở database để lấy id của nó
                Payment payment = pad.getPaymentByTrasactionId(payconfirm.getTrasaction_id());
                if (status.equals("00")) {
                    for (String element : arr) {
                        Ticket ticket = tid.getTicketByIdEventAndSeatId(event_id_raw, element);
                        tid.updateStatusTiket(ticket.getTickID(), "1", String.valueOf(payment.getPayment_id()));
                    }
                    EventDAO evd = new EventDAO();
                    Event e = evd.getEventById(event_id_raw);
                    String mess = "<p>Chúng tôi xin chân thành cảm ơn bạn đã mua vé của sự kiện \"" + e.getEventName() + "\" trên hệ thống của chúng tôi. Chi tiết đơn hàng:</p>\n"
                            + "        <div class=\"steps\">\n"
                            + "            <ol>\n"
                            + "                <li>Email mua hàng: " + acc.getUsername() + "</li>\n"
                            + "                <li>Tên sự kiện: " + e.getEventName() + "</li>\n"
                            + "                <li>Ghế đã mua: "+status_ticket+"</li>\n"
                            + "                <li>Ngày sự kiện bắt đầu: "+e.getTimeStartFormat()+"</li>\n"
                            + "                <li>Sự kiện diễn ra trong khoảng :"+e.getTimePeriod()+"</li>\n"
                            + "            </ol>\n"
                            + "        </div>\n"
                            + "<p>Chúng tôi mong bạn có mặt trong sự kiện của chúng tôi.</p>";
                    SendEmail sm = new SendEmail();
                    sm.sendEmail(acc.getUsername(), mess);
                } else {
                    request.setAttribute("event_id", event_id_raw);
                    request.getRequestDispatcher("error_selectSeat.jsp").forward(request, response);
                }

//            Cancel_Ticket cancel_ticket = new Cancel_Ticket(user_name, event_id_raw, status_ticket, 1);
                EventDAO event_pay = new EventDAO();
                Event event_pay_confirm = event_pay.getEventById(event_id_raw);
                request.setAttribute("event_pay_confirm", event_pay_confirm);
                request.setAttribute("payconfirm", payconfirm);
//           request.setAttribute("cancel_ticket", cancel_ticket);
                request.getRequestDispatcher("payment_confirm.jsp").forward(request, response);
                return;
            } catch (Exception e) {
            }

        } catch (Exception e) {

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
        processRequest(request, response);
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
