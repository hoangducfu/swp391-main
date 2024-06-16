/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.AccountDAO;
import dal.BookingDAO;
import dal.BookingDetailDAO;
import dal.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Booking;
import model.BookingDetail;
import model.Ticket;

/**
 *
 * @author Pc
 */
public class CheckOutServlet extends HttpServlet {

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
        String ticketId = request.getParameter("ticketId");
        try {
            TicketDAO ticketDAO = new TicketDAO();
            Ticket t = ticketDAO.getTicketById(Integer.parseInt(ticketId));
            request.setAttribute("t", t);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } catch (Exception e) {
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
        processRequest(request, response);
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
        try {
            response.setContentType("text/html;charset=UTF-8");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            String eventId = request.getParameter("eventId");
            String unitPrice = request.getParameter("unitPrice");
            String quantity = request.getParameter("quantity");
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            if (acc != null) {
                AccountDAO accountDAO = new AccountDAO();
                Account accInfo = accountDAO.getAccountByEmail(acc.getUsername());
                Date d = new Date();
                Booking b = new Booking(d, "Success", Double.valueOf(unitPrice) * Integer.parseInt(quantity), Integer.parseInt(eventId), Integer.parseInt(accInfo.getId()), name, phone, address, email);
                BookingDAO bookingDAO = new BookingDAO();

                bookingDAO.createBooking(b);

                int bookingId = bookingDAO.getBookingID();

                BookingDetailDAO bookingDetailDAO = new BookingDetailDAO();
                BookingDetail bd = new BookingDetail(Integer.parseInt(quantity), Double.valueOf(unitPrice), Double.valueOf(unitPrice) * Integer.parseInt(quantity), bookingId);
                bookingDetailDAO.createBookingDetail(bd);

                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("sign_in.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckOutServlet.class.getName()).log(Level.SEVERE, null, ex);
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
