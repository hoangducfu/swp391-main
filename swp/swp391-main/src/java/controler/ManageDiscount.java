/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.DiscountDAO;
import dal.EventDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Discount;
import model.Event;
import model.Staff;

/**
 *
 * @author Admin
 */
public class ManageDiscount extends HttpServlet {

    DiscountDAO dis = new DiscountDAO();
    List<Discount> dataDiscount = new ArrayList<>();

    EventDAO eve = new EventDAO();
    List<Event> dataEvent = new ArrayList<>();

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
            out.println("<title>Servlet ManagerDiscount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerDiscount at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Staff staff = (Staff) session.getAttribute("account");
        dataDiscount = dis.getDiscountByStaffId(staff.getId());
        dataEvent = eve.getAllEvent();
        request.setAttribute("dataEvent", dataEvent);
        request.setAttribute("dataDiscount", dataDiscount);
        request.getRequestDispatcher("ManagerDiscount.jsp").forward(request, response);

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
        HttpSession session = request.getSession();
        Staff staff = (Staff) session.getAttribute("account");
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        request.setAttribute("action", action);
        if (action.equals("update")) {
            String status = request.getParameter("status");
            if (status.equals("0")) {
                dis.updateStatusDiscountById(id, "1");
            } else {
                dis.updateStatusDiscountById(id, "0");
            }
            dataDiscount = dis.getALLDiscount();

        }
        if (action.equals("search")) {
            String keyword = request.getParameter("keyword");
            request.setAttribute("keyword", keyword);
            dataDiscount = dis.getDiscountBySearchAndStaffId(staff.getId(),keyword);

        }
        request.setAttribute("dataDiscount", dataDiscount);
        dataEvent = eve.getAllEvent();
        request.setAttribute("dataEvent", dataEvent);
        request.getRequestDispatcher("ManagerDiscount.jsp").forward(request, response);

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
