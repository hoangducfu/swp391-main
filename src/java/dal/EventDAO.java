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
    public static void main(String[] args) {
        EventDAO e = new EventDAO();
       if( e.addEvent(new Event("1", "duc1", "dep trai", "aaaaa", "1", "2024-05-29 02:07:00.0", "2024-05-29 02:07:00.0", "111", "222", "333", "2", "0"))){
           System.out.println("aa");
       }else{
           System.out.println("nnnn");
       }
    }

}
