/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author mactu
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Payment_cancel;

public class DAO_payment_cancel extends DBContext{
    
     public void insertpayCancel(Payment_cancel c){
        String sql ="INSERT INTO [dbo].[Cancel_Ticket]\n" +
"           ([Account_name]\n" +
"           ,[ID_Pay]\n" +
"           ,[ID_event]\n" +
"           ,[ID_seat]\n" +
"           ,[Reason]\n" +
"           ,[Status])\n" +
"     VALUES\n" +
"           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString (1,c. getAccount_name());
            st.setString (2,c. getId_pay());
            st.setString (3,c. getId_event());
            st.setString (4,c. getId_seat());
            st.setString (5,c. getReason());
            st.setInt(6,c.getStatus());   
           st.executeUpdate();
        } catch (Exception e) {
        }
    }
    //check vé bị hủy 
        public int checkCancel(String id_pay) {
        String sql = " select * from Cancel_Ticket\n" +
                      " where ID_Pay=? and Status=01";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id_pay);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return 1;
            }
        } catch (Exception e) {
            return 0;
        }
        return 0;
    }
        
        
         public List<Payment_cancel> getAllCancel_by_user_pending (String account_name){
        List<Payment_cancel> list = new ArrayList<>();
        String sql="select * from Cancel_Ticket where Account_name like ? and status = 0 ";
        try {
              PreparedStatement st = connection.prepareStatement(sql);
              st.setString (1,account_name);
              ResultSet rs = st.executeQuery(); 
              while(rs.next()){
               Payment_cancel c = new Payment_cancel(rs.getString("Account_name"), rs.getString("Id_event"), rs.getString("Id_seat"), rs.getString("Id_Pay"), rs.getString("Reason"), rs.getInt("Status"));
               list.add(c);
              }
        } catch (SQLException e) {
            System.out.println("error");
        }
        
    return list;
    }
                  public List<Payment_cancel> getAllCancel_by_user_success (String account_name){
        List<Payment_cancel> list = new ArrayList<>();
        String sql="select * from Cancel_Ticket where Account_name like ? and status = 1 ";
        try {
              PreparedStatement st = connection.prepareStatement(sql);
              st.setString (1,account_name);
              ResultSet rs = st.executeQuery(); 
              while(rs.next()){
               Payment_cancel c = new Payment_cancel(rs.getString("Account_name"), rs.getString("Id_event"), rs.getString("Id_seat"), rs.getString("Id_Pay"), rs.getString("Reason"), rs.getInt("Status"));
               list.add(c);
              }
        } catch (SQLException e) {
            System.out.println("error");
        }
        
    return list;
    }
          public List<Payment_cancel> getAllCancel_by_user_fail (String account_name){
        List<Payment_cancel> list = new ArrayList<>();
        String sql="select * from Cancel_Ticket where Account_name like ? and status = 2 ";
        try {
              PreparedStatement st = connection.prepareStatement(sql);
              st.setString (1,account_name);
              ResultSet rs = st.executeQuery(); 
              while(rs.next()){
               Payment_cancel c = new Payment_cancel(rs.getString("Account_name"), rs.getString("Id_event"), rs.getString("Id_seat"), rs.getString("Id_Pay"), rs.getString("Reason"), rs.getInt("Status"));
               list.add(c);
              }
        } catch (SQLException e) {
            System.out.println("error");
        }
        
    return list;
    }
}
