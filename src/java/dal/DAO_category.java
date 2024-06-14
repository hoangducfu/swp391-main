/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class DAO_category  extends DBContext{
    public List<Category> getAll(){
        List<Category> list = new ArrayList<>();
        String sql="select * from Category";
        try {
              PreparedStatement st = connection.prepareStatement(sql);
              ResultSet rs = st.executeQuery();
              while(rs.next()){
               Category c = new Category(rs.getInt("CategoryID"), rs.getString("Categoryname"));
               list.add(c);
              }
        } catch (SQLException e) {
            Category s= new Category(00, "erro");
            list.add(s);
        }
        
    return list;
    }
}
