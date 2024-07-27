/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.EventDAO;
import dal.LocationDAO;
import dal.PaymentDAO;
import dal.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Event;
import model.Location;

/**
 *
 * @author hoangduc
 */
public class EventDetailServlet extends HttpServlet {

    EventDAO evd = new EventDAO();
    LocationDAO lod = new LocationDAO();
    TicketDAO tid = new TicketDAO();
    PaymentDAO pad = new PaymentDAO();
    List<String> listEmailCustomer = new ArrayList<>();

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
            out.println("<title>Servlet EventDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EventDetailServlet at " + request.getContextPath() + "</h1>");
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
        String eid = request.getParameter("eid");
        String action = request.getParameter("action");
        // set trang để trở về

//        request.setAttribute("back", back);
        try {
            // update disable event
            if (action != null) {
                if (action.equals("disable")) {
                    // lấy email danh sách khách hàng 
                    listEmailCustomer = pad.getListEmailByEventId(eid);
                    // cập nhật tât cả các khách hàng đã mua vé sang trạng thái đang xử lý
                    pad.updateStatusPaymentToRefund(eid);
                    String eventName = evd.getNameEventByEventId(eid);
                    for (String email : listEmailCustomer) {
                        String mess = "<p>Chúng tôi xin chân thành xin lỗi vì một số vấn đề không mong muốn đã xảy ra khiến sự kiện \"" + eventName + "\" phải tạm dừng. Chúng tôi sẽ hoàn lại toàn bộ số tiền mà quý khách đã thanh toán. Xin vui lòng thực hiện các bước sau để được hoàn tiền:</p>\n"
                                + "        <div class=\"steps\">\n"
                                + "            <ol>\n"
                                + "                <li>Đăng nhập vào tài khoản của quý khách.</li>\n"
                                + "                <li>Chọn mục \"Lịch sử mua hàng\".</li>\n"
                                + "                <li>Chọn đơn hàng có vấn đề.</li>\n"
                                + "                <li>Chọn \"Hoàn tiền\" và điền đầy đủ thông tin cần thiết để được hoàn tiền.</li>\n"
                                + "            </ol>\n"
                                + "        </div>\n"
                                + "        <p class=\"note\"><strong>Lưu ý:</strong> Thao tác này chỉ được thực hiện một lần duy nhất, vì vậy xin vui lòng kiểm tra kỹ thông tin trước khi xác nhận.</p>";
                        SendEmail sm = new SendEmail();
                        if (sm.sendEmail(email, mess)) {
                        }
                    }
                    evd.updateStatusDisableById(eid);
                }
                else if(action.equals("pause")){
                    evd.updateStatusDisableById(eid);
                }
                
            }
            int seats = tid.getSeatsAvailableByEventId(eid);
            Event event = evd.getEventById(eid);
            Location location = lod.getLocationById(event.getLocationId());
            request.setAttribute("seats", seats);
            request.setAttribute("location", location);
            request.setAttribute("event", event);

        } catch (Exception e) {
        }
        request.getRequestDispatcher("event_detail.jsp").forward(request, response);
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
