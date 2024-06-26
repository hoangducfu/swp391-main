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
import model.Category;
import dal.CategoryDAO;
import dal.DiscountDAO;
import dal.EventDAO;
import dal.LocationDAO;
import java.util.ArrayList;
import java.util.List;
import model.Discount;
import model.Event;
import model.Location;

public class ExploreShowServlet extends HttpServlet {

    EventDAO evd = new EventDAO();
    List<Event> allEvent = new ArrayList<>();
    CategoryDAO cad = new CategoryDAO();
    List<Category> allCategory = new ArrayList<>();
    LocationDAO lod = new LocationDAO();
    List<Location> allLocation = new ArrayList<>();
    DiscountDAO dis = new DiscountDAO();
    List<Discount> allDiscount = new ArrayList<>();
            
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
            out.println("<title>Servlet explore_show</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet explore_show at " + request.getContextPath() + "</h1>");
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
        allDiscount = dis.getALLDiscount();
        request.setAttribute("listdiscount", allDiscount);
        request.setAttribute("listlocation", allLocation);
        request.setAttribute("listcategory", allCategory);
        request.setAttribute("listevent", allEvent);
        request.getRequestDispatcher("explore_show.jsp").forward(request, response);
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
        allCategory = cad.getAllCategory();
        allLocation = lod.getAlltLocation();
        request.setAttribute("listlocation", allLocation);
        request.setAttribute("listcategory", allCategory);
        String cid = request.getParameter("cid");
        String lid = request.getParameter("lid");
        request.setAttribute("cid", cid);
        request.setAttribute("lid", lid);
        if (cid.equals("0") && lid.equals("0")) {
            allEvent = evd.getAllEvent();
        } else {
            allEvent=evd.getEventBySearch(cid,lid);
        }
        request.setAttribute("listevent", allEvent);

        request.getRequestDispatcher("explore_show.jsp").forward(request, response);

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
