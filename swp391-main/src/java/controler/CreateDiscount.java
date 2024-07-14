/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
<<<<<<< Updated upstream
package controler;

import dal.DiscountDAO;
=======

package controler;


import dal.DiscountDAO;
import dal.EventDAO;
>>>>>>> Stashed changes
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Discount;
<<<<<<< Updated upstream
=======
import model.Event;
>>>>>>> Stashed changes

/**
 *
 * @author Admin
 */
public class CreateDiscount extends HttpServlet {

    DiscountDAO dis = new DiscountDAO();
<<<<<<< Updated upstream
    List<Discount> dataDiscount = new ArrayList<>();
=======
    List<Discount> dataDis = new ArrayList<>();
    
    EventDAO eve = new EventDAO();
    List<Event> dataEvent = new ArrayList<>();
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
        dataDiscount = dis.getALLDiscount();
        request.setAttribute("dataDiscount", dataDiscount);
        request.getRequestDispatcher("CreateDiscount.jsp").forward(request, response);
    }
=======
                  String code = request.getParameter("code");
        String quantity = request.getParameter("quantity");
        String discountPercent = request.getParameter("discountPercent");
        String eventId = request.getParameter("eventId");
        String eventName = request.getParameter("eventName");

        // Thực hiện kiểm tra và xử lý dữ liệu
        String err = "";
        String status = "";

        try {
            // Kiểm tra và xử lý dữ liệu ở đây
            // Ví dụ: Kiểm tra ràng buộc và thêm mã giảm giá vào cơ sở dữ liệu

            if (quantity == null || quantity.trim().isEmpty()) {
                err = "Vui lòng nhập số lượng mã giảm giá";
            } else {
                // Xử lý thêm mã giảm giá vào cơ sở dữ liệu
                DiscountDAO discountDAO = new DiscountDAO(); // Thay thế bằng DiscountDAO thực tế của bạn
                if (!discountDAO.checkDiscountByCode(code)) {
                    if (Integer.parseInt(quantity) > 0) {
                        // Thêm mã giảm giá
                        discountDAO.addDisscount(code, quantity, discountPercent, eventId);
                        status = "Đã thêm thành công mã giảm giá " + code;
                    } else {
                        err = "Số lượng mã giảm giá phải lớn hơn 0";
                    }
                } else {
                    err = "Mã giảm giá đã tồn tại";
                }
            }
        } catch (Exception e) {
            err = "Đã xảy ra lỗi: " + e.getMessage();
            e.printStackTrace();
        }

        // Đưa thông tin lỗi và thành công vào request để hiển thị trên JSP
        request.setAttribute("err", err);
        request.setAttribute("status", status);

        // Điều hướng về trang CreateDiscount.jsp
        request.getRequestDispatcher("CreateDiscount.jsp").forward(request, response);
    }
//        String eventId = request.getParameter("eventId");
//        String eventName = request.getParameter("eventName");
//        dataDis = dis.getALLDiscount();
//        dataEvent = eve.getAllEvent();
//        List<Discount> dataDiscount = dis.getDiscountByEventId(eventId);
//        
//        request.setAttribute("eventId", eventId);
//        request.setAttribute("eventName", eventName);
//        request.setAttribute("dataDiscount", dataDiscount);
//        request.setAttribute("dataEvent", dataEvent);
//        request.setAttribute("dataDiscount", dataDis);
//        request.getRequestDispatcher("CreateDiscount.jsp").forward(request, response);
    
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
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
=======
//          String code = request.getParameter("code");
//        String quantity = request.getParameter("quantity");
//        String discountPercent = request.getParameter("discountPercent");
//        String eventId = request.getParameter("eventId");
//        String eventName = request.getParameter("eventName");
//
//        String stt = "";
//        String err = "";
//
//        try {
//            DiscountDAO dis = new DiscountDAO();
//            if (!dis.checkDiscountByCode(code)) {
//                if (!quantity.isBlank() && Integer.parseInt(quantity) > 0) {
//                    if (!discountPercent.isBlank() && Integer.parseInt(discountPercent) > 0) {
//                        dis.addDisscount(code, quantity, discountPercent, eventId);
//                        stt = "Đã thêm thành công mã giảm giá " + code;
//                        request.getSession().setAttribute("status", stt);
//                        response.sendRedirect("exploreshow"); // Chuyển hướng về trang chủ (index.jsp)
//                        return; // Chuyển hướng nên không cần tiếp tục xử lý
//                    } else {
//                        err = "Vui lòng nhập % giảm giá và phải lớn hơn 0";
//                    }
//                } else {
//                    err = "Số lượng không được để trống và phải lớn hơn 0";
//                }
//            } else {
//                err = "Mã code này đã tồn tại";
//            }
//        } catch (Exception e) {
//            err = "Đã xảy ra lỗi: " + e.getMessage();
//            e.printStackTrace(); // In ra lỗi chi tiết
//        }
//
//        request.setAttribute("code", code);
//        request.setAttribute("quantity", quantity);
//        request.setAttribute("discountPercent", discountPercent);
//        request.setAttribute("err", err);
//        request.getRequestDispatcher("CreateDiscount.jsp").forward(request, response);
    }

    
//        if (action.equals("delete")) {
//            String id = request.getParameter("id");
//            dis.deleteDiscountById(id);
//
//            dataDis = dis.getALLDiscount();
//            request.setAttribute("dataDiscount", dataDis);
//            response.sendRedirect("discount?eventId=" + request.getParameter("eventId") + "&eventName=" + request.getParameter("eventName"));
//        }
    

>>>>>>> Stashed changes
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
