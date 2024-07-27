/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.EventDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Event;

/**
 *
 * @author Admin
 */
public class FavoriteEvent extends HttpServlet {
   
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
            out.println("<title>Servlet FavoriteEvent</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FavoriteEvent at " + request.getContextPath () + "</h1>");
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
    List<String> favoriteEventIds = getCartFromCookie(request);
        if(favoriteEventIds == null){
            request.getRequestDispatcher("CreateDiscount.jsp").forward(request, response);
        }
       //  Lấy thông tin chi tiết của các sự kiện yêu thích
        List<Event> favoriteEvents = new ArrayList<>();
        EventDAO eventDAO = new EventDAO();
        for (String eventId : favoriteEventIds) {
            Event event = eventDAO.getEventById(eventId);
            if (event != null) {
                favoriteEvents.add(event);
            }
        }
        
        // Đặt thông tin sự kiện yêu thích vào request attribute
        request.setAttribute("favoriteEvents", favoriteEvents);
        request.setAttribute("favoriteEventIds", favoriteEventIds);
//        
//        // Chuyển tiếp thông tin tới JSP để hiển thị
        request.getRequestDispatcher("FavoriteEvent.jsp").forward(request, response);
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
     String eventId = request.getParameter("eventId");

        if (eventId != null && !eventId.isEmpty()) {
            List<String> cart = getCartFromCookie(request);

            if (!cart.contains(eventId)) {
                cart.add(eventId);
                setCartCookie(response, cart, 60 * 60 * 24 * 7); // Thiết lập lại cookie với danh sách đã cập nhật

                System.out.println("Sản phẩm đã được thêm vào yêu thích");
            } else {
                System.out.println("Sản phẩm đã có trong yêu thích");
            }
        }
    }

     private List<String> getCartFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        List<String> cart = new ArrayList<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart")) {
                    String cartValue = cookie.getValue();
                    cart = new ArrayList<>(Arrays.asList(cartValue.split("\\|")));
                    break;
                }
            }
        }
        return cart;
    }

    private void setCartCookie(HttpServletResponse response, List<String> cart, int maxAgeInSeconds) {
        String cartValue = String.join("|", cart);
        Cookie cookie = new Cookie("cart", cartValue);
        cookie.setMaxAge(maxAgeInSeconds);
        cookie.setPath("/");
        response.addCookie(cookie);
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
