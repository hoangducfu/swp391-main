/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import model.Constants;
import model.Customer;
import model.UserGoogleDto;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author mactu
 */
public class LoginGoogleHandler extends HttpServlet {

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
            out.println("<title>Servlet count</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet count at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }

    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get 
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);

        return googlePojo;
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        // lấy refresh- token
        String code = request.getParameter("code");
        if (code == null) {
            session.invalidate();
            request.getRequestDispatcher("sign_in.jsp").forward(request, response);
        } else {
            // gửi refersh-token lấy về authen-token
            String accessToken = getToken(code);
            // gửi authen-token lấy về thông tin user
            UserGoogleDto user = getUserInfo(accessToken);

            String mailUser = user.getEmail();

            String err = "";
            // kiểm tra xem mail này đã tồn tại hay chưa
            if (cud.checkCustomerBan(mailUser)) {
                err = "Tài khoản này đã bị khóa";
            } else {
                if (cud.checkCustomerExist(mailUser)) {
                    // nếu tài khoản này đã tồn tại với google status = true thì đăng nhập
                    if (cud.checkCustomerExistWithGoogle(mailUser)) {
                        // đẩy lên session customer có tên là accounts
                        Customer account = cud.getCustomerByUsername(mailUser);
                        session.setAttribute("account", account);
                        // 
                        response.sendRedirect("exploreshow");
                        return;
                    } else {
                        //nếu là tài khoản là nhân viên hay admin thì không được đăng nhập với google
                        //nếu chưa liên kết với google thì sẽ update lại status và không cho login bằng mật khẩu
                        if (cud.setCustomerStatusWithGoogle(mailUser)) {
                            Customer account = cud.getCustomerByUsername(mailUser);
                            session.setAttribute("account", account);
                            // 
                            response.sendRedirect("exploreshow");
                            return;
                        } else {
                            err = "không đăng nhập thành công 1";
                        }

                        request.setAttribute("err", err);
                        request.getRequestDispatcher("sign_in.jsp").forward(request, response);
                    }
                } else {
                    // nếu tài khoản này chưa tồn tại thì set nó đăng nhập với google 
                    boolean check = cud.addCustomerGoogle(mailUser);
                    if (check) {
                        Customer account = cud.getCustomerByUsername(mailUser);
                        session.setAttribute("account", account);
                        // sửa
                        response.sendRedirect("exploreshow");
                    } else {
                        err = "không đăng nhập thành công";
                        request.setAttribute("err", err);
                        request.getRequestDispatcher("sign_in.jsp").forward(request, response);
                    }
                }
            }
            request.setAttribute("err", err);
            request.getRequestDispatcher("sign_in.jsp").forward(request, response);
            return;
        }
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
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordMd5 = md5Hash(password);
        String err = "";
        if (cud.checkCustomerBan(email)) {
            err = "Tài khoản này của bạn đã bị khóa";
        } else {
            if (cud.checkCustomerExist(email, passwordMd5)) {
                if (cud.checkStatusPassword(email)) {
                    Customer ac = cud.getCustomerByUsername(email);
                    session.setAttribute("account", ac);
                    response.sendRedirect("changepassword?action=customer");
                    return;
                } else {
                    if (cud.checkCustomerExistWithGoogle(email)) {
                        err = "Tài khoản này đã đăng nhập với googole, bạn hãy đăng nhập với google";
                    } else {
                        // nhay ve home
                        Customer account = cud.getCustomerByUsername(email);
                        session.setAttribute("account", account);

                        //link này đăng nhập của customer
                        response.sendRedirect("exploreshow");
                        return;
                    }
                }
            } else {
                err = "Tài khoản hoặc mật khẩu không chính xác!";
            }
        }
        request.setAttribute("email", email);
        request.setAttribute("err", err);
        request.getRequestDispatcher("sign_in.jsp").forward(request, response);
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
