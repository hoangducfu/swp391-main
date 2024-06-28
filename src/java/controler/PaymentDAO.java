/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controler;

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
public class PaymentDAO extends DBContext{
            public void insertPayment(Payment c){
        String sql = "INSERT INTO [dbo].[Payment] " +
             "([EventID], [Account_name], [Payment_date], [Transaction_id], " +
             "[Transaction_description], [Amount], [Status], [Payment_method], [Id_seat]) " +                
             "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
           PreparedStatement st = connection.prepareStatement(sql);
           st.setInt(1,c.getEvent_id());
           st.setString(2,c.getAccount_name());
           st.setString(3,c.getPayment_date());
           st.setString(4,c.getTrasaction_id());
           st.setString(5,c.getTransaction_description());
           st.setInt(6,c.getAmount());
           st.setString(7,c.getStatus());
           st.setString(8,c.getPayment_method());
           st.setString(9,c.getId_seat());
           st.executeUpdate();
        } catch (Exception e) {
            
        }
    }
        public List<Payment> getpaymentByName (String name){
        List<Payment> list = new ArrayList<>();
        String sql="select * from Payment where Account_name like ? ";
        try {
              PreparedStatement st = connection.prepareStatement(sql);
              st. setString(1, name);
              ResultSet rs = st.executeQuery();
              while(rs.next()){
               Payment c = new Payment(rs.getInt("EventID"),rs.getInt("PaymentID"),rs.getInt("Amount"),rs.getString("Account_name"),rs.getString("Payment_date"),rs.getString("Transaction_id"),rs.getString("Transaction_description"),rs.getString("Status"),rs.getString("Payment_method"),rs.getString("Id_seat"));
              list.add(c);
              }
        } catch (SQLException e) {
        }
        
         return list;
    }
           public Payment getpaymentByID (int payment_id){
        String sql="select * from Payment where PaymentID = ? ";
        try {
              PreparedStatement st = connection.prepareStatement(sql);
              st. setInt(1, payment_id);
              ResultSet rs = st.executeQuery();
              while(rs.next()){
               Payment c = new Payment(rs.getInt("EventID"),rs.getInt("PaymentID"),rs.getInt("Amount"),rs.getString("Account_name"),rs.getString("Payment_date"),rs.getString("Transaction_id"),rs.getString("Transaction_description"),rs.getString("Status"),rs.getString("Payment_method"),rs.getString("Id_seat"));
             return c;
              }
        } catch (SQLException e) {
            
        }
        
         return null;
    }
           public void update_status_payment (String paymentID,String status){
        String sql = "UPDATE [dbo].[Payment]\n"
                + "   SET [Status] = ? \n"
                + " WHERE [PaymentID]=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2 , paymentID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
}