/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Event;

/**
 *
 * @author Admin
 */
public class EventDAO extends DBContext {

    public boolean createEvent(String CategoryID, String Eventname) {
        String sql = "INSERT INTO [dbo].[Event]\n"
                + "           ([CategoryID]\n"
                + "           ,[Eventname]\n"
                + "           ,[Description]\n"
                + "           ,[EventImg]\n"
                + "           ,[LocationID]\n"
                + "           ,[TimeStart]\n"
                + "           ,[TimeEnd]\n"
                + "           ,[PriceType1]\n"
                + "           ,[PriceType2]\n"
                + "           ,[PriceType3]\n"
                + "           ,[AccountID]\n"
                + "           ,[StatusDisable])\n"
                + "     VALUES\n"
                + "(?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, CategoryID);
            st.setString(2, Eventname);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("err:  " + e.getMessage());

        }
        return false;
    }

    public List<Event> getAllListEvent() {
        List<Event> data = new ArrayList<>();
        String sql = "SELECT [EventID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[Eventname]\n"
                + "      ,[Description]\n"
                + "      ,[EventImg]\n"
                + "      ,[LocationID]\n"
                + "      ,[TimeStart]\n"
                + "      ,[TimeEnd]\n"
                + "      ,[PriceType1]\n"
                + "      ,[PriceType2]\n"
                + "      ,[PriceType3]\n"
                + "      ,[AccountID]\n"
                + "      ,[StatusDisable]\n"
                + "  FROM [BookingTicket].[dbo].[Event]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Event event;
                String id, CategoryID, name, description, image, LocationID, TimeStart, TimeEnd, PriceType1, PriceType2, PriceType3, AccountID, status;
                id = String.valueOf(rs.getInt("EventID"));
                CategoryID = String.valueOf(rs.getInt("CategoryID"));
                name = rs.getString("Eventname");
                description = rs.getString("Description");
                image = rs.getString("EventImg");
                LocationID = rs.getString("LocationID");
                TimeStart = String.valueOf(rs.getString("TimeStart"));
                TimeEnd = String.valueOf(rs.getString("TimeEnd"));
                PriceType1 = String.valueOf(rs.getString("PriceType1"));
                PriceType2 = String.valueOf(rs.getString("PriceType2"));
                PriceType3 = String.valueOf(rs.getString("PriceType3"));
                AccountID = String.valueOf(rs.getInt("AccountID"));
                status = String.valueOf(rs.getBoolean("status"));
                event = new Event(id, CategoryID, name, description, image, LocationID, TimeStart, TimeEnd, PriceType1, PriceType2, PriceType3, AccountID, status);
                data.add(event);
            }
        } catch (SQLException e) {
            System.out.println("e");
        }
        return data;
    }

    public List<Event> getEventByName(String Eventname) {
        List<Event> data = new ArrayList<>();
        String sql = "Select * from Event where Eventname like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Event event;
                String id, CategoryID, name, description, image, LocationID, TimeStart, TimeEnd, PriceType1, PriceType2, PriceType3, AccountID, status;
                id = String.valueOf(rs.getInt("EventID"));
                CategoryID = String.valueOf(rs.getInt("CategoryID"));
                name = rs.getString("Eventname");
                description = rs.getString("Description");
                image = rs.getString("EventImg");
                LocationID = rs.getString("LocationID");
                TimeStart = String.valueOf(rs.getString("TimeStart"));
                TimeEnd = String.valueOf(rs.getString("TimeEnd"));
                PriceType1 = String.valueOf(rs.getString("PriceType1"));
                PriceType2 = String.valueOf(rs.getString("PriceType2"));
                PriceType3 = String.valueOf(rs.getString("PriceType3"));
                AccountID = String.valueOf(rs.getInt("AccountID"));
                status = String.valueOf(rs.getBoolean("status"));
                event = new Event(id, CategoryID, name, description, image, LocationID, TimeStart, TimeEnd, PriceType1, PriceType2, PriceType3, AccountID, status);
                data.add(event);
            }
        } catch (SQLException e) {
            System.out.println("e");
        }
        return data;
    }

    public void deleteEventById(String id) {
        String sql = "DELETE FROM [dbo].[Event]\n"
                + "      WHERE EventID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeQuery();
            return;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("err" + e.getMessage());
        }
        return;
    }

    public String getIDbyEventname(String Eventname) {
        String sql = "SELECT [EventID]\n"
                + "                ,[CategoryID]\n"
                + "                 ,[Eventname]\n"
                + "               ,[Description]\n"
                + "                  ,[EventImg]\n"
                + "                 ,[LocationID]\n"
                + "                     ,[TimeStart]\n"
                + "                    ,[TimeEnd]\n"
                + "                    ,[PriceType1]\n"
                + "                    ,[PriceType2]\n"
                + "                     ,[PriceType3]\n"
                + "                    ,[AccountID]\n"
                + "                    ,[StatusDisable]\n"
                + "                 FROM [BookingTicket].[dbo].[Event]\n"
                + " where Eventname = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Eventname);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return String.valueOf(rs.getInt("EventID"));
                
            }
        }catch (SQLException e){
            System.out.println(e);
        }
        return null;
    }
    public List<Event> getListEventByStaffID(String AccountID){
        List<Event> data = new ArrayList<>();
        String sql = "SELECT FROM [dbo].[Event]\n"
                +" Where AccountID = ? ";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, AccountID);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
               Event event;
               String id = String.valueOf(rs.getInt("EventID"));
               String CategoryID = String.valueOf(rs.getInt("CategoryID"));
               String name = rs.getString("Eventname");
               String description = rs.getString("Description");
               String image = rs.getString("EventImg");
               String LocationID = rs.getString("LocationID");
               String TimeStart = String.valueOf(rs.getString("TimeStart"));
               String TimeEnd = String.valueOf(rs.getString("TimeEnd"));
               String PriceType1 = String.valueOf(rs.getString("PriceType1"));
               String PriceType2 = String.valueOf(rs.getString("PriceType2"));
               String PriceType3 = String.valueOf(rs.getString("PriceType3"));
               String status = String.valueOf(rs.getBoolean("status"));
                event = new Event(id, CategoryID, name, description, image, LocationID, TimeStart, TimeEnd, PriceType1, PriceType2, PriceType3, AccountID, status);
                data.add(event);
            }
        }catch(SQLException e){
            System.out.println(e);
        }return data;
    }
    public static void main(String[] args) {
        EventDAO d = new EventDAO();
        List<Event> data = d.getAllListEvent();
        for (Event o : data) {
            System.out.println(o);
        }
        
    }

    public boolean addEvent(Event event) {
        String sql = "INSERT INTO [dbo].[Event]\n"
                + "           ([CategoryID]\n"
                + "           ,[Eventname]\n"
                + "           ,[Description]\n"
                + "           ,[EventImg]\n"
                + "           ,[LocationID]\n"
                + "           ,[TimeStart]\n"
                + "           ,[TimeEnd]\n"
                + "           ,[PriceType1]\n"
                + "           ,[PriceType2]\n"
                + "           ,[PriceType3]\n"
                + "           ,[AccountID]\n"
                + "           ,[StatusDisable])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, event.getCategoryID());
            st.setString(2, event.getName());
            st.setString(3, event.getDescription());
            st.setString(4, event.getImage());
            st.setString(5, event.getLocationID());
            st.setString(6, event.getTimeStart());
            st.setString(7, event.getTimeEnd());
            st.setString(8, event.getPriceType1());
            st.setString(9, event.getPriceType2());
            st.setString(10, event.getPriceType3());
            st.setString(11, event.getAccountID());
            st.setString(12, event.getStatus());
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return false;
    }
    
   
}
