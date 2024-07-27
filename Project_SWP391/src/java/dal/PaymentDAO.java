/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Payment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mactu
 */
public class PaymentDAO extends DBContext {

    public void insertPayment(Payment c) {
        String sql = "INSERT INTO [dbo].[Payment] "
                + "([EventID], [Account_Id], [Payment_date], [Transaction_id], "
                + "[Transaction_description], [Amount], [Status], [Payment_method], [Id_seat]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getEvent_id());
            st.setString(2, c.getAccountId());
            st.setString(3, c.getPayment_date());
            st.setString(4, c.getTrasaction_id());
            st.setString(5, c.getTransaction_description());
            st.setInt(6, c.getAmount());
            st.setString(7, c.getStatus());
            st.setString(8, c.getPayment_method());
            st.setString(9, c.getId_seat());
            st.executeUpdate();
        } catch (Exception e) {

        }
    }

    public List<Payment> getpaymentById(String id) {
        List<Payment> list = new ArrayList<>();
        String sql = "select * from Payment where Account_Id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment c = new Payment(rs.getInt("EventID"), rs.getInt("PaymentID"), rs.getInt("Amount"), rs.getString("Account_Id"), rs.getString("Payment_date"), rs.getString("Transaction_id"), rs.getString("Transaction_description"), rs.getString("Status"), rs.getString("Payment_method"), rs.getString("Id_seat"));
                list.add(c);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public Payment getpaymentByID(int payment_id) {
        String sql = "select * from Payment where PaymentID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, payment_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment c = new Payment(rs.getInt("EventID"), rs.getInt("PaymentID"), rs.getInt("Amount"), rs.getString("Account_Id"), rs.getString("Payment_date"), rs.getString("Transaction_id"), rs.getString("Transaction_description"), rs.getString("Status"), rs.getString("Payment_method"), rs.getString("Id_seat"));
                return c;
            }
        } catch (SQLException e) {

        }

        return null;
    }

    public void update_status_payment(String paymentID, String status) {
        String sql = "UPDATE [dbo].[Payment]\n"
                + "   SET [Status] = ? \n"
                + " WHERE [PaymentID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2, paymentID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Payment getPaymentByTrasactionId(String trasaction_id) {
        String sql = "select * from Payment where Transaction_id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, trasaction_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment c = new Payment(rs.getInt("EventID"), rs.getInt("PaymentID"), rs.getInt("Amount"), rs.getString("Account_Id"), rs.getString("Payment_date"), rs.getString("Transaction_id"), rs.getString("Transaction_description"), rs.getString("Status"), rs.getString("Payment_method"), rs.getString("Id_seat"));
                return c;
            }
        } catch (SQLException e) {

        }

        return null;
    }

    public List<Payment> getPaymentByAccountIdAndStatus(String id, String payStatus) {
        List<Payment> list = new ArrayList<>();
        String sql = "select * from Payment where Account_Id = ? and Status = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, payStatus);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment c = new Payment(rs.getInt("EventID"), rs.getInt("PaymentID"), rs.getInt("Amount"), rs.getString("Account_Id"), rs.getString("Payment_date"), rs.getString("Transaction_id"), rs.getString("Transaction_description"), rs.getString("Status"), rs.getString("Payment_method"), rs.getString("Id_seat"));
                list.add(c);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Payment> getAllPayment() {
        List<Payment> list = new ArrayList<>();
        String sql = "select * from Payment  ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment c = new Payment(rs.getInt("EventID"), rs.getInt("PaymentID"), rs.getInt("Amount"), rs.getString("Account_Id"), rs.getString("Payment_date"), rs.getString("Transaction_id"), rs.getString("Transaction_description"), rs.getString("Status"), rs.getString("Payment_method"), rs.getString("Id_seat"));
                list.add(c);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Payment> getPaymentByStatus(String payStatus) {
        List<Payment> list = new ArrayList<>();
        String sql = "select * from Payment where Status = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, payStatus);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment c = new Payment(rs.getInt("EventID"), rs.getInt("PaymentID"), rs.getInt("Amount"), rs.getString("Account_Id"), rs.getString("Payment_date"), rs.getString("Transaction_id"), rs.getString("Transaction_description"), rs.getString("Status"), rs.getString("Payment_method"), rs.getString("Id_seat"));
                list.add(c);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Payment> getPaymentBySearchKeyWordId(String payStatus, int keyword) {
        List<Payment> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM Payment p\n"
                + "JOIN Event e\n"
                + "ON p.EventID = e.EventID\n"
                + "WHERE (p.PaymentID = ? or p.Transaction_id = ? or e.Eventname like ? ) ";
        if (!payStatus.equals("0")) {
            sql += "AND p.Status = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, keyword);
            st.setInt(2, keyword);
            st.setString(3, "N'%" + keyword + "%'");
            if (!payStatus.equals("0")) {
                st.setString(4, payStatus);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment c = new Payment(rs.getInt("EventID"), rs.getInt("PaymentID"), rs.getInt("Amount"), rs.getString("Account_Id"), rs.getString("Payment_date"), rs.getString("Transaction_id"), rs.getString("Transaction_description"), rs.getString("Status"), rs.getString("Payment_method"), rs.getString("Id_seat"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }

        return list;
    }

    public List<Payment> getPaymentBySearchKeyWordName(String payStatus, String keyword) {
        List<Payment> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM Payment p\n"
                + "JOIN Event e\n"
                + "ON p.EventID = e.EventID\n"
                + "WHERE  e.Eventname like N'%" + keyword + "%'  ";
        if (!payStatus.equals("0")) {
            sql += "AND p.Status = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (!payStatus.equals("0")) {
                st.setString(1, payStatus);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment c = new Payment(rs.getInt("EventID"), rs.getInt("PaymentID"), rs.getInt("Amount"), rs.getString("Account_Id"), rs.getString("Payment_date"), rs.getString("Transaction_id"), rs.getString("Transaction_description"), rs.getString("Status"), rs.getString("Payment_method"), rs.getString("Id_seat"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }

        return list;
    }

    public static void main(String[] args) {
        PaymentDAO pad = new PaymentDAO();
//        pad.insertPayment(new Payment(4, 400000, "2", "2024-04-03", "14509765", "aaa", "00", "ATM", "9,8"));
//    Payment p = pad.getPaymentByTrasactionId("14509765");
//        System.out.println(p);
        List<String> list = new ArrayList<>();
//        list = pad.getPaymentByStatus("00");
//        list = pad.getPaymentBySearchKeyWordIdAndEventId("01", 3, "4");
//
//        for (Payment payment : list) {
//            System.out.println(payment);
//        }
        list = pad.getListEmailByEventId("6");
        for (String string : list) {
            System.out.println(string);
        }
    }

    public List<Payment> getPaymentByEventIdAndStatus(String eventId, String payStatus) {
        List<Payment> list = new ArrayList<>();
        String sql = "SELECT [PaymentID]\n"
                + "      ,[EventID]\n"
                + "      ,[Account_Id]\n"
                + "      ,[Payment_date]\n"
                + "      ,[Transaction_id]\n"
                + "      ,[Transaction_description]\n"
                + "      ,[Amount]\n"
                + "      ,[Status]\n"
                + "      ,[Payment_method]\n"
                + "      ,[Id_seat]\n"
                + "  FROM [dbo].[Payment]\n"
                + "  where EventID =? ";
        if (!payStatus.equals("0")) {
            sql += "AND Status = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eventId);
            if (!payStatus.equals("0")) {
                st.setString(2, payStatus);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment c = new Payment(rs.getInt("EventID"), rs.getInt("PaymentID"), rs.getInt("Amount"), rs.getString("Account_Id"), rs.getString("Payment_date"), rs.getString("Transaction_id"), rs.getString("Transaction_description"), rs.getString("Status"), rs.getString("Payment_method"), rs.getString("Id_seat"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }

        return list;
    }

    public List<Payment> getPaymentBySearchKeyWordIdAndEventId(String payStatus, int check, String eventId) {
        List<Payment> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM Payment p\n"
                + "JOIN Event e\n"
                + "ON p.EventID = e.EventID\n"
                + "WHERE e.EventID = ? and (p.PaymentID = ? or p.Transaction_id = ? or e.Eventname like ? ) ";
        if (!payStatus.equals("0")) {
            sql += "AND p.Status = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eventId);
            st.setInt(2, check);
            st.setInt(3, check);
            st.setString(4, "N'%" + check + "%'");
            if (!payStatus.equals("0")) {
                st.setString(5, payStatus);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment c = new Payment(rs.getInt("EventID"), rs.getInt("PaymentID"), rs.getInt("Amount"), rs.getString("Account_Id"), rs.getString("Payment_date"), rs.getString("Transaction_id"), rs.getString("Transaction_description"), rs.getString("Status"), rs.getString("Payment_method"), rs.getString("Id_seat"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }

        return list;
    }

    public List<Payment> getPaymentBySearchKeyWordNameAndEventId(String payStatus, String keyword, String eventId) {
        List<Payment> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM Payment p\n"
                + "JOIN Event e\n"
                + "ON p.EventID = e.EventID\n"
                + "WHERE e.EventID =? and e.Eventname like N'%" + keyword + "%'  ";
        if (!payStatus.equals("0")) {
            sql += "AND p.Status = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eventId);
            if (!payStatus.equals("0")) {
                st.setString(2, payStatus);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment c = new Payment(rs.getInt("EventID"), rs.getInt("PaymentID"), rs.getInt("Amount"), rs.getString("Account_Id"), rs.getString("Payment_date"), rs.getString("Transaction_id"), rs.getString("Transaction_description"), rs.getString("Status"), rs.getString("Payment_method"), rs.getString("Id_seat"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }

        return list;
    }

    // update status 00 thành 04 là trạng thái cần xử lý
    public void updateStatusPaymentToRefund(String eid) {
        String sql = "UPDATE [dbo].[Payment]\n"
                + "   SET [Status] = '04'\n"
                + " WHERE EventID = ? and [Status] = 00";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    

    public List<String> getListEmailByEventId(String eid) {
        List<String> list = new ArrayList<>();
        String sql = "SELECT   c.username FROM \n"
                + "    Customer c\n"
                + "JOIN \n"
                + "    Payment p\n"
                + "ON \n"
                + "    c.CustomerID = p.Account_Id\n"
                + "WHERE \n"
                + "    p.Status = '00' and p.EventID = ?"
                +" group by username;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String c = rs.getString("username");
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }

        return list;
    }
}
