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
                + "           ,[EventID]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,0)\n";
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
                + "      ,[Status]\n"
                + "  FROM [dbo].[Promotion]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount dis;
                String id, code, quantity, discountPercent, eventID, status;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                discountPercent = String.valueOf(rs.getInt("DiscountPercent"));
                eventID = String.valueOf(rs.getInt("EventID"));
                status = String.valueOf(rs.getInt("Status"));
                dis = new Discount(id, code, quantity, discountPercent, eventID, status);
                listD.add(dis);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listD;
    }

    public void updateStatusDiscountById(String id, String status) {
        String sql = "UPDATE [dbo].[Promotion]\n"
                + "   SET [Status] = ? where id = ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setString(2, id);
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
                + "      ,[Status]\n"
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
                + "WHERE [code] like ? and Status = 0 ";
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
        String sql = "SELECT id FROM Promotion WHERE code = ? AND EventID = ? and quantity >0 and Status =0";
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
                + "      ,[Status]\n"
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
        String sql = "SELECT [id]\n"
                + "      ,[code]\n"
                + "      ,[quantity]\n"
                + "      ,[DiscountPercent]\n"
                + "      ,[EventID]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Promotion]\n"
                + "  WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, did);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id, code, quantity, DiscountPercent, EventID, status;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                DiscountPercent = String.valueOf(rs.getInt("DiscountPercent"));
                EventID = String.valueOf(rs.getInt("EventID"));
                status = String.valueOf(rs.getInt("Status"));
                Discount d = new Discount(id, code, quantity, DiscountPercent, EventID, status);
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
                + "      ,[Status]\n"
                + "  FROM [dbo].[Promotion]\n"
                + "  WHERE [EventID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, eventId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id, code, quantity, DiscountPercent, EventID, status;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                DiscountPercent = String.valueOf(rs.getInt("DiscountPercent"));
                EventID = String.valueOf(rs.getInt("EventID"));
                status = String.valueOf(rs.getInt("Status"));
                Discount d = new Discount(id, code, quantity, DiscountPercent, EventID, status);
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

        d.updateQuantityPromotion("8", "duc12345");
//        d.addDisscount(testCode, testQuantity, testDiscountPercent, testEventId);
//        System.out.println(testCode);
//        boolean isDiscountCodeValid = d.checkDiscountForEvent("TEST123", "1");
//        if (isDiscountCodeValid) {
//            System.out.println("success");
//        } else {
//            System.out.println("faild");
        
    }

    public List<Discount> getDiscountByStaffId(String staffId) {
        List<Discount> discount = new ArrayList<>();

        String sql = "Select * from Promotion p \n"
                + "                join Event e on\n"
                + "                p.EventID = e.EventID \n"
                + "               where e.StaffID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, staffId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id, code, quantity, DiscountPercent, EventID, status;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                DiscountPercent = String.valueOf(rs.getInt("DiscountPercent"));
                EventID = String.valueOf(rs.getInt("EventID"));
                status = String.valueOf(rs.getInt("Status"));
                Discount d = new Discount(id, code, quantity, DiscountPercent, EventID, status);
                discount.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("err: " + e.getMessage());
        }
        return discount;

    }

    public List<Discount> getDiscountBySearch(String keyword) {
        List<Discount> discount = new ArrayList<>();

        String sql = "Select * from Promotion p \n"
                + "                join Event e on\n"
                + "                p.EventID = e.EventID \n"
                + "                where e.Eventname like N'%" + keyword + "%' or p.code like '%" + keyword + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id, code, quantity, DiscountPercent, EventID, status;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                DiscountPercent = String.valueOf(rs.getInt("DiscountPercent"));
                EventID = String.valueOf(rs.getInt("EventID"));
                status = String.valueOf(rs.getInt("Status"));
                Discount d = new Discount(id, code, quantity, DiscountPercent, EventID, status);
                discount.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("err: " + e.getMessage());
        }
        return discount;
    }

    public List<Discount> getDiscountBySearchAndStaffId(String sid, String keyword) {
        List<Discount> discount = new ArrayList<>();

        String sql = "Select * from Promotion p \n"
                + "                join Event e on\n"
                + "                p.EventID = e.EventID \n"
                + "                where ( e.Eventname like N'%" + keyword + "%' or p.code like '%" + keyword + "%') and e.StaffID =? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, sid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id, code, quantity, DiscountPercent, EventID, status;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                DiscountPercent = String.valueOf(rs.getInt("DiscountPercent"));
                EventID = String.valueOf(rs.getInt("EventID"));
                status = String.valueOf(rs.getInt("Status"));
                Discount d = new Discount(id, code, quantity, DiscountPercent, EventID, status);
                discount.add(d);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("err: " + e.getMessage());
        }
        return discount;
    }

    public List<Discount> getALLDiscountForCustomer() {
        List<Discount> listD = new ArrayList<>();
        String sql = "SELECT * FROM \n"
                + "    Event e JOIN  Promotion p ON e.EventID = p.EventID \n"
                + "		where  p.Status = 0 and e.StatusDisable =0\n"
                + "	order by e.TimeStart asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount dis;
                String id, code, quantity, discountPercent, eventID, status;
                id = String.valueOf(rs.getInt("id"));
                code = rs.getString("code");
                quantity = String.valueOf(rs.getInt("quantity"));
                discountPercent = String.valueOf(rs.getInt("DiscountPercent"));
                eventID = String.valueOf(rs.getInt("EventID"));
                status = String.valueOf(rs.getInt("Status"));
                dis = new Discount(id, code, quantity, discountPercent, eventID, status);
                listD.add(dis);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listD;
    }

    public void updateQuantityPromotion(String event_id_raw, String discountCode) {
        String sql = "UPDATE Promotion\n"
                + "    SET quantity = quantity - 1\n"
                + "    WHERE EventID = ? AND code = ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, event_id_raw);
            st.setString(2, discountCode);
            st.executeUpdate();
            return;
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return;
    }

    
}
