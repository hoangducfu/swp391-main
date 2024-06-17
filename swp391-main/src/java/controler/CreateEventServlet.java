/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.EventDAO;
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
import java.util.Date;
import model.Account;
import model.Event;

/**
 *
 * @author hoangduc
 */
@MultipartConfig

public class CreateEventServlet extends HttpServlet {

    EventDAO evd = new EventDAO();

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

        //image
        Part part = request.getPart("photo");
        if (part.getSubmittedFileName() == null
                || part.getSubmittedFileName().trim().isEmpty()
                || part == null) {
            response.sendRedirect("newjsp.jsp");

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
//                if (evd.addEvent(new Event(categoryId, nameEvent, describeEvent, pathOfFile, locationId, timestamp1.toString(), timestamp2.toString(), ve1, ve2, ve3, acc.getId(), "0"))) {
//                    request.getRequestDispatcher("CreateEvent_Ticket.jsp").forward(request, response);
//                } else {
//                    response.sendRedirect("Home.jsp");
//                }
            out.println(timestamp1.toString());
            out.println(timestamp2.toString());
            } catch (Exception e) {

            }
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
