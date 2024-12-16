package controler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.DiscountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import dal.EventDAO;
import dal.TicketDAO;
import model.Event;
import model.Ticket;

/**
 *
 * @author mactu
 */
public class VnpaytestServlet extends HttpServlet {

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
            out.println("<title>Servlet vnpaytest</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet vnpaytest at " + request.getContextPath() + "</h1>");
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
        String amount_raw = request.getParameter("amount");
        String integerPart = amount_raw.split("\\.")[0];
        String quantity_raw = request.getParameter("quantity");
        String status = request.getParameter("status");

        int quantity, amount;
        String err = "";
        String pass = "";
//        int discountAmount = 0;
//        int DiscountPercent =
        try {
            amount = Integer.parseInt(integerPart);
            quantity = Integer.parseInt(quantity_raw);
            EventDAO paynemt = new EventDAO();
            Event payment_event = paynemt.getEventById(event_id_raw);
            request.setAttribute("event_id", event_id_raw);
            request.setAttribute("event", payment_event);
            request.setAttribute("amount", amount);
            request.setAttribute("quantity", quantity);
            request.setAttribute("status", status);
            // set trạng thái ghế đã  có người mua nếu ko có sự kiện quay lại hoặc thoát trang
            String discountCode = request.getParameter("discountCodeInput");
            request.setAttribute("discountCode", discountCode);

            if (discountCode != null && discountCode.trim() != "") {
                DiscountDAO d = new DiscountDAO();

                if (d.checkDiscountForEvent(discountCode, event_id_raw)) {
//                    if(d.isDiscountValidForEvent(discountCode, event_id_raw)){
                    int DiscountPercent = d.getPercentByCode(discountCode);
                    int discountAmount = amount - (amount * DiscountPercent) / 100;
                    pass = "Bạn đã áp mã giảm giá thành công";
                    request.setAttribute("discountAmount", discountAmount);
                } else {
                    err = "Mã giảm giá không hợp lệ ";
                    request.setAttribute("discountAmount", amount);
                }
            } else {
                request.setAttribute("discountAmount", amount);

            }

        } catch (Exception e) {
            err = "Lỗi chuyển đổi giá trị giảm giá";
            e.printStackTrace();
        }
        request.setAttribute("err", err);
        request.setAttribute("pass", pass);
        request.getRequestDispatcher("payment_ticket.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_name = req.getParameter("username");
        // lưu trạng thái ghế trước khi pay :start
        String status = req.getParameter("status");
        String event_id_raw = req.getParameter("event_id");
        String[] arr = status.split(",");
        String discountCode = req.getParameter("discountCode");
        TicketDAO tid = new TicketDAO();
        // In mảng sau khi đã chuyển đổi
        // sai
        int check_seat = 0;
        for (String element : arr) {
            Ticket ticket = tid.getTicketByIdEventAndSeatId(event_id_raw, element);
            check_seat = tid.checkSeatByTicketId(ticket.getTickID(), "1");
            if (check_seat != 0) {
                break;
            }
        }
        //thanh toán lỗi
        if (check_seat != 0) {
            req.setAttribute("event_id", event_id_raw);
            req.getRequestDispatcher("error_selectSeat.jsp").forward(req, resp);
        } else {
            for (String element : arr) {
                Ticket ticket = tid.getTicketByIdEventAndSeatId(event_id_raw, element);
//                CheckSeat noDoneSeat = new CheckSeat(ticket.getTickID());
//                tid.insertDoneSeat(noDoneSeat);
                tid.updateStatusTiket(ticket.getTickID(), "1", null);
            }
            DiscountDAO did = new DiscountDAO();
            if(discountCode == null){
                
            } else if (discountCode != null || discountCode.trim() != "") {
                did.updateQuantityPromotion(event_id_raw, discountCode);
            }
            // end

            String vnp_Version = "2.1.0";
            String vnp_Command = "pay";
            String orderType = "other";
            long amount = Integer.parseInt(req.getParameter("amount")) * 100;
            String bankCode = req.getParameter("bankCode");

            String vnp_TxnRef = Config.getRandomNumber(8);//mã đơn hàng // có thể thay bằng id vé
            String vnp_IpAddr = Config.getIpAddress(req);

            String vnp_TmnCode = Config.vnp_TmnCode;

            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", vnp_Version);
            vnp_Params.put("vnp_Command", vnp_Command);
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf(amount));
            vnp_Params.put("vnp_CurrCode", "VND");

            if (bankCode != null && !bankCode.isEmpty()) {
                vnp_Params.put("vnp_BankCode", bankCode);
            }
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            // sửa
            vnp_Params.put("vnp_OrderInfo", " Thanh Toan Thanh Cong");
            vnp_Params.put("vnp_OrderType", orderType);

            String locate = req.getParameter("language");
            if (locate != null && !locate.isEmpty()) {
                vnp_Params.put("vnp_Locale", locate);
            } else {
                vnp_Params.put("vnp_Locale", "vn");
            }
            String event_id = req.getParameter("event_id");

            vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl + "?" + "event_id=" + event_id + "&" + "user_name=" + user_name + "&status=" + status);
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String vnp_CreateDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

            cld.add(Calendar.MINUTE, 15);
            String vnp_ExpireDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

            List fieldNames = new ArrayList(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            Iterator itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = (String) itr.next();
                String fieldValue = (String) vnp_Params.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    //Build hash data
                    hashData.append(fieldName);
                    hashData.append('=');
                    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    //Build query
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                    query.append('=');
                    query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    if (itr.hasNext()) {
                        query.append('&');
                        hashData.append('&');
                    }
                }
            }

            String queryUrl = query.toString();
            String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
            queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
            String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
            com.google.gson.JsonObject job = new JsonObject();
            job.addProperty("code", "00");
            job.addProperty("message", "success");
            job.addProperty("data", paymentUrl);
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(job));
            resp.sendRedirect(paymentUrl);
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
