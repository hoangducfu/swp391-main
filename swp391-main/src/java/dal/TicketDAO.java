/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Ticket;

/**
 *
 * @author nguye
 */
public class TicketDAO extends DBContext {

    public List<Ticket> getAllTicket() {
        List<Ticket> list = new ArrayList<>();
        String sql = "select * from Ticket";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Ticket(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                ));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Ticket> getTicketByIdEvent(String id) {
        List<Ticket> list = new ArrayList<>();
        String sql = "select * from Ticket where [EventID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Ticket(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                ));
            }
        } catch (Exception e) {
        }

        return list;
    }
//        public void update (String cartegory_name, int cartegory_id){
//        
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, cartegory_name);
//            st.setInt(2,cartegory_id);
//            st.executeUpdate();
//        } catch (Exception e) {
//        }
//    }

    public void updateStatusTiket(String ticketId, String status, String peymentId) {
        String sql = " UPDATE [dbo].[Ticket]\n"
                + "   SET [Status] = ?\n"
                + "      ,[PaymentID] = ?\n"
                + " WHERE Ticket_id = ?  ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString( 1, status);
            st.setString(2, peymentId);
            st.setString(3, ticketId);

            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        TicketDAO dao = new TicketDAO();
//        List<Ticket> list = dao.getTicketByIdEvent("1");
//        for (Ticket o : list) {
//            System.out.println(o);
//        }
        Ticket t = new Ticket();
        t = dao.getTicketByIdEventAndSeatId("4", "10");
        System.out.println(t);
    }

    public int getSeatsAvailableByEventId(String eid) {
        int number = 0;
        String sql = "SELECT COUNT(*)\n"
                + "FROM Ticket\n"
                + "WHERE [Status] = 0 and [EventID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                number = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return number;
    }

//    public void deleteStatusTiketCheckSeatNotConfirm(String ticketId) {
//        String sql = "DELETE FROM [dbo].[CheckSeat]\n"
//                + "      WHERE TicketID = ? ;";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, ticketId);
//            st.executeUpdate();
//        } catch (Exception e) {
//        }
//    }
    //set lại về 0 
//    public void updateStatusTiketNotConfirm(String areaName, String eventID) {
//        String sql = "  UPDATE [BookingTicket].[dbo].[Ticket]\n"
//                + "SET [Status] = 0\n"
//                + "WHERE [EventID] = ? AND [AreaName] = ?;";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, eventID);
//            st.setString(2, areaName);
//            st.executeUpdate();
//        } catch (Exception e) {
//        }
//    }

    public int checkSeatByTicketId(String ticketId, String status) {
        String sql = "SELECT *  FROM [dbo].[Ticket]\n"
                + "where Ticket_id = ? and Status = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ticketId);
            st.setString(2, status);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return 1;
            }
        } catch (Exception e) {
            return 0;
        }
        return 0;
    }

//    public void insertDoneSeat(CheckSeat c) {
//        String sql = " INSERT INTO [dbo].[CheckSeat]\n"
//                + "           ([TicketID])\n"
//                + "     VALUES    (?) ";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, c.getTicketId());
//            st.executeUpdate();
//        } catch (Exception e) {
//        }
//    }
    public Ticket getTicketByIdEventAndSeatId(String event_id_raw, String element) {
        String sql = "select * from Ticket where [EventID] = ? AND AreaName = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, event_id_raw);
            st.setString(2, element);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Ticket t = new Ticket(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
                return t;
            }
        } catch (Exception e) {
        }
        return null;
    }

}
