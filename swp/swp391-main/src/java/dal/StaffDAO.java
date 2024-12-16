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
//        Staff s = d.getStaffByUsername("hoangvietduc190602@gmail.com");
//        System.out.println(s);
//        List<Staff> data = new ArrayList<>();
//        data = d.getAllListAccountStaffByName("duc");
//        for (Staff staff : data) {
//            System.out.println(staff);
//        }
    String a = d.getEmailAdmin();
        System.out.println(a);
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
                + "  FROM [dbo].[Staff] \n"
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

    public List<Staff> getAllListAccountStaffByName(String name) {
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
                + "		where roleId = 2 ";
        if (name != null) {
            sql += " and username like '%" + name + "%'";
        }
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

    public void addAccount(String email, String passwordmd5, String phoneNumber, String birthdate) {
        String sql = "INSERT INTO [dbo].[Staff]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[phoneNumber]\n"
                + "           ,[birthdate]\n"
                + "           ,[passwordStatus]\n"
                + "           ,[banStatus]\n"
                + "           ,[roleId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,1,0,2)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, passwordmd5);
            st.setString(3, phoneNumber);
            st.setString(4, birthdate);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
    }

    public void banStaffById(String id) {
        String sql = "UPDATE [dbo].[Staff]\n"
                + "   SET [banStatus] = 1    \n"
                + " WHERE [StaffID] =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return;
    }

    public boolean checkStaffBan(String email) {
        String sql = "SELECT [StaffID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "      ,[roleId]\n"
                + "  FROM [dbo].[Staff] \n"
                + "	where username =? and banStatus = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void unbanStaffById(String id) {
        String sql = "UPDATE [dbo].[Staff]\n"
                + "   SET [banStatus] = 0    \n"
                + " WHERE [StaffID] =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return;
    }

    public String getEmailAdmin() {
        String sql = "SELECT [StaffID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "      ,[roleId]\n"
                + "  FROM [dbo].[Staff] \n"
                + "	where  roleId = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                return username;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
