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
                + "           ,[StaffID]\n"
                + "           ,[SeatType1]\n"
                + "           ,[SeatType2]\n"
                + "           ,[SeatType3]\n"
                + "           ,[StatusDisable])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            st.setString(11, event.getStaffId());
            st.setString(12, event.getSeatType1());
            st.setString(13, event.getSeatType2());
            st.setString(14, event.getSeatType3());
            st.setString(15, event.getStatusDisable());
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
        String sql = "SELECT * \n"
                + "  FROM [dbo].[Event]\n"
                + "  where [StaffID] =? "
                + "  ORDER BY StatusDisable ASC, TimeStart ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String eventId, categoryID, eventName, description, eventImg,
                        locationId, timeStart, timeEnd, priceType1, priceType2,
                        priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable;
                eventId = String.valueOf(rs.getInt("EventID"));
                categoryID = String.valueOf(rs.getInt("CategoryID"));
                eventName = rs.getString("Eventname");
                description = rs.getString("Description");
                eventImg = rs.getString("EventImg");
                locationId = String.valueOf(rs.getString("LocationID"));
                timeStart = String.valueOf(rs.getTimestamp("TimeStart"));
                timeEnd = String.valueOf(rs.getTimestamp("TimeEnd"));
                priceType1 = String.valueOf(rs.getInt("PriceType1"));
                priceType2 = String.valueOf(rs.getInt("PriceType2"));
                priceType3 = String.valueOf(rs.getInt("PriceType3"));
                staffId = String.valueOf(rs.getInt("StaffID"));
                getSeatType1 = String.valueOf(rs.getInt("PriceType1"));
                getSeatType2 = String.valueOf(rs.getInt("PriceType2"));
                getSeatType3 = String.valueOf(rs.getInt("PriceType3"));
                statusDisable = String.valueOf(rs.getBoolean("StatusDisable"));
                Event e = new Event(eventId, categoryID, eventName, description, eventImg, locationId, timeStart, timeEnd, priceType1, priceType2, priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable);
                data.add(e);
            }
            return data;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

    public Event getEventById(String eid) {

        String sql = "SELECT *\n"
                + "  FROM [dbo].[Event]\n"
                + "  where [EventID] =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String eventId, categoryID, eventName, description, eventImg,
                        locationId, timeStart, timeEnd, priceType1, priceType2,
                        priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable;
                eventId = String.valueOf(rs.getInt("EventID"));
                categoryID = String.valueOf(rs.getInt("CategoryID"));
                eventName = rs.getString("Eventname");
                description = rs.getString("Description");
                eventImg = rs.getString("EventImg");
                locationId = String.valueOf(rs.getString("LocationID"));
                timeStart = String.valueOf(rs.getTimestamp("TimeStart"));
                timeEnd = String.valueOf(rs.getTimestamp("TimeEnd"));
                priceType1 = String.valueOf(rs.getInt("PriceType1"));
                priceType2 = String.valueOf(rs.getInt("PriceType2"));
                priceType3 = String.valueOf(rs.getInt("PriceType3"));
                staffId = String.valueOf(rs.getInt("StaffID"));
                getSeatType1 = String.valueOf(rs.getInt("SeatType1"));
                getSeatType2 = String.valueOf(rs.getInt("SeatType2"));
                getSeatType3 = String.valueOf(rs.getInt("SeatType3"));
                statusDisable = String.valueOf(rs.getBoolean("StatusDisable"));
                Event e = new Event(eventId, categoryID, eventName, description, eventImg, locationId, timeStart, timeEnd, priceType1, priceType2, priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable);
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
//        List<Event> list = evd.pagingEvent(2);
//        for (Event o : list) {
//            System.out.println(o);
//        }
//        data = evd.getAllEventByAccountId("1");
//        for (Event event : data) {
//            System.out.println(event);
//        }

//        Event e = evd.getEventById("19");
//        System.out.println(e.getTimeStart());
//        evd.updateStatusDisableById("19");
//        data = evd.getAllIdEventOfStaff("5");
//        data = evd.getAllEvent();
//        for (String event : data) {
//            System.out.println(event);
//        }
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
        String sql = "SELECT * \n"
                + "  FROM [dbo].[Event]"
                + "  ORDER BY StatusDisable ASC, TimeStart ASC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String eventId, categoryID, eventName, description, eventImg,
                        locationId, timeStart, timeEnd, priceType1, priceType2,
                        priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable;
                eventId = String.valueOf(rs.getInt("EventID"));
                categoryID = String.valueOf(rs.getInt("CategoryID"));
                eventName = rs.getString("Eventname");
                description = rs.getString("Description");
                eventImg = rs.getString("EventImg");
                locationId = String.valueOf(rs.getString("LocationID"));
                timeStart = String.valueOf(rs.getTimestamp("TimeStart"));
                timeEnd = String.valueOf(rs.getTimestamp("TimeEnd"));
                priceType1 = String.valueOf(rs.getInt("PriceType1"));
                priceType2 = String.valueOf(rs.getInt("PriceType2"));
                priceType3 = String.valueOf(rs.getInt("PriceType3"));
                staffId = String.valueOf(rs.getInt("StaffID"));
                getSeatType1 = String.valueOf(rs.getInt("PriceType1"));
                getSeatType2 = String.valueOf(rs.getInt("PriceType2"));
                getSeatType3 = String.valueOf(rs.getInt("PriceType3"));
                statusDisable = String.valueOf(rs.getBoolean("StatusDisable"));
                Event e = new Event(eventId, categoryID, eventName, description, eventImg, locationId, timeStart, timeEnd, priceType1, priceType2, priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable);
                data.add(e);
            }
            return data;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

    // search nameevent and description and locationid
    public List<Event> getEventBySearch1(String keyword, String lid) {
        List<Event> data = new ArrayList<>();
        String sql = "SELECT * \n"
                + "  FROM [dbo].[Event]"
                + "        where 0 = 0 ";
        if (keyword != null || !keyword.isEmpty()) {
            sql += " and ( LOWER(Eventname) like N'%" + keyword + "%' or LOWER(Description) like N'%" + keyword + "%' )";
        }
        if (!lid.equals("0")) {
            sql += " and LocationID = '" + lid + "'";
        }
        sql += " ORDER BY StatusDisable ASC, TimeStart ASC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String eventId, categoryID, eventName, description, eventImg,
                        locationId, timeStart, timeEnd, priceType1, priceType2,
                        priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable;
                eventId = String.valueOf(rs.getInt("EventID"));
                categoryID = String.valueOf(rs.getInt("CategoryID"));
                eventName = rs.getString("Eventname");
                description = rs.getString("Description");
                eventImg = rs.getString("EventImg");
                locationId = String.valueOf(rs.getString("LocationID"));
                timeStart = String.valueOf(rs.getTimestamp("TimeStart"));
                timeEnd = String.valueOf(rs.getTimestamp("TimeEnd"));
                priceType1 = String.valueOf(rs.getInt("PriceType1"));
                priceType2 = String.valueOf(rs.getInt("PriceType2"));
                priceType3 = String.valueOf(rs.getInt("PriceType3"));
                staffId = String.valueOf(rs.getInt("StaffID"));
                getSeatType1 = String.valueOf(rs.getInt("PriceType1"));
                getSeatType2 = String.valueOf(rs.getInt("PriceType2"));
                getSeatType3 = String.valueOf(rs.getInt("PriceType3"));
                statusDisable = String.valueOf(rs.getBoolean("StatusDisable"));
                Event e = new Event(eventId, categoryID, eventName, description, eventImg, locationId, timeStart, timeEnd, priceType1, priceType2, priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable);
                data.add(e);
            }
            return data;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

    // search nameevent and description and locationid and catrgoryid and disable
    public List<Event> getEventBySearch2(String keyword, String lid, String cid, String disable) {
        List<Event> data = new ArrayList<>();
        String sql = "SELECT * \n"
                + "  FROM [dbo].[Event]"
                + "        where 0 = 0 ";
        if (keyword != null || keyword != "") {
            sql += " and ( LOWER(Eventname) like N'%" + keyword + "%' or LOWER(Description) like N'%" + keyword + "%' )";
        }
        if (!lid.equals("0")) {
            sql += " and LocationID = '" + lid + "'";
        }
        if (!cid.equals("0")) {
            sql += " and CategoryID = '" + cid + "'";
        }
        if (!disable.equals("2")) {
            sql += " and StatusDisable = '" + disable + "'";
        }
        sql += " ORDER BY StatusDisable ASC, TimeStart ASC";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String eventId, categoryID, eventName, description, eventImg,
                        locationId, timeStart, timeEnd, priceType1, priceType2,
                        priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable;
                eventId = String.valueOf(rs.getInt("EventID"));
                categoryID = String.valueOf(rs.getInt("CategoryID"));
                eventName = rs.getString("Eventname");
                description = rs.getString("Description");
                eventImg = rs.getString("EventImg");
                locationId = String.valueOf(rs.getString("LocationID"));
                timeStart = String.valueOf(rs.getTimestamp("TimeStart"));
                timeEnd = String.valueOf(rs.getTimestamp("TimeEnd"));
                priceType1 = String.valueOf(rs.getInt("PriceType1"));
                priceType2 = String.valueOf(rs.getInt("PriceType2"));
                priceType3 = String.valueOf(rs.getInt("PriceType3"));
                staffId = String.valueOf(rs.getInt("StaffID"));
                getSeatType1 = String.valueOf(rs.getInt("PriceType1"));
                getSeatType2 = String.valueOf(rs.getInt("PriceType2"));
                getSeatType3 = String.valueOf(rs.getInt("PriceType3"));
                statusDisable = String.valueOf(rs.getBoolean("StatusDisable"));
                Event e = new Event(eventId, categoryID, eventName, description, eventImg, locationId, timeStart, timeEnd, priceType1, priceType2, priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable);
                data.add(e);
            }
            return data;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

    public List<Event> getEventOfStaffBySearch(String cid, String disable, String id) {
        List<Event> data = new ArrayList<>();
        String sql = "SELECT * \n"
                + "  FROM [dbo].[Event]\n"
                + "  where 0=0  and [StaffID] =? ";
        if (!cid.equals("0")) {
            sql += " and CategoryID = '" + cid + "'";
        }
        if (!disable.equals("2")) {
            sql += " and StatusDisable = '" + disable + "'";
        }
        sql += " ORDER BY StatusDisable ASC, TimeStart ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String eventId, categoryID, eventName, description, eventImg,
                        locationId, timeStart, timeEnd, priceType1, priceType2,
                        priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable;
                eventId = String.valueOf(rs.getInt("EventID"));
                categoryID = String.valueOf(rs.getInt("CategoryID"));
                eventName = rs.getString("Eventname");
                description = rs.getString("Description");
                eventImg = rs.getString("EventImg");
                locationId = String.valueOf(rs.getString("LocationID"));
                timeStart = String.valueOf(rs.getTimestamp("TimeStart"));
                timeEnd = String.valueOf(rs.getTimestamp("TimeEnd"));
                priceType1 = String.valueOf(rs.getInt("PriceType1"));
                priceType2 = String.valueOf(rs.getInt("PriceType2"));
                priceType3 = String.valueOf(rs.getInt("PriceType3"));
                staffId = String.valueOf(rs.getInt("StaffID"));
                getSeatType1 = String.valueOf(rs.getInt("PriceType1"));
                getSeatType2 = String.valueOf(rs.getInt("PriceType2"));
                getSeatType3 = String.valueOf(rs.getInt("PriceType3"));
                statusDisable = String.valueOf(rs.getBoolean("StatusDisable"));
                Event e = new Event(eventId, categoryID, eventName, description, eventImg, locationId, timeStart, timeEnd, priceType1, priceType2, priceType3, staffId, getSeatType1, getSeatType2, getSeatType3, statusDisable);
                data.add(e);
            }
            return data;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

    public List<String> getAllIdEventOfStaff(String id) {
        List<String> data = new ArrayList<>();
        String sql = "SELECT * \n"
                + "  FROM [dbo].[Event]\n"
                + "  where 0=0  and [StaffID] =? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String eventId;
                eventId = String.valueOf(rs.getInt("EventID"));
                data.add(eventId);
            }
            return data;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

    public boolean checkStatusDisableByEventId(String event_id_raw) {
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
                + "      ,[StaffID]\n"
                + "      ,[SeatType1]\n"
                + "      ,[SeatType2]\n"
                + "      ,[SeatType3]\n"
                + "      ,[StatusDisable]\n"
                + "  FROM [dbo].[Event]\n"
                + "  where [EventID] = ? and StatusDisable = 1 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, event_id_raw);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public String getNameEventByEventId(String eid) {
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
                + "      ,[StaffID]\n"
                + "      ,[SeatType1]\n"
                + "      ,[SeatType2]\n"
                + "      ,[SeatType3]\n"
                + "      ,[StatusDisable]\n"
                + "  FROM [dbo].[Event]\n"
                + "  where [EventID] = ?  ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String name = rs.getString("Eventname");
                return name;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Event> getLastestEvents() {
        List<Event> data = new ArrayList<>();
        String sql = "SELECT TOP 5 EventID, Eventname,  EventImg, TimeStart\n"
                + "FROM Event\n"
                + "WHERE StatusDisable = 0\n"
                + "ORDER BY TimeStart DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Event event = new Event();
                event.setEventId(String.valueOf(rs.getInt("EventID")));
                event.setEventName(rs.getString("Eventname"));
                event.setEventImg(rs.getString("EventImg"));
                event.setTimeStart(String.valueOf(rs.getTimestamp("TimeStart")));
                data.add(event);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return data;

    }

//    public int getTotalEvent() {
//        String sql = "select count (*) from event";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                return rs.getInt(1);
//            }
//        } catch (Exception e) {
//
//        }
//        return 0;
//    }

//    public List<Event> pagingEvent(int index) {
//        List<Event> list = new ArrayList<>();
//        String sql = "select * from Event\n"
//                + "order by EventID\n"
//                + "offset ? rows fetch next 8 rows only";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, (index - 1)*8 );
//            ResultSet rs = st.executeQuery();
//             while (rs.next()) {
//               list.add(new Event(  String.valueOf(rs.getInt(1)),
//                                    String.valueOf(rs.getInt(2)),
//                                    rs.getString(3),
//                                    rs.getString(4),
//                                    rs.getString(5),
//                                    String.valueOf(rs.getInt(6)),
//                                    String.valueOf(rs.getTimestamp(7)),
//                                    String.valueOf(rs.getTimestamp(8)),
//                                    String.valueOf(rs.getInt(9)),
//                                    String.valueOf(rs.getInt(10)),
//                                    String.valueOf(rs.getInt(11)),
//                                    String.valueOf(rs.getInt(12)),
//                                    String.valueOf(rs.getInt(13)),
//                                    String.valueOf(rs.getInt(14)),
//                                    String.valueOf(rs.getInt(15)),
//                            String.valueOf(rs.getBoolean(16))));
//                       
//                       
//               
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//
//}
}