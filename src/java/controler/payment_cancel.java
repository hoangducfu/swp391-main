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
import dal.DAO_event;
import model.Payment_cancel;
import dal.DAO_payment_cancel;
import java.util.List;
/**
 *
 * @author mactu
 */
public class payment_cancel extends HttpServlet {
   
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
            out.println("<title>Servlet payment_cancel</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet payment_cancel at " + request.getContextPath () + "</h1>");
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
        DAO_event cancel = new DAO_event();
        String payment_id = request.getParameter("payment_id");
        String event_id_raw = request.getParameter("event_id");
        String account_name = request.getParameter("account_name");
        String id_seat = request.getParameter("id_seat");
        request.setAttribute("payment_id", payment_id);
        int event_id; 
        try {
         event_id= Integer.parseInt(event_id_raw);
         Event paycancel = cancel.getEvent(event_id);
        request.setAttribute("paycancel", paycancel);
        request.setAttribute("account_name", account_name);
        request.setAttribute("id_seat", id_seat);
        request.setAttribute("payment_id", payment_id);
        request.getRequestDispatcher("payment_cancel.jsp").forward(request, response);
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
       String id_event= request.getParameter("id_event");
       String id_seat= request.getParameter("id_seat");
       String id_pay= request.getParameter("id_pay");
       String username= request.getParameter("username");
       String reason= request.getParameter("reason");
       int status = 0;// đang xử lý, 1 đã hủy, 2 ko thể hủy;
       DAO_payment_cancel cancel = new DAO_payment_cancel();
       Payment_cancel insertcancel = new Payment_cancel(username, id_event, id_seat, id_pay, reason, status);
       cancel.insertpayCancel(insertcancel);
      List< Payment_cancel> showcancel = cancel.getAllCancel_by_user_pending(username);   
      response.sendRedirect("payment_history?user_name="+username);
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
