/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.awt.BorderLayout;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Location;
/**
 *
 * @author Admin
 */
public class LocationDAO extends DBContext {

    
    
    public List<Location> getALLLocation() {
        List<Location> data = new ArrayList<>();
        String sql = "SELECT [Location_id]\n"
                + "      ,[Location_name]\n"
                + "  FROM [dbo].[Location]";
        try{
           PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                Location lc;
                String id, name;
                id = String.valueOf(rs.getInt("Location_id"));
                name = rs.getString("Location_name");
                lc = new Location(id, name);
                data.add(lc);
            }
        }catch (SQLException e){
            System.out.println("e");
        }
        return data;
    }
    public static void main(String[] args) {
        LocationDAO d = new LocationDAO();
        List<Location> listL = d.getALLLocation();
        for (Location o : listL) {
            System.out.println(o);
            
        }
    }
    public Location getLocationById(String locationId) {

        String sql = "SELECT [Location_id]\n"
                + "      ,[Location_name]\n"
                + "  FROM [dbo].[Location]"
                + " Where Location_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, locationId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id, name;
                id = String.valueOf(rs.getInt("Location_id"));
                name = rs.getString("Location_name");
                Location l = new Location(id, name);
                return l;
            }
        } catch (SQLException e) {
            System.out.println("e");
        }
        return null;
    
}
}
