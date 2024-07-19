/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import dal.CustomerDAO;
import dal.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Customer;
import model.Staff;

/**
 *
 * @author hoangduc
 */
public class ManageListUser extends HttpServlet {

    List<Staff> dataStaff = new ArrayList<>();
    List<Customer> dataCustomer = new ArrayList<>();
    StaffDAO std = new StaffDAO();
    CustomerDAO cud = new CustomerDAO();

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
            out.println("<title>Servlet ManagerList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerList at " + request.getContextPath() + "</h1>");
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
        dataStaff = std.getAllListAccountStaff();
        dataCustomer = cud.getAllListAccountCustomer();
        request.setAttribute("dataStaff", dataStaff);
        request.setAttribute("dataCustomer", dataCustomer);
        request.getRequestDispatcher("list_dashboard.jsp").forward(request, response);
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
        if (action.equals("search")) {
            String name = request.getParameter("name").trim();
            request.setAttribute("name", name);
            dataCustomer = cud.getAllListAccountCustomerByName(name);
            dataStaff = std.getAllListAccountStaffByName(name);
            request.setAttribute("dataStaff", dataStaff);
            request.setAttribute("dataCustomer", dataCustomer);
            request.getRequestDispatcher("list_dashboard.jsp").forward(request, response);
        }
        if (action.equals("add")) {
            String email = request.getParameter("username");
            String phone = request.getParameter("phone").trim();
            String dob = request.getParameter("dob");
            String password = randomPassword();
            String passwordmd5 = md5Hash(password);
            //roleid
            String position = request.getParameter("position");
            String err = "";
            String stt = "";
            try {
                if (position.equals("1")) {

                    if (!std.checkStaffExist(email)) {
                        if (phone.isBlank()) {
                            if (dob.isBlank()) {
                                std.addAccount(email, passwordmd5, null, null);
                                stt = "Đã thêm thành công " + email;
                            } else {
                                std.addAccount(email, passwordmd5, null, dob);
                                stt = "Đã thêm thành công " + email;
                            }
                        } else {
                            if (isPhone(phone)) {
                                if (dob.isBlank()) {
                                    std.addAccount(email, passwordmd5, phone, null);
                                    stt = "Đã thêm thành công " + email;
                                } else {
                                    std.addAccount(email, passwordmd5, phone, dob);
                                    stt = "Đã thêm thành công " + email;
                                }
                            } else {
                                err = "số điện thoại chỉ 10->11 kí tự số";
                                throw new Exception();
                            }
                        }

                    } else {
                        err = "Tài khoản email này đã tồn tại";
                        throw new Exception();
                    }
                }// nếu positon = 2 là thêm tài khoản user
                else {
                    if (!cud.checkCustomerExist(email)) {
                        if (phone.isBlank()) {
                            if (dob.isBlank()) {
                                cud.addAccount(email, passwordmd5, null, null);
                                stt = "Đã thêm thành công " + email;
                            } else {
                                cud.addAccount(email, passwordmd5, null, dob);
                                stt = "Đã thêm thành công " + email;
                            }
                        } else {
                            if (isPhone(phone)) {
                                if (dob.isBlank()) {
                                    cud.addAccount(email, passwordmd5, phone, null);
                                    stt = "Đã thêm thành công " + email;
                                } else {
                                    cud.addAccount(email, passwordmd5, phone, dob);
                                    stt = "Đã thêm thành công " + email;
                                }
                            } else {
                                err = "số điện thoại chỉ 10->11 kí tự số";
                                throw new Exception();
                            }
                        }

                    } else {
                        err = "Tài khoản email này đã tồn tại";
                        throw new Exception();
                    }

                }
                //            String idAccount = acd.getIdByUsername(email);
                SendEmail sm = new SendEmail();
                String mess = "<p>Mật khẩu mới là: " + password+"</p>";
                // gửi mật khẩu mới
                sm.sendEmail(email, mess);
            } catch (Exception e) {
                request.setAttribute("username", email);
                request.setAttribute("phone", phone);
                request.setAttribute("dob", dob);
                request.setAttribute("position", position);
            }

            request.setAttribute("err", err);
            request.setAttribute("status", stt);
            dataCustomer = cud.getAllListAccountCustomer();
            dataStaff = std.getAllListAccountStaff();
            request.setAttribute("dataStaff", dataStaff);
            request.setAttribute("dataCustomer", dataCustomer);
            request.getRequestDispatcher("list_dashboard.jsp").forward(request, response);
        }
        if (action.equals("delete")) {
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            //xóa
            if (type.equals("customer")) {
                cud.banCustomerById(id);
            } else {
                std.banStaffById(id);
            }

            dataCustomer = cud.getAllListAccountCustomer();
            dataStaff = std.getAllListAccountStaff();
            request.setAttribute("dataStaff", dataStaff);
            request.setAttribute("dataCustomer", dataCustomer);
            request.getRequestDispatcher("list_dashboard.jsp").forward(request, response);
        }
        if(action.equals("unban")){
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            //xóa
            if (type.equals("customer")) {
                cud.unbanCustomerById(id);
            } else {
                std.unbanStaffById(id);
            }

            dataCustomer = cud.getAllListAccountCustomer();
            dataStaff = std.getAllListAccountStaff();
            request.setAttribute("dataStaff", dataStaff);
            request.setAttribute("dataCustomer", dataCustomer);
            request.getRequestDispatcher("list_dashboard.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public static boolean isPhone(String str) {
        // Biểu thức chính quy để kiểm tra chuỗi chứa tối đa 10 ký tự số
        String regex = "\\d{10,11}";
        return str.matches(regex);
    }
    // kiểm tra mật khẩu hợp lệ

    public boolean isValidString(String str) {
        // Sử dụng biểu thức chính quy để kiểm tra chuỗi
        Pattern pattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,20}$");
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }

    // mã hóa mật khẩu
    public String md5Hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());

            // Chuyển byte array thành dạng hex string
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String randomPassword() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder stringBuilder = new StringBuilder(8);

        for (int i = 0; i < 8; i++) {
            int index = random.nextInt(characters.length());
            stringBuilder.append(characters.charAt(index));
        }

        return stringBuilder.toString();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
