package controler;

import dal.ReportDAO;
import model.ReportData;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.time.LocalDate;

public class ReportServlet extends HttpServlet {

    private ReportDAO reportDAO;

    @Override
    public void init() {
        reportDAO = new ReportDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReportServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String monthStr = request.getParameter("month");
        String yearStr = request.getParameter("year");

//        if (monthStr != null && yearStr != null) {
//            try {
//                int month = Integer.parseInt(monthStr);
//                int year = Integer.parseInt(yearStr);
//
//                ReportData monthlyReportData = reportDAO.getMonthlyReport(month, year);
//                List<ReportData> reportDataList = reportDAO.getReportData(monthStr, yearStr);
//
//                request.setAttribute("monthlyReportData", monthlyReportData);
//                request.setAttribute("reportData", reportDataList);
//
//                request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
//            } catch (NumberFormatException e) {
//                request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
//            }
//        } else {
//            request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
//        }
        if (monthStr == null && yearStr == null) {
            LocalDate currentDate = LocalDate.now();
             monthStr = String.valueOf(currentDate.getMonthValue());
             yearStr = String.valueOf(currentDate.getYear());
        }
        try {
            int month = Integer.parseInt(monthStr);
            int year = Integer.parseInt(yearStr);

            ReportData monthlyReportData = reportDAO.getMonthlyReport(month, year);
            List<ReportData> reportDataList = reportDAO.getReportData(monthStr, yearStr);

            request.setAttribute("monthlyReportData", monthlyReportData);
            request.setAttribute("reportData", reportDataList);

            request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
