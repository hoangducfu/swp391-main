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
import dal.PaymentDAO;
import java.util.List;
import model.Payment;
import dal.PaymentCancelDAO;

/**
 *
 * @author mactu
 */
public class payment_history extends HttpServlet {

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
        String username = request.getParameter("user_name");
        PaymentDAO pad = new PaymentDAO();
        PaymentCancelDAO pcd = new PaymentCancelDAO();
        List<Payment> pay_history = pad.getpaymentByName(username);
        
        //so sánh với bảng hủy vé với id bằng 1 sau đấy sẽ update lại    /// khả năng thừa
//        for (Payment payment_cancel : pay_history) {
//            String id_pay = Integer.toString(payment_cancel.getPayment_id());
//            int check = pcd.checkCancel(id_pay);
//            if (check == 1) {
//                //01 là hủy vé
//                pad.update_status_payment(String.valueOf(payment_cancel.getPayment_id()) ,"01");
//            }
//        }
        // sửa lại
        if (pay_history == null) {
            request.getRequestDispatcher("sign_in.jsp").forward(request, response);
        }
        request.setAttribute("pay_history", pay_history);
        request.getRequestDispatcher("booking_list.jsp").forward(request, response);
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
