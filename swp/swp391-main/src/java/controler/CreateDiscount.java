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
import java.util.ArrayList;
import java.util.List;
import model.Discount;
import model.Event;

/**
 *
 * @author Admin
 */
public class CreateDiscount extends HttpServlet {

    DiscountDAO dis = new DiscountDAO();
    List<Discount> dataDis = new ArrayList<>();

    EventDAO evd = new EventDAO();
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
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String code = request.getParameter("code");
        String quantity = request.getParameter("quantity");
        String discountPercent = request.getParameter("discountPercent");
        String eventId = request.getParameter("eventId");
        String eventName = evd.getEventById(eventId).getEventName();
        request.setAttribute("eventId", eventId);
        request.setAttribute("code", code);
        request.setAttribute("quantity", quantity);
        request.setAttribute("discountPercent", discountPercent);
        // Thực hiện kiểm tra và xử lý dữ liệu
        String err = "";
        String message = "";
        String mode = request.getParameter("mode");
        try {
            // Kiểm tra và xử lý dữ liệu ở đây
            // Ví dụ: Kiểm tra ràng buộc và thêm mã giảm giá vào cơ sở dữ liệu
            if(mode!= null ){
            if (isAlphanumeric(code)) {
                if (quantity == null || quantity.trim().isEmpty()) {
                    err = "Vui lòng nhập số lượng mã giảm giá";
                } else {
                    // Xử lý thêm mã giảm giá vào cơ sở dữ liệu
                    DiscountDAO discountDAO = new DiscountDAO(); // Thay thế bằng DiscountDAO thực tế của bạn
                    if (!discountDAO.checkDiscountByCode(code)) {
                        if (Integer.parseInt(quantity) > 0 &&Integer.parseInt(quantity) <=350) {
                            if(Integer.parseInt(discountPercent)>0 &&Integer.parseInt(discountPercent) <=100){
                                // Thêm mã giảm giá
                            discountDAO.addDisscount(code, quantity, discountPercent, eventId);
                            message = "Đã thêm thành công mã giảm giá " + code + " cho sự kiện " + eventName;
                            }else{
                                err="phần trăm phải lớn hơn 0 và bé hơn hoặc bằng 100%";
                            }
                        } else {
                            err = "Số lượng mã giảm giá phải lớn hơn 0 và bé hơn hoặc bằng 350";
                        }
                    } else {
                        err = "Mã giảm giá đã tồn tại";
                    }
                }
            }else{
                err ="Tên mã giảm giá chỉ chứa số và chữ cái, giới hạn từ 6 đến 20 kí tự";
            }
            }
        } catch (Exception e) {
            err = "Đã xảy ra lỗi: " + e.getMessage();
            e.printStackTrace();
        }
        request.setAttribute("eventName", eventName);
        // Đưa thông tin lỗi và thành công vào request để hiển thị trên JSP
        request.setAttribute("err", err);
        request.setAttribute("message", message);

        // Điều hướng về trang CreateDiscount.jsp
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
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public boolean isAlphanumeric(String str) {
        // Biểu thức chính quy để kiểm tra chỉ chứa các ký tự chữ cái và số
        String regex = "^[a-zA-Z0-9]{6,20}$";
        return str.matches(regex);
    }
}
