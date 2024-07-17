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
import model.PaymentCancel;

public class PaymentCancelDAO extends DBContext {

    public void insertpayCancel(PaymentCancel c) {
        String sql = "INSERT INTO [dbo].[Cancel_Ticket]\n"
                + "           ([Account_Id]\n"
                + "           ,[ID_Pay]\n"
                + "           ,[ID_event]\n"
                + "           ,[ID_seat]\n"
                + "           ,[Reason]\n"
                + "           ,[Status]\n"
                + "           ,[Bank_name]\n"
                + "           ,[Bank_number])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getAccountId());
            st.setString(2, c.getId_pay());
            st.setString(3, c.getId_event());
            st.setString(4, c.getId_seat());
            st.setString(5, c.getReason());
            st.setInt(6, c.getStatus());
            st.setString(7, c.getBankName());
            st.setString(8, c.getBankNumber());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    //status 0 là đang xử lý 1 là đồng ý hủy 2 là từ chối
    public void updateStatusPayCancelByPayid(String cid, String status) {
        String sql = "UPDATE [dbo].[Cancel_Ticket]\n"
                + "   SET [Status] = ?\n"
                + " WHERE CancelTicketID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2, cid);

            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    //check vé bị hủy 
    public int checkCancel(String id_pay) {
        String sql = " select * from Cancel_Ticket\n"
                + " where ID_Pay=? and Status=01";
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

    public List<PaymentCancel> getAllCancel_by_user_pending(String accountId) {
        List<PaymentCancel> list = new ArrayList<>();
        String sql = "select * from Cancel_Ticket where Account_Id = ? and status = 0 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, accountId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PaymentCancel c = new PaymentCancel(rs.getString("CancelTicketID"), rs.getString("Account_Id"), rs.getString("Id_event"), rs.getString("Id_seat"), rs.getString("Id_Pay"), rs.getString("Reason"), rs.getString("Bank_name"), rs.getString("Bank_number"), rs.getInt("Status"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("error");
        }

        return list;
    }

    public List<PaymentCancel> getListCancelByEventId(String eventId) {
        List<PaymentCancel> list = new ArrayList<>();
        String sql = "select * from Cancel_Ticket where [ID_event]= ?  and status = 0 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eventId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PaymentCancel c = new PaymentCancel(rs.getString("CancelTicketID"), rs.getString("Account_Id"), rs.getString("Id_event"), rs.getString("Id_seat"), rs.getString("Id_Pay"), rs.getString("Reason"), rs.getString("Bank_name"), rs.getString("Bank_number"), rs.getInt("Status"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("error");
        }

        return list;
    }

    public List<PaymentCancel> getAllCancel_by_user_success(String accountId) {
        List<PaymentCancel> list = new ArrayList<>();
        String sql = "select * from Cancel_Ticket where Account_Id = ? and status = 1 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, accountId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PaymentCancel c = new PaymentCancel(rs.getString("CancelTicketID"), rs.getString("Account_Id"), rs.getString("Id_event"), rs.getString("Id_seat"), rs.getString("Id_Pay"), rs.getString("Reason"), rs.getString("Bank_name"), rs.getString("Bank_number"), rs.getInt("Status"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("error");
        }

        return list;
    }

    public List<PaymentCancel> getAllCancel_by_user_fail(String accountId) {
        List<PaymentCancel> list = new ArrayList<>();
        String sql = "select * from Cancel_Ticket where Account_Id = ? and status = 2 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, accountId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PaymentCancel c = new PaymentCancel(rs.getString("CancelTicketID"), rs.getString("Account_Id"), rs.getString("Id_event"), rs.getString("Id_seat"), rs.getString("Id_Pay"), rs.getString("Reason"), rs.getString("Bank_name"), rs.getString("Bank_number"), rs.getInt("Status"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("error");
        }

        return list;
    }

    public static void main(String[] args) {
        List<PaymentCancel> list = new ArrayList<>();
        PaymentCancelDAO p = new PaymentCancelDAO();
        List<String> list2 = new ArrayList<>();
        EventDAO evd = new EventDAO();
//        list2 = evd.getAllEvent();
        // lấy các khiếu nại của khách hàng 
//        for (String id : list2) {
//            list.addAll(p.getListCancelByEventId(id));
//        }

//        for(String s : list2){
//            System.out.println(s);
//        }
//        list = p.getAllCancel();
//        for (PaymentCancel paymentCancel : list) {
//            System.out.println(paymentCancel);
//        }
//    PaymentCancel pc = p.getPaymentCancelByPaymentId("4");
//        System.out.println(pc);
//        p.updateStatusPayCancelByPayid("", status);
   PaymentCancel pc= p.getPaymentCancelByPaymentId("5");
        System.out.println(pc);
    }

    public List<PaymentCancel> getAllCancel() {
        List<PaymentCancel> list = new ArrayList<>();
        String sql = "select * from Cancel_Ticket where  status = 0 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PaymentCancel c = new PaymentCancel(rs.getString("CancelTicketID"), rs.getString("Account_Id"), rs.getString("Id_event"), rs.getString("Id_seat"), rs.getString("Id_Pay"), rs.getString("Reason"), rs.getString("Bank_name"), rs.getString("Bank_number"), rs.getInt("Status"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("error");
        }

        return list;
    }

    public PaymentCancel getPaymentCancelByPaymentId(String payid) {
        String sql = "select * from Cancel_Ticket where  status = 0 and ID_Pay = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, payid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PaymentCancel c = new PaymentCancel(rs.getString("CancelTicketID"), rs.getString("Account_Id"), rs.getString("Id_event"), rs.getString("Id_seat"), rs.getString("Id_Pay"), rs.getString("Reason"), rs.getString("Bank_name"), rs.getString("Bank_number"), rs.getInt("Status"));
            return c;
            }
        } catch (SQLException e) {
            System.out.println("error");
        }

        return null;
    }
}
