/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.CustomerDAO;
import dal.EventDAO;
import dal.PaymentDAO;
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
import model.Staff;

/**
 *
 * @author hoangduc
 */
//adminpayment
public class AdminPaymentServlet extends HttpServlet {

    List<Payment> listpay = new ArrayList<>();
    List<Event> listevent = new ArrayList<>();
    EventDAO evd = new EventDAO();
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
            out.println("<title>Servlet AdminPaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminPaymentServlet at " + request.getContextPath() + "</h1>");
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
        String payStatus = request.getParameter("payStatus");
        String keyword = request.getParameter("keyword");
        PaymentDAO pad = new PaymentDAO();
        // để xem nếu tồn tại paystatus thì là đang search
        if (keyword == null || keyword.trim() == "") {
            if (payStatus == null || payStatus.equals("0")) {
                payStatus = "0";
                listpay = pad.getAllPayment();
            } else {
                listpay = pad.getPaymentByStatus(payStatus);
            }
        }else{
            if (payStatus == null){
                payStatus ="0";
            }
            listpay = pad.getPaymentBySearchKeyWord(payStatus,keyword);
        }
        listcustomer = cud.getAllListAccountCustomer();
        listevent= evd.getAllEvent();
        request.setAttribute("listcustomer", listcustomer);
        request.setAttribute("keyword", keyword);
        request.setAttribute("listevent", listevent);
        request.setAttribute("payStatus", payStatus);
        request.setAttribute("listpay", listpay);
        request.getRequestDispatcher("AdminManagePayment.jsp").forward(request, response);
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
