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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Category;
import model.Event;
import model.Location;

/**
 *
 * @author hoangduc
 */
@MultipartConfig

public class CreateEventServlet extends HttpServlet {

    EventDAO evd = new EventDAO();
    CategoryDAO cad = new CategoryDAO();
    LocationDAO lod = new LocationDAO();
    List<Category> listcategory = cad.getAllCategory();
    List<Location> listlocation = lod.getAlltLocation();

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
            out.println("<title>Servlet CreateEventServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateEventServlet at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("listlocation", listlocation);
        request.setAttribute("listcategory", listcategory);
        request.getRequestDispatcher("CreateEvent_Ticket.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
        String nameEvent = request.getParameter("nameEvent");
        String categoryId = request.getParameter("categoryId");
        String timeStart = request.getParameter("timeStart");
        String period = request.getParameter("period");
        String describeEvent = request.getParameter("describeEvent");
        String locationId = request.getParameter("locationId");
        String ve1 = request.getParameter("ve1");
        String ve2 = request.getParameter("ve2");
        String ve3 = request.getParameter("ve3");
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        request.setAttribute("nameEvent", nameEvent);
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("timeStart", timeStart);
        request.setAttribute("period", period);
        request.setAttribute("describeEvent", describeEvent);
        request.setAttribute("locationId", locationId);
        request.setAttribute("ve1", ve1);
        request.setAttribute("ve2", ve2);
        request.setAttribute("ve3", ve3);
        request.setAttribute("listlocation", listlocation);
        request.setAttribute("listcategory", listcategory);
        //image
        String err = "";
        String pass = "";
        // kiểm tra tên 
        if (nameEvent.isBlank() || (nameEvent.length() <= 4) || (nameEvent.length() >= 100)) {
            err = "Tên sự kiện phải dài hơn 4 kí tự và bé hơn 100 ký tự";
        } else {
            // kiểm tra thể loại sự kiện
            if (categoryId.isBlank()) {
                err = "Hãy chọn thể loại sự kiện";
            } else {
                // kiểm tra thời gian bắt đầu
                if (timeStart.isBlank()) {
                    err = "Thời gian bắt đầu không được để trống";
                } else {
                    // kiểm tra mô tả chi tiết
                    if (describeEvent.isBlank() || (describeEvent.length() <= 4) || (describeEvent.length() >= 1200)) {
                        err = "Mô tả chi tiết sự kiện phải dài hơn 4 kí tự và bé hơn 1200 kí tự";
                    } else {
                        // kiểm tra địa điểm 
                        if (locationId.isBlank()) {
                            err = "Không được để trống địa chỉ";
                        } else {
                            // kiểm tra giá tiền 
                            if ((Integer.parseInt(ve1) < 0) || (Integer.parseInt(ve2) < 0) || (Integer.parseInt(ve3) < 0)) {
                                err = "Giá tiền các loại vé phải lớn hoặc bằng 0";
                            } else {
                                if ((Integer.parseInt(ve1) > 10000000) || (Integer.parseInt(ve2) > 10000000) || (Integer.parseInt(ve3) > 10000000)) {
                                    err = "Giá tiền phải bé hơn 10.000.000 ";
                                } else {
                                    Part part = request.getPart("photo");
                                    // kiểm tra ảnh
                                    if (part.getSubmittedFileName() == null
                                            || part.getSubmittedFileName().trim().isEmpty()
                                            || part == null) {
                                        err = "File ảnh phải đúng định dạng và không được để trống";
                                    } else {
                                        try {
                                            // lay duong dan luu anh
                                            String path = request.getServletContext().getRealPath("/image");
                                            File dir = new File(path);

                                            // xem duong dan nay da ton tai chua
                                            if (!dir.exists()) {
                                                // neu chua thì tạo
                                                dir.mkdirs();
                                            }
                                            File image = new File(dir, part.getSubmittedFileName());

                                            //ghi file vao trong duong dan 
                                            part.write(image.getAbsolutePath());
                                            // lấy đường dẫn của ảnh khi lưu vào để lưu vào db
                                            String pathOfFile = request.getContextPath() + "/image/" + image.getName();

                                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                                            LocalDateTime localDateTime = LocalDateTime.parse(timeStart, formatter);

                                            // Chuyển đổi LocalDateTime thành Timestamp cho TimeStart và TimeEnd
                                            Timestamp timestamp1 = Timestamp.valueOf(localDateTime);
                                            Timestamp timestamp2 = Timestamp.valueOf(localDateTime.plusMinutes(Integer.parseInt(period)));
                                            if (evd.addEvent(new Event(categoryId, nameEvent, describeEvent, pathOfFile, locationId, timestamp1.toString(), timestamp2.toString(), ve1, ve2, ve3, acc.getId(), "0"))) {
                                                pass = "Đã tạo thành công sự kiện " + nameEvent;
                                                request.setAttribute("pass", pass);

                                            } else {
                                                err = "Không thể tạo được sự kiện";
                                            }

                                        } catch (Exception e) {
                                            err="giá vé phải là số lớn hơn 0 và bé hơn 10000000";
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        request.setAttribute("err", err);
        request.getRequestDispatcher("CreateEvent_Ticket.jsp").forward(request, response);
        return;

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
