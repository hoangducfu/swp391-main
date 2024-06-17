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
              while(rs.next()){
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
              while(rs.next()){
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
    
    public static void main(String[] args) {
        TicketDAO dao = new TicketDAO();
        List<Ticket> list = dao.getTicketByIdEvent("1");
        for (Ticket o : list) {
            System.out.println(o);
        }
    }
    
}
