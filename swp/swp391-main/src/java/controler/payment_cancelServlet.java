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
import model.Event;
import dal.EventDAO;
import model.PaymentCancel;
import dal.PaymentCancelDAO;
import dal.PaymentDAO;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Customer;

/**
 *
 * @author mactu
 */
public class payment_cancelServlet extends HttpServlet {
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
            out.println("<title>Servlet payment_cancel</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet payment_cancel at " + request.getContextPath() + "</h1>");
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
        EventDAO cancel = new EventDAO();
        String payment_id = request.getParameter("payment_id");
        String event_id_raw = request.getParameter("event_id");
        String id_seat = request.getParameter("id_seat");
        request.setAttribute("payment_id", payment_id);
        String mode = request.getParameter("mode");
        request.setAttribute("mode", mode);
        String err = "";
        if (mode.equals("cancel")) {
            if (evd.checkStatusDisableByEventId(event_id_raw)) {
                err = "Sự kiện này đã kết thúc nên không thể hủy vé";
                request.setAttribute("err", err);
                request.getRequestDispatcher("payment_history").forward(request, response);
                return;
            }
        }
        try {
            Event eventpaycancel = cancel.getEventById(event_id_raw);
            request.setAttribute("eventpaycancel", eventpaycancel);
            request.setAttribute("id_seat", id_seat);
            request.setAttribute("payment_id", payment_id);
            request.getRequestDispatcher("payment_cancel.jsp").forward(request, response);
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
                String mode = request.getParameter("mode");
        String id_event = request.getParameter("id_event");
        String id_seat = request.getParameter("id_seat");
        String id_pay = request.getParameter("id_pay");
        String reason = request.getParameter("reason");
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("account");
        // thêm bank name, bank number
        String bank_name = request.getParameter("bank_name");
        String bank_number = request.getParameter("bank_number");
        int status = 0;// đang xử lý, 1 đã hủy, 2 ko thể hủy;
        PaymentCancelDAO pcd = new PaymentCancelDAO();
        PaymentCancel insertcancel = new PaymentCancel(customer.getId(), id_event, id_seat, id_pay, reason, bank_name, bank_number, status);
//        int check = pad.check_canceling(id_pay);//sua thanh neu co trong bang dang xu ly 
//        if (check != 1) {
            pcd.insertpayCancel(insertcancel);
            PaymentDAO  pad = new PaymentDAO();
            pad.update_status_payment(id_pay, "03");
//            List< Payment_cancel> showcancel = pad.getAllCancel_by_user_pending(username);
            response.sendRedirect("payment_history");
//        } else {
//            request.getRequestDispatcher("error_cancel.jsp").forward(request, response);
//        }
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
