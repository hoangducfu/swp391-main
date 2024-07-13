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
    public static void main(String[] args) {
        PaymentDAO pad = new PaymentDAO();
//        pad.insertPayment(new Payment(4, 400000, "2", "2024-04-03", "14509765", "aaa", "00", "ATM", "9,8"));
//    Payment p = pad.getPaymentByTrasactionId("14509765");
//        System.out.println(p);
            List<Payment> list = new ArrayList<>();
            list = pad.getpaymentById("2");
            for (Payment payment : list) {
                System.out.println(payment);
        }
    }
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
}
