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
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> listC = new ArrayList<>();
        String sql = "SELECT [CategoryID]\n"
                + "      ,[Categoryname]\n"
                + "  FROM [BookingTicket].[dbo].[Category]";
        try{
             PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category cate;
                String id, name;
                id = String.valueOf(rs.getInt("CategoryID"));
                name = rs.getString("Categoryname");
                cate = new Category(id, name);
                listC.add(cate);
            }
        }catch (SQLException e){
            System.out.println("e");
        }
        return listC;
    }
    
    public List<Category> getCategoryByName(String name){
        List<Category> listC = new ArrayList<>();
        String sql = "Select * from Category where Categoryname like ?";
         try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" +name+"%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category cate;
              String id = String.valueOf(rs.getInt("CategoryID"));
                name = rs.getString("Categoryname");
                cate = new Category(id, name);
                listC.add(cate);
            }
        }catch (SQLException e){
            System.out.println("e");
        }
        return listC;
    }
    
    public static void main(String[] args) {
        CategoryDAO d = new CategoryDAO();
        List<Category> listC = d.getAllCategory();
        
        List<Category> listF = d.getCategoryByName("Talkshow");
        
        for (Category o : listC) {
            System.out.println(o);
            
        }
    }
}