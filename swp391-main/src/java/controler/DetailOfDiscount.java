/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controler;

import dal.DiscountDAO;
import dal.EventDAO;
import dal.LocationDAO;
import dal.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Discount;
import model.Event;
import model.Location;

/**
 *
 * @author Admin
 */
public class DetailOfDiscount extends HttpServlet {
   DiscountDAO dis = new DiscountDAO();
    EventDAO evd = new EventDAO();
    List<Event> listevent = new ArrayList<>();
     LocationDAO lod = new LocationDAO();
    TicketDAO tid = new TicketDAO();
           
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
            out.println("<title>Servlet DetailOfDiscount</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailOfDiscount at " + request.getContextPath () + "</h1>");
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
        String did = request.getParameter("did");
       PrintWriter out = response.getWriter();
        String eid = request.getParameter("eid");
        String action = request.getParameter("action");
        // set trang để trở về
        String back = request.getParameter("back");
        if (back == null) {
            back = "exploreshow";
        }
        request.setAttribute("back", back);
        try {
            // update disable event
            if (action != null) {
                if (action.equals("disable")) {
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
        Discount discount = dis.getDiscountId(did);
          listevent = evd.getAllEvent();

        if (discount != null) {
            request.setAttribute("discount", discount);
            request.setAttribute("listevent", listevent);
        } else {
            request.setAttribute("discount", null);
            request.setAttribute("listevent", null);
        }

        request.getRequestDispatcher("DetailofDiscount.jsp").forward(request, response);
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
        processRequest(request, response);
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
