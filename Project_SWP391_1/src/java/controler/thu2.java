/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controler;

import dal.EventDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name="thu2", urlPatterns={"/thu2"})
public class thu2 extends HttpServlet {
   
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
            out.println("<title>Servlet thu2</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet thu2 at " + request.getContextPath () + "</h1>");
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
        List<String> favoriteProductIds = getFavoriteProductIds(request);
        
        // Lấy thông tin chi tiết của các sản phẩm yêu thích
        List<> favoriteProducts = new ArrayList<>();
        for (String productId : favoriteProductIds) {
            Product product = getProductDetails(productId);
            if (product != null) {
                favoriteProducts.add(product);
            }
        }
        
        // Đặt thông tin sản phẩm yêu thích vào request attribute
        request.setAttribute("favoriteProducts", favoriteProducts);
        
        // Chuyển tiếp thông tin tới JSP để hiển thị
        request.getRequestDispatcher("/favoriteProducts.jsp").forward(request, response);
    }

    // Phương thức để lấy danh sách ID sản phẩm yêu thích từ cookie
    private List<String> getFavoriteProductIds(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        List<String> favoriteProductIds = new ArrayList<>();
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart")) {
                    String cartValue = cookie.getValue();
                    String[] products = cartValue.split("\\|");
                    favoriteProductIds = Arrays.asList(products);
                    break;
                }
            }
        }
        
        return favoriteProductIds;
    
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
