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
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Event;
import model.Location;

/**
 *
 * @author hoangduc
 */
//adminevent
public class AdminEventServlet extends HttpServlet {

    EventDAO evd = new EventDAO();
    List<Event> allEvent = new ArrayList<>();
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
    //
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminEventServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminEventServlet at " + request.getContextPath() + "</h1>");
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
        allEvent = evd.getAllEvent();
        allCategory = cad.getAllCategory();
        allLocation = lod.getAlltLocation();
        request.setAttribute("listlocation", allLocation);
        request.setAttribute("listcategory", allCategory);
        request.setAttribute("listevent", allEvent);
        request.getRequestDispatcher("AdminEvent.jsp").forward(request, response);
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
        allLocation = lod.getAlltLocation();
        allCategory = cad.getAllCategory();
        //
        request.setAttribute("listcategory", allCategory);
        request.setAttribute("listlocation", allLocation);
        //
        String lid = request.getParameter("lid");
        String keyword = request.getParameter("keyword").trim();
        //

        //
        String cid = request.getParameter("cid");
        String disable = request.getParameter("disable");
        //

        String mode = request.getParameter("mode");
        if (disable == null) {
            disable = "2";
        }
        if (cid == null|| cid =="") {
            cid = "0";
        }
        if (keyword == null ) {
            keyword = "";
        }
        if (lid == null || lid == "") {
            lid = "0";
        }
        request.setAttribute("lid", lid);
        request.setAttribute("keyword", keyword);
        request.setAttribute("cid", cid);
        request.setAttribute("disable", disable);

        if (mode.equals("search1")) {
            if (lid.equals("0") && (keyword == null || keyword == "")) {
                allEvent = evd.getAllEvent();
            } else {
                allEvent = evd.getEventBySearch1(keyword, lid);
            }
        }
        if (mode.equals("search2")) {
            if (lid.equals("0") && (keyword == null || keyword == "") && (cid.equals("0")) && disable.equals("2")) {
                allEvent = evd.getAllEvent();
            } else {
                allEvent = evd.getEventBySearch2(keyword, lid, cid, disable);
            }
        }
        request.setAttribute("listevent", allEvent);

        request.getRequestDispatcher("AdminEvent.jsp").forward(request, response);
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
