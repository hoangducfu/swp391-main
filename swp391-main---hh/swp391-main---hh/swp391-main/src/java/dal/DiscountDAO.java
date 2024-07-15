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
public class DiscountDAO extends DBContext {

    public boolean addDisscount(String code, String quantity, String DiscountPercent, String EventID) {
        String sql = "INSERT INTO [dbo].[Promotion]\n"
                + "           ([code]\n"
                + "           ,[quantity]\n"
                + "           ,[DiscountPercent]\n"
                + "           ,[EventID])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            st.setString(2, quantity);
            st.setString(3, DiscountPercent);
            st.setString(4, EventID);
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
                + "      ,[DiscountPercent]\n"
                + "      ,[EventID]\n"
                + "  FROM [dbo].[Promotion]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount dis;
                String id, code, quantity, DiscountPercent, EventID;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                DiscountPercent = String.valueOf(rs.getInt("DiscountPercent"));
                EventID = String.valueOf(rs.getInt("EventID"));
                dis = new Discount(id, code, quantity, DiscountPercent, EventID);
                listD.add(dis);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listD;
    }

    public void deleteDiscountById(String id) {
        String sql = "delete from Promotion where id = ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
            return;
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return;

    }

// 
    public boolean checkDiscountByCode(String code) {
        String sql = "SELECT [id]\n"
                + "      ,[code]\n"
                + "      ,[quantity]\n"
                + "      ,[DiscountPercent]\n"
                + "      ,[EventID]\n"
                + "  FROM [dbo].[Promotion] "
                + "WHERE [code] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public int getPercentByCode(String code) {
        String sql = "SELECT [DiscountPercent]\n"
                + "  FROM [dbo].[Promotion]"
                + "WHERE [code] like ? ";
        int discountPercent = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                discountPercent = rs.getInt("DiscountPercent");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("err" + e.getMessage());
        }
        return discountPercent;
    }

    public boolean checkDiscountForEvent(String code, String eventId) {
        String sql = "SELECT id FROM Promotion WHERE code = ? AND EventID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            st.setString(2, eventId);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void getDiscountById(String id) {
        String sql = "SELECT [id]\n"
                + "      ,[code]\n"
                + "      ,[quantity]\n"
                + "      ,[DiscountPercent]\n"
                + "      ,[EventID]\n"
                + "  FROM [dbo].[Promotion]\n"
                + "  WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.executeUpdate();
            return;
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return;
    }

    public Discount getDiscountId(String did) {
        String sql = "SELECT [id], [code], [quantity], [DiscountPercent], [EventID] FROM [dbo].[Promotion] WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, did);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id, code, quantity, DiscountPercent, EventID;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                DiscountPercent = String.valueOf(rs.getInt("DiscountPercent"));
                EventID = String.valueOf(rs.getInt("EventID"));
                Discount d = new Discount(id, code, quantity, DiscountPercent, EventID);
                return d;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("err: " + e.getMessage());
        }
        return null;
    }

    public List<Discount> getDiscountByEventId(String eventId) {
        List<Discount> discounts = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[code]\n"
                + "      ,[quantity]\n"
                + "      ,[DiscountPercent]\n"
                + "      ,[EventID]\n"
                + "  FROM [dbo].[Promotion]\n"
                + "  WHERE [EventID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eventId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id, code, quantity, DiscountPercent, EventID;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                DiscountPercent = String.valueOf(rs.getInt("DiscountPercent"));
                EventID = String.valueOf(rs.getInt("EventID"));
                Discount d = new Discount(id, code, quantity, DiscountPercent, EventID);
                discounts.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("err: " + e.getMessage());
        }
        return discounts;

    }

    public static void main(String[] args) {
        List<Discount> listD = new ArrayList<>();
        DiscountDAO d = new DiscountDAO();

//        listD = d.getALLDiscount();
//        for (Discount o : listD) {
//            System.out.println(o);
        String testCode = "TEST123";
        String testQuantity = "100";
        String testDiscountPercent = "20";
        String testEventId = "1";

        d.addDisscount(testCode, testQuantity, testDiscountPercent, testEventId);
        System.out.println(testCode);
        boolean isDiscountCodeValid = d.checkDiscountForEvent("TEST123", "1");
        if (isDiscountCodeValid) {
            System.out.println("success");
        } else {
            System.out.println("faild");
        }
    }
    

    
    public List<Discount> getDiscountByStaffId(String staffId) {
        List<Discount> discount = new ArrayList<>();

        String sql = "Select e.Eventname from Promotion p \n"
                + "join Event e on\n"
                + "p.EventID = e.EventID \n"
                + "where e.StaffID = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, staffId);
            ResultSet rs = st.executeQuery();
             while (rs.next()) {
                String id, code, quantity, DiscountPercent, EventID;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                DiscountPercent = String.valueOf(rs.getInt("DiscountPercent"));
                EventID = String.valueOf(rs.getInt("EventID"));
                Discount d = new Discount(id, code, quantity, DiscountPercent, EventID);
                discount.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("err: " + e.getMessage());
        }
        return discount;
        
    
}
}

