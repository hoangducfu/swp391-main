/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.DiscountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Discount;

/**
 *
 * @author Admin
 */
public class CreateDiscount extends HttpServlet {

    DiscountDAO dis = new DiscountDAO();
    List<Discount> dataDiscount = new ArrayList<>();

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
            out.println("<title>Servlet CreateDiscount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateDiscount at " + request.getContextPath() + "</h1>");
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
        dataDiscount = dis.getALLDiscount();
        request.setAttribute("dataDiscount", dataDiscount);
        request.getRequestDispatcher("CreateDiscount.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        if (action.equals("add")) {
            String code = request.getParameter("code");
            String quantity = request.getParameter("quantity");
            String stt = "";
            String err = "";
            try {
                if (!dis.checkCodeDiscount(code)) {
                    if (!quantity.isBlank()) {
                        dis.addDiscount(code, quantity);
                        stt = "Đã thêm thành công" + code;
                    } else {
                        err = "Số lượng không được để trống";
                    }

                } else {
                    err = "Mã code này đã tồn tại";
                }
            } catch (Exception e) {
                err = "Đã xảy ra lỗi" + e.getMessage();
            }
          
            request.setAttribute("code", code);
            request.setAttribute("quantity", quantity);
            request.setAttribute("err", err);
            request.setAttribute("status", stt);
            dataDiscount = dis.getALLDiscount();
            request.setAttribute("dataDiscount", dataDiscount);
            request.getRequestDispatcher("CreateDiscount.jsp").forward(request, response);
        }
        
        if (action.equals("delete")) {
            String id = request.getParameter("id");
            dis.deleteDiscountById(id);

            dataDiscount = dis.getALLDiscount();
            request.setAttribute("dataDiscount", dataDiscount);
            request.getRequestDispatcher("CreateDiscount.jsp").forward(request, response);
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
