/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

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
import model.Account;
import model.Event;
import model.PaymentCancel;

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
        listcancel.clear();
        // lấy id của staff
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        // lấy tất cả các sự kiện của staff
        listEventIdOfStaff = evd.getAllIdEventOfStaff(account.getId());
        // lấy tất cả các sự kiện của account này
        listevent = evd.getAllEventByAccountId(account.getId());
        // lấy các khiếu nại của khách hàng 
        for (String id : listEventIdOfStaff) {
            listcancel.addAll(pcd.getListCancelByEventId(id));
        }
        request.setAttribute("listcancel", listcancel);
        request.setAttribute("listevent", listevent);
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
        String action = request.getParameter("action");
        String pid = request.getParameter("pid");
        String cid = request.getParameter("cid");
        
        if (action.equals("accept")) {
            // 01 là đồng ý hủy
            pcd.updateStatusPayCancelByPayid(cid, "1");
            // 01 là đồng ý hủy
            pad.update_status_payment(pid, "01");
            // tách các ghế
            String seat = request.getParameter("seat");
            String[] arr = seat.split(",");
            // lấy id của event
            String eid= request.getParameter("eid");
            // xóa ở bảng checkseatid 
            for (String string : arr) {
                tid.deleteStatusTiketNotConfirm(string, eid);
            }
            for (String string : arr) {
                tid.updateStatusTiket(string, eid, "0");
            }
            // update lại ghế ngồi cho khách
            
        }
        if (action.equals("reject")) {
            // 02 là không đồng ý hủy
            pcd.updateStatusPayCancelByPayid(cid, "2");
            // 00 là trạng thái giao dịch quay lại thành công
            pad.update_status_payment(pid, "00");
        }
        doGet(request, response);

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
