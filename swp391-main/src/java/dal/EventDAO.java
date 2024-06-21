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
 * @author hoangduc
 */
public class EventDAO extends DBContext {

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
            st.setString(2, event.getEventName());
            st.setString(3, event.getDescription());
            st.setString(4, event.getEventImg());
            st.setString(5, event.getLocationId());
            st.setString(6, event.getTimeStart());
            st.setString(7, event.getTimeEnd());
            st.setString(8, event.getPriceType1());
            st.setString(9, event.getPriceType2());
            st.setString(10, event.getPriceType3());
            st.setString(11, event.getAccountId());
            st.setString(12, event.getStatusDisable());
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return false;
    }

    public List<Event> getAllEventByAccountId(String id) {
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
                + "  FROM [dbo].[Event]\n"
                + "  where [AccountID] =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String eventId, categoryID, eventName, description, eventImg,
                        locationId, timeStart, timeEnd, priceType1, priceType2,
                        priceType3, accountId, statusDisable;
                eventId = String.valueOf(rs.getInt("EventID"));
                categoryID = String.valueOf(rs.getInt("CategoryID"));
                eventName = rs.getString("Eventname");
                description = rs.getString("Description");
                eventImg = rs.getString("EventImg");
                locationId = String.valueOf(rs.getString("LocationID"));
                timeStart = String.valueOf(rs.getDate("TimeStart"));
                timeEnd = String.valueOf(rs.getDate("TimeEnd"));
                priceType1 = String.valueOf(rs.getInt("PriceType1"));
                priceType2 = String.valueOf(rs.getInt("PriceType2"));
                priceType3 = String.valueOf(rs.getInt("PriceType3"));
                accountId = String.valueOf(rs.getInt("AccountID"));
                statusDisable = String.valueOf(rs.getBoolean("StatusDisable"));
                Event e = new Event(eventId, categoryID, eventName, description, eventImg, locationId, timeStart, timeEnd, priceType1, priceType2, priceType3, accountId, statusDisable);
                data.add(e);
            }
            return data;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

    public Event getEventById(String eid) {

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
                + "  FROM [dbo].[Event]\n"
                + "  where [EventID] =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String eventId, categoryID, eventName, description, eventImg,
                        locationId, timeStart, timeEnd, priceType1, priceType2,
                        priceType3, accountId, statusDisable;
                eventId = String.valueOf(rs.getInt("EventID"));
                categoryID = String.valueOf(rs.getInt("CategoryID"));
                eventName = rs.getString("Eventname");
                description = rs.getString("Description");
                eventImg = rs.getString("EventImg");
                locationId = String.valueOf(rs.getString("LocationID"));
                timeStart = String.valueOf(rs.getDate("TimeStart"));
                timeEnd = String.valueOf(rs.getDate("TimeEnd"));
                priceType1 = String.valueOf(rs.getInt("PriceType1"));
                priceType2 = String.valueOf(rs.getInt("PriceType2"));
                priceType3 = String.valueOf(rs.getInt("PriceType3"));
                accountId = String.valueOf(rs.getInt("AccountID"));
                statusDisable = String.valueOf(rs.getBoolean("StatusDisable"));
                Event e = new Event(eventId, categoryID, eventName, description, eventImg, locationId, timeStart, timeEnd, priceType1, priceType2, priceType3, accountId, statusDisable);
                return e;
            }
        } catch (SQLException e) {
            System.out.println("e");
        }
        return null;
    }

    public static void main(String[] args) {
        List<Event> data = new ArrayList<>();
        EventDAO evd = new EventDAO();
//        data = evd.getAllEventByAccountId("1");
//        for (Event event : data) {
//            System.out.println(event);
//        }

//        Event e = evd.getEventById("19");
//        System.out.println(e);
//        evd.updateStatusDisableById("19");
        data = evd.getEventBySearch("0", "1");
//        data = evd.getAllEvent();
        for (Event event : data) {
            System.out.println(event);
        }
    }

    public void updateStatusDisableById(String eid) {
        String sql = "UPDATE [dbo].[Event]\n"
                + "   SET [StatusDisable] = 1\n"
                + " WHERE EventID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, eid);
            st.executeUpdate();
            return;
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return;
    }

    public List<Event> getAllEvent() {
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
                + "  FROM [dbo].[Event]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String eventId, categoryID, eventName, description, eventImg,
                        locationId, timeStart, timeEnd, priceType1, priceType2,
                        priceType3, accountId, statusDisable;
                eventId = String.valueOf(rs.getInt("EventID"));
                categoryID = String.valueOf(rs.getInt("CategoryID"));
                eventName = rs.getString("Eventname");
                description = rs.getString("Description");
                eventImg = rs.getString("EventImg");
                locationId = String.valueOf(rs.getString("LocationID"));
                timeStart = String.valueOf(rs.getDate("TimeStart"));
                timeEnd = String.valueOf(rs.getDate("TimeEnd"));
                priceType1 = String.valueOf(rs.getInt("PriceType1"));
                priceType2 = String.valueOf(rs.getInt("PriceType2"));
                priceType3 = String.valueOf(rs.getInt("PriceType3"));
                accountId = String.valueOf(rs.getInt("AccountID"));
                statusDisable = String.valueOf(rs.getBoolean("StatusDisable"));
                Event e = new Event(eventId, categoryID, eventName, description, eventImg, locationId, timeStart, timeEnd, priceType1, priceType2, priceType3, accountId, statusDisable);
                data.add(e);
            }
            return data;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

    public List<Event> getEventBySearch(String cid, String lid) {
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
                + "  FROM [dbo].[Event]"
                +"        where 0 = 0 "
                ;
        if (!cid.equals("0")) {
            sql+= " and CategoryID = '"+cid+"' ";
        }
        if(!lid.equals("0")){
            sql +=" and LocationID = '"+lid+"'";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String eventId, categoryID, eventName, description, eventImg,
                        locationId, timeStart, timeEnd, priceType1, priceType2,
                        priceType3, accountId, statusDisable;
                eventId = String.valueOf(rs.getInt("EventID"));
                categoryID = String.valueOf(rs.getInt("CategoryID"));
                eventName = rs.getString("Eventname");
                description = rs.getString("Description");
                eventImg = rs.getString("EventImg");
                locationId = String.valueOf(rs.getString("LocationID"));
                timeStart = String.valueOf(rs.getDate("TimeStart"));
                timeEnd = String.valueOf(rs.getDate("TimeEnd"));
                priceType1 = String.valueOf(rs.getInt("PriceType1"));
                priceType2 = String.valueOf(rs.getInt("PriceType2"));
                priceType3 = String.valueOf(rs.getInt("PriceType3"));
                accountId = String.valueOf(rs.getInt("AccountID"));
                statusDisable = String.valueOf(rs.getBoolean("StatusDisable"));
                Event e = new Event(eventId, categoryID, eventName, description, eventImg, locationId, timeStart, timeEnd, priceType1, priceType2, priceType3, accountId, statusDisable);
                data.add(e);
            }
            return data;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

}
