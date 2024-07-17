package dal;

import model.ReportData;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO extends DBContext {

    private static final String SELECT_REPORT_DATA = "SELECT CONVERT(date, Payment_date) as PaymentDate, "
            + "SUM(CASE WHEN Status = '00' THEN Amount ELSE 0 END) as TotalAmount, "
            + "COUNT(CASE WHEN Status = '00' THEN Transaction_id ELSE NULL END) as TotalOrders, "
            + "COUNT(CASE WHEN Status = '01' THEN Transaction_id ELSE NULL END) as TotalCanceledOrders, "
            + "COUNT(CASE WHEN Status = '02' THEN Transaction_id ELSE NULL END) as TotalFailedOrders, "
            + "COUNT(CASE WHEN Status = '03' THEN Transaction_id ELSE NULL END) as TotalProcessingOrders "
            + "FROM Payment "
            + "WHERE MONTH(Payment_date) = ? AND YEAR(Payment_date) = ? "
            + "GROUP BY CONVERT(date, Payment_date) "
            + "ORDER BY CONVERT(date, Payment_date)";

    private static final String SELECT_MONTHLY_REPORT = "SELECT "
            + "SUM(CASE WHEN Status = '00' THEN Amount ELSE 0 END) as TotalAmount, "
            + "COUNT(CASE WHEN Status = '00' THEN Transaction_id ELSE NULL END) as TotalOrders, "
            + "COUNT(CASE WHEN Status = '01' THEN Transaction_id ELSE NULL END) as TotalCanceledOrders, "
            + "COUNT(CASE WHEN Status = '02' THEN Transaction_id ELSE NULL END) as TotalFailedOrders, "
            + "COUNT(CASE WHEN Status = '03' THEN Transaction_id ELSE NULL END) as TotalProcessingOrders "
            + "FROM Payment "
            + "WHERE MONTH(Payment_date) = ? AND YEAR(Payment_date) = ?";

    public List<ReportData> getReportData(String month, String year) {
        List<ReportData> reportDataList = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REPORT_DATA)) {
            preparedStatement.setString(1, month);
            preparedStatement.setString(2, year);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String paymentDate = rs.getString("PaymentDate");
                double totalAmount = rs.getDouble("TotalAmount");
                int totalOrders = rs.getInt("TotalOrders");
                int totalCanceledOrders = rs.getInt("TotalCanceledOrders");
                int totalFailedOrders = rs.getInt("TotalFailedOrders");
                int totalProcessingOrders = rs.getInt("TotalProcessingOrders"); // Lấy dữ liệu mới

                reportDataList.add(new ReportData(paymentDate, totalAmount, totalOrders, totalCanceledOrders, totalFailedOrders, totalProcessingOrders));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reportDataList;
    }
    public List<ReportData> getReportDataByEventId(String eid) {
        List<ReportData> reportDataList = new ArrayList<>();
        String sql = "SELECT [StaffID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "      ,[roleId]\n"
                + "  FROM [dbo].[Staff] \n"
                + "	where username =? and password =?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, eid);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String paymentDate = rs.getString("PaymentDate");
                double totalAmount = rs.getDouble("TotalAmount");
                int totalOrders = rs.getInt("TotalOrders");
                int totalCanceledOrders = rs.getInt("TotalCanceledOrders");
                int totalFailedOrders = rs.getInt("TotalFailedOrders");
                int totalProcessingOrders = rs.getInt("TotalProcessingOrders"); // Lấy dữ liệu mới

                reportDataList.add(new ReportData(paymentDate, totalAmount, totalOrders, totalCanceledOrders, totalFailedOrders, totalProcessingOrders));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reportDataList;
    }

    public ReportData getMonthlyReport(int month, int year) {
        ReportData reportData = null;

        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MONTHLY_REPORT)) {
            preparedStatement.setInt(1, month);
            preparedStatement.setInt(2, year);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                double totalAmount = rs.getDouble("TotalAmount");
                int totalOrders = rs.getInt("TotalOrders");
                int totalCanceledOrders = rs.getInt("TotalCanceledOrders");
                int totalFailedOrders = rs.getInt("TotalFailedOrders");
                int totalProcessingOrders = rs.getInt("TotalProcessingOrders"); // Lấy dữ liệu mới

                reportData = new ReportData(null, totalAmount, totalOrders, totalCanceledOrders, totalFailedOrders, totalProcessingOrders);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reportData;
    }
}
