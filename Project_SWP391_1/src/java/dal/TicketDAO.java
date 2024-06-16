/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import model.Area;
import model.Category;
import model.Event;
import model.Ticket;

/**
 *
 * @author Admin
 */
public class TicketDAO extends DBContext {
    
    public Ticket getTicketById(int id) {
        String sql = "select * from Ticket t\n"
                + "left join Event e on t.EventID = e.EventID\n"
                + "left join Area a on t.Area_id = a.Area_id "
                + "left join Category c on c.CategoryID = e.CategoryID "
                + "where t.Ticket_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Ticket t = new Ticket(rs.getInt(1), rs.getBoolean(2), rs.getInt(3), rs.getInt(4), rs.getInt(5));
                Event e = new Event(rs.getInt(6), 
                        rs.getInt(7), 
                        rs.getString(8), 
                        rs.getString(9), 
                        rs.getString(10), 
                        rs.getInt(11), 
                        rs.getDate(12), 
                        LocalTime.parse(rs.getString(13),DateTimeFormatter.ofPattern("HH:mm:ss[.SSSSSSS]")), 
                        rs.getInt(14), 
                        rs.getBoolean(15));
                Category c = new Category(rs.getInt(19), rs.getString(20));
                e.setCategory(c);
                t.setEvent(e);
                Area a = new Area(rs.getInt(16), 
                        rs.getString(17), 
                        rs.getDouble(18));
                t.setArea(a);
                return t;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
