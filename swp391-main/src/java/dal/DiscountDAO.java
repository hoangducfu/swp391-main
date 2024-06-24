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
import model.Discount;

/**
 *
 * @author Admin
 */
public class DiscountDAO extends DBContext{
 public boolean addDiscount(String code, String quantity) {
        String sql = "INSERT INTO [dbo].[Promotion]\n"
                + "           ([code]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            st.setString(2, quantity);
            st.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("err" + e.getMessage());
        }
        return false;
    }

    public List<Discount> getALLDiscount() {
        List<Discount> listD = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[code]\n"
                + "      ,[quantity]\n"
                + "  FROM [dbo].[Promotion]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount dis;
                String id, code, quantity;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                dis = new Discount(id, code, quantity);
                listD.add(dis);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listD;
    }

    public boolean  checkDiscountByCode(String code) {
        String sql = "SELECT [id]\n"
                + "      ,[code]\n"
                + "      ,[quantity]\n"
                + "  FROM [dbo].[Promotion] "
                + "WHERE [code] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
             st.setString(1, code);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return true;
            }
        }catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        List<Discount> listD = new ArrayList<>();
        DiscountDAO d = new DiscountDAO();
        
//        if(d.checkDiscountByCode("ABC123")){
//            System.out.println("123");
//        }
//        listD = d.getALLDiscount();
//        String testcode = "Happy";
//        String testquantity = "20";
//        boolean isAdd = d.addDiscount(testcode, testquantity);
//
//        if (isAdd) {
//            System.out.println("success");
//
//        } else {
//            System.out.println("failed");
//        }
////
        listD = d.getALLDiscount();
        for (Discount o : listD) {
            System.out.println(o);
        }

    }

}
