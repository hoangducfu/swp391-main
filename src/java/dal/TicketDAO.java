/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Check_seat;
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

    public void updateStatusTiket(String areaID, String eventID) {
        String sql = "  UPDATE [BookingTicket].[dbo].[Ticket]\n"
                + "SET [Status] = 1\n"
                + "WHERE [EventID] = ? AND [Area_id] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eventID);
            st.setString(2, areaID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    //set lại về 0 
    public void updateStatusTiketNotConfirm(String areaID, String eventID) {
        String sql = "  UPDATE [BookingTicket].[dbo].[Ticket]\n"
                + "SET [Status] = 0\n"
                + "WHERE [EventID] = ? AND [Area_id] = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eventID);
            st.setString(2, areaID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteStatusTiketNotConfirm(String areaID, String eventID) {
        String sql = " DELETE FROM CheckSeat\n"
                + "WHERE EventID =?  AND SeatID = ? ;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eventID);
            st.setString(2, areaID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    // check seat 
    public int checkSeat(String areaID, String eventID) {
        String sql = "SELECT * \n"
                + "FROM CheckSeat\n"
                + "WHERE EventID = ? AND SeatID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eventID);
            st.setString(2, areaID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return 1;
            }
        } catch (Exception e) {
            return 0;
        }
        return 0;
    }

    //
    public void insertDoneSeat(Check_seat c) {
        String sql = " INSERT INTO [dbo].[CheckSeat]\n"
                + "           ([EventID]\n"
                + "           ,[SeatID])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getEvent_id());
            st.setString(2, c.getSeat_id());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        TicketDAO dao = new TicketDAO();
        List<Ticket> list = dao.getTicketByIdEvent("1");
        for (Ticket o : list) {
            System.out.println(o);
        }
    }

}
