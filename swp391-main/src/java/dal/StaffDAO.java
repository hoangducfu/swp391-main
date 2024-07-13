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
import model.Staff;

/**
 *
 * @author hoangduc
 */
public class StaffDAO extends DBContext {

    // username là email
    public boolean checkStaffExist(String username, String password) {
        String sql = "SELECT [StaffID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "      ,[roleId]\n"
                + "  FROM [dbo].[Staff] \n"
                + "	where username =? and password =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;

    }

    public boolean checkStaffExist(String username) {
        String sql = "SELECT [StaffID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "      ,[roleId]\n"
                + "  FROM [dbo].[Staff] \n"
                + "  where username =? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean setPassWordAccount(String username, String password, String statusPassword) {
        String sql = "UPDATE [dbo].[Staff]\n"
                + "   SET[password] = ?      \n"
                + "      ,[passwordStatus] = ? \n"
                + " WHERE username =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, statusPassword);
            st.setString(3, username);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return false;
    }

    public boolean checkStatusPassword(String email) {
        String sql = "SELECT [StaffID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "      ,[roleId]\n"
                + "  FROM [dbo].[Staff] \n"
                + "  where username = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getBoolean("passwordStatus")) {
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;

    }

    public static void main(String[] args) {
        StaffDAO d = new StaffDAO();
        Staff s = d.getStaffByUsername("hoangvietduc190602@gmail.com");
        System.out.println(s);
    }

    public Staff getStaffByUsername(String email) {

        String sql = "SELECT [StaffID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "      ,[roleId]\n"
                + "  FROM [dbo].[Staff] \n"
                + "  where username = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id, username, password, phone, dob, passwordStatus, banStatus, roleId;
                //        private String id, username, password, phone, dob, passwordStatus, banStatus,roleId;

                id = String.valueOf(rs.getInt("StaffID"));
                username = rs.getString("username");
                password = rs.getString("password");
                phone = rs.getString("phoneNumber");
                dob = String.valueOf(rs.getDate("birthdate"));
                roleId = String.valueOf(rs.getInt("roleId"));
                passwordStatus = String.valueOf(rs.getBoolean("passwordStatus"));
                banStatus = String.valueOf(rs.getBoolean("banStatus"));
                Staff staff = new Staff(id, username, password, phone, dob, passwordStatus, banStatus, roleId);
                return staff;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean setProfile(String password, String phone, String dob, String username) {
        StringBuilder sql = new StringBuilder("UPDATE [dbo].[Staff] SET ");
        boolean first = true;

        if (password != null && !password.isEmpty()) {
            sql.append("[password] = ?");
            first = false;
        }
        if (phone != null && !phone.isEmpty()) {
            if (!first) {
                sql.append(", ");
            }
            sql.append("[phoneNumber] = ?");
            first = false;
        }
        if (dob != null && !dob.isEmpty()) {
            if (!first) {
                sql.append(", ");
            }
            sql.append("[birthdate] = ?");
        }

        sql.append(" WHERE [username] = ?");

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());

            int index = 1;
            if (password != null && !password.isEmpty()) {
                st.setString(index++, password);
            }
            if (phone != null && !phone.isEmpty()) {
                st.setString(index++, phone);
            }
            if (dob != null && !dob.isEmpty()) {
                st.setString(index++, dob);
            }
            st.setString(index, username);

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Staff> getAllListAccountStaff() {
        List<Staff> data = new ArrayList<>();
        String sql = " SELECT [StaffID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "      ,[roleId]\n"
                + "  FROM [dbo].[Staff]\n"
                + "		where roleId =2 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id, username, password, phone, dob, passwordStatus, banStatus, roleId;
                //        private String id, username, password, phone, dob, passwordStatus, banStatus,roleId;

                id = String.valueOf(rs.getInt("StaffID"));
                username = rs.getString("username");
                password = rs.getString("password");
                phone = rs.getString("phoneNumber");
                dob = String.valueOf(rs.getDate("birthdate"));
                roleId = String.valueOf(rs.getInt("roleId"));
                passwordStatus = String.valueOf(rs.getBoolean("passwordStatus"));
                banStatus = String.valueOf(rs.getBoolean("banStatus"));
                Staff staff = new Staff(id, username, password, phone, dob, passwordStatus, banStatus, roleId);
                data.add(staff);
                }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return data;
    }

}
