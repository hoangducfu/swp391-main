/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Event;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author mactu
 */
public class DAO_event extends DBContext {

    public List<Event> getAllEvent() {
        List<Event> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "   Event. EventID ,\n"
                + "   Event. CategoryID,\n"
                + "    Event.Eventname ,\n"
                + "   Category. Categoryname ,\n"
                + "   Event. EventImg ,\n"
                + "    Event.Date ,\n"
                + "   Event. Time ,\n"
                + "   Event. Description ,\n"
                + "   Location. Location_name \n"
                + "FROM\n"
                + "    Event \n"
                + "JOIN\n"
                + "    Category  ON Event.CategoryID = Category.CategoryID\n"
                + "JOIN\n"
                + "    Location ON Event.LocationID = Location.Location_id;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Time time = rs.getTime("time");
                // Chuyển đổi từ java.sql.Time sang LocalTime
                LocalTime localTime = time.toLocalTime();
                // Định dạng lại để chỉ lấy giờ và phút
                String formattedTime = localTime.format(DateTimeFormatter.ofPattern("hh:mm"));
                // So sánh và thêm AM hoặc PM
                String amPm = localTime.isAfter(LocalTime.NOON) ? "PM" : "AM";
                String timereal = formattedTime + " " + amPm;
                Event c = new Event(rs.getInt("EventID"), rs.getInt("CategoryID"), rs.getString("Eventname"), rs.getString("Categoryname"), rs.getString("EventImg"), rs.getString("Date"), timereal, rs.getString("Location_name"),rs.getString("Description"));
                list.add(c);
            }
        } catch (SQLException e) {
            Event s = new Event(00, 00, "erro", "erro", "erro", "erro", "erro", "erro", "erro");
            list.add(s);
        }

        return list;
    }

    public Event getEvent(int event_id) {
        String sql = "		SELECT\n"
                + "    Event.EventID ,\n"
                + "    Event. CategoryID ,\n"
                + "   Event. Eventname ,\n"
                + "    Category.Categoryname ,\n"
                + "     Event.EventImg ,\n"
                + "     Event.Date ,\n"
                + "     Event.Time ,\n"
                + "    Location.Location_name ,\n"
                + "    Event.Description ,\n"
                + "    Event.AccountID ,\n"
                + "    Event.StatusDisable \n"
                + "FROM\n"
                + "    Event \n"
                + "JOIN\n"
                + "    Category  ON Event.CategoryID = Category.CategoryID\n"
                + "JOIN\n"
                + "    Location  ON Event.LocationID = Location.Location_id\n"
                + "WHERE\n"
                + "   EventID = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, event_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Time time = rs.getTime("time");
                // Chuyển đổi từ java.sql.Time sang LocalTime
                LocalTime localTime = time.toLocalTime();
                // Định dạng lại để chỉ lấy giờ và phút
                String formattedTime = localTime.format(DateTimeFormatter.ofPattern("hh:mm"));
                // So sánh và thêm AM hoặc PM
                String amPm = localTime.isAfter(LocalTime.NOON) ? "PM" : "AM";
                String timereal = formattedTime + " " + amPm;
                Event c = new Event(rs.getInt("EventID"), rs.getInt("CategoryID"), rs.getString("Eventname"), rs.getString("Categoryname"), rs.getString("EventImg"), rs.getString("Date"), timereal, rs.getString("Location_name"),rs.getString("Description"));
                return c;
            }
        } catch (SQLException e) {
            Event s = new Event(00, 00, "erro", "erro", "erro", "erro", "erro", "erro","erro");
            return s;
        }

        return null;
    }
}
