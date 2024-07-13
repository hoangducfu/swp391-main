/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.CategoryDAO;
import dal.EventDAO;
import dal.LocationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Event;
import model.Location;
import model.Staff;

/**
 *
 * @author hoangduc
 */
public class EventOfStaffServlet extends HttpServlet {

    EventDAO evd = new EventDAO();
    List<Event> dataevent = new ArrayList<>();
    CategoryDAO cad = new CategoryDAO();
    List<Category> allCategory = new ArrayList<>();
    LocationDAO lod = new LocationDAO();
    List<Location> allLocation = new ArrayList<>();

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
            out.println("<title>Servlet EventOfStaffServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EventOfStaffServlet at " + request.getContextPath() + "</h1>");
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
        Staff account = (Staff) session.getAttribute("account");
        dataevent = evd.getAllEventByAccountId(account.getId());
        request.setAttribute("dataevent", dataevent);
        allCategory = cad.getAllCategory();
        allLocation = lod.getAlltLocation();
        request.setAttribute("listlocation", allLocation);
        request.setAttribute("listcategory", allCategory);
        request.getRequestDispatcher("EventofStaff.jsp").forward(request, response);
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
        Staff account = (Staff) session.getAttribute("account");
        allLocation = lod.getAlltLocation();
        allCategory = cad.getAllCategory();
        
        request.setAttribute("listcategory", allCategory);
        request.setAttribute("listlocation", allLocation);

        String cid = request.getParameter("cid");
        String disable = request.getParameter("disable");
        request.setAttribute("disable", disable);
        if (cid == null) {
            cid = "0";
        }
        request.setAttribute("cid", cid);

        dataevent = evd.getEventOfStaffBySearch(cid, disable,account.getId());
        request.setAttribute("dataevent", dataevent);
        request.getRequestDispatcher("EventofStaff.jsp").forward(request, response);

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
