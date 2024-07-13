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
import model.Customer;

/**
 *
 * @author hoangduc
 */
public class CustomerDAO extends DBContext {

    public boolean checkCustomerExistWithGoogle(String mailUser) {
        String sql = "SELECT *  FROM [dbo].[Customer] where username =? and GoogleStatus =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, mailUser);
            // kiem tra tai khoan nay co phai dang nhap bang gg hay k
            st.setInt(2, 1);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean addCustomerGoogle(String email) {
        String sql = "INSERT INTO [dbo].[Customer]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[phoneNumber]\n"
                + "           ,[birthdate]\n"
                + "           ,[GoogleStatus]\n"
                + "           ,[passwordStatus]\n"
                + "           ,[banStatus])\n"
                + "     VALUES\n"
                + "           (?,null,null,null,1,0,0)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return false;
    }

    // username là email
    public boolean checkCustomerExist(String username, String password) {
        String sql = "SELECT [CustomerID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[GoogleStatus]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "  FROM [dbo].[Customer] \n"
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

    public boolean checkCustomerExist(String username) {
        String sql = "SELECT [CustomerID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[GoogleStatus]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "  FROM [dbo].[Customer] \n"
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

    //add account by signup
    public boolean addCustomer(String username, String password, String passwordStatus, String banStatus) {
        // 0 là k liên kết với gg, 2 là customer
        String sql = "INSERT INTO [dbo].[Customer]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[phoneNumber]\n"
                + "           ,[birthdate]\n"
                + "           ,[GoogleStatus]\n"
                + "           ,[passwordStatus]\n"
                + "           ,[banStatus])\n"
                + "     VALUES\n"
                + "           (?,?,null,null,0,?,?)   ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, passwordStatus);
            st.setString(4, banStatus);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return false;
    }

    public boolean setCustomerStatusWithGoogle(String mailUser) {
        String sql = "UPDATE [dbo].[Customer] \n"
                + "   SET [GoogleStatus] = 1\n"
                + " WHERE username =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, mailUser);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
            System.out.println("err: " + e.getMessage());
        }
        return false;
    }

    // 1 là mật khẩu mới chưa được cập nhật
    public boolean setPassWordAccount(String username, String password, String statusPassword) {
        String sql = "UPDATE [dbo].[Customer]\n"
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
    
    //false
//    public List<Customer> getAllListAccountStaff() {
//        List<Customer> data = new ArrayList<>();
//        String sql = "SELECT [accountID]\n"
//                + "      ,[username]\n"
//                + "      ,[password]\n"
//                + "      ,[phoneNumber]\n"
//                + "      ,[birthdate]\n"
//                + "      ,[GoogleStatus]\n"
//                + "      ,[roleId]\n"
//                + "      ,[passwordStatus]\n"
//                + "  FROM [dbo].[Account]\n"
//                + "	where roleId = 2  ";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Account acc;
//                String id, username, password, phone, dob, statusGoogle, roleid, passwordStatus;
//                id = String.valueOf(rs.getInt("accountID"));
//                username = rs.getString("username");
//                password = rs.getString("password");
//                phone = rs.getString("phoneNumber");
//                dob = String.valueOf(rs.getDate("birthdate"));
//                statusGoogle = String.valueOf(rs.getBoolean("GoogleStatus"));
//                roleid = String.valueOf(rs.getInt("roleId"));
//                passwordStatus = String.valueOf(rs.getBoolean("passwordStatus"));
//                acc = new Account(id, username, password, phone, dob, statusGoogle, roleid, passwordStatus);
//                data.add(acc);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return data;
//    }
//
//    public List<Account> getAllListAccountCustomer() {
//        List<Account> data = new ArrayList<>();
//        String sql = "SELECT [accountID]\n"
//                + "      ,[username]\n"
//                + "      ,[password]\n"
//                + "      ,[phoneNumber]\n"
//                + "      ,[birthdate]\n"
//                + "      ,[GoogleStatus]\n"
//                + "      ,[roleId]\n"
//                + "      ,[passwordStatus]\n"
//                + "  FROM [dbo].[Account]\n"
//                + "	where roleId = 3  ";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Customer acc;
//                String id, username, password, phone, dob, statusGoogle, roleid, passwordStatus;
//                id = String.valueOf(rs.getInt("accountID"));
//                username = rs.getString("username");
//                password = rs.getString("password");
//                phone = rs.getString("phoneNumber");
//                dob = String.valueOf(rs.getDate("birthdate"));
//                statusGoogle = String.valueOf(rs.getBoolean("GoogleStatus"));
//                passwordStatus = String.valueOf(rs.getBoolean("passwordStatus"));
//                roleid = String.valueOf(rs.getInt("roleId"));
//
//                acc = new Account(id, username, password, phone, dob, statusGoogle, roleid, passwordStatus);
//                data.add(acc);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return data;
//    }
//
//    public List<Account> getAllListAccountCustomerByName(String name) {
//        List<Account> data = new ArrayList<>();
//        String sql = "SELECT [accountID]\n"
//                + "      ,[username]\n"
//                + "      ,[password]\n"
//                + "      ,[phoneNumber]\n"
//                + "      ,[birthdate]\n"
//                + "      ,[GoogleStatus]\n"
//                + "      ,[roleId]\n"
//                + "      ,[passwordStatus]\n"
//                + "  FROM [dbo].[Account]]\n"
//                + "	where roleId = 3  ";
//        if (name != null && name != "") {
//            sql += " and username like '%" + name + "%'";
//        }
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Account acc;
//                String id, username, password, phone, dob, statusGoogle, roleid, passwordStatus;
//                id = String.valueOf(rs.getInt("accountID"));
//                username = rs.getString("username");
//                password = rs.getString("password");
//                phone = rs.getString("phoneNumber");
//                dob = String.valueOf(rs.getDate("birthdate"));
//                statusGoogle = String.valueOf(rs.getBoolean("GoogleStatus"));
//                passwordStatus = String.valueOf(rs.getBoolean("passwordStatus"));
//                roleid = String.valueOf(rs.getInt("roleId"));
//                acc = new Account(id, username, password, phone, dob, statusGoogle, roleid, passwordStatus);
//                data.add(acc);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return data;
//    }
//
//    public List<Account> getAllListAccountStaffByName(String name) {
//        List<Account> data = new ArrayList<>();
//        String sql = "SELECT [accountID]\n"
//                + "      ,[username]\n"
//                + "      ,[password]\n"
//                + "      ,[phoneNumber]\n"
//                + "      ,[birthdate]\n"
//                + "      ,[GoogleStatus]\n"
//                + "      ,[roleId]\n"
//                + "      ,[passwordStatus]\n"
//                + "  FROM [dbo].[Account]\n"
//                + "	where roleId = 2  ";
//        if (name != null && name != "") {
//            sql += " and username like '%" + name + "%'";
//        }
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Account acc;
//                String id, username, password, phone, dob, statusGoogle, roleid, passwordStatus;
//                id = String.valueOf(rs.getInt("accountID"));
//                username = rs.getString("username");
//                password = rs.getString("password");
//                phone = rs.getString("phoneNumber");
//                dob = String.valueOf(rs.getDate("birthdate"));
//                statusGoogle = String.valueOf(rs.getBoolean("GoogleStatus"));
//                passwordStatus = String.valueOf(rs.getBoolean("passwordStatus"));
//                roleid = String.valueOf(rs.getInt("roleId"));
//                acc = new Account(id, username, password, phone, dob, statusGoogle, roleid, passwordStatus);
//                data.add(acc);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return data;
//    }

//    public String getRoleId(String mailUser) {
//        String sql = "SELECT [accountID]\n"
//                + "      ,[username]\n"
//                + "      ,[password]\n"
//                + "      ,[phoneNumber]\n"
//                + "      ,[birthdate]\n"
//                + "      ,[GoogleStatus]\n"
//                + "      ,[roleId]\n"
//                + "      ,[passwordStatus]\n"
//                + "  FROM [dbo].[Account] \n"
//                + "	where username = ?  ";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, mailUser);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                return String.valueOf(rs.getInt("roleId"));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
    // add account by admin
//    public boolean addAccount(String email, String password, String phone, String dob, String position, String passwordStatus) {
//        String sql = "INSERT INTO [dbo].[Account]\n"
//                + "           ([username]\n"
//                + "           ,[password]\n"
//                + "           ,[phoneNumber]\n"
//                + "           ,[birthdate]\n"
//                + "           ,[GoogleStatus]\n"
//                + "           ,[roleId]\n"
//                + "           ,[passwordStatus])\n"
//                + "     VALUES\n"
//                + "           (?,?,?,?,0,?,?)   ";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, email);
//            st.setString(2, password);
//            st.setString(3, phone);
//            st.setString(4, dob);
//            st.setString(5, position);
//            st.setString(6, passwordStatus);
//            st.executeUpdate();
//            return true;
//        } catch (SQLException e) {
//            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
//            System.out.println("err: " + e.getMessage());
//        }
//        return false;
//    }
//
//    public void deleteAccountById(String id) {
//        String sql = "DELETE FROM [dbo].[Account]\n"
//                + "      WHERE accountID = ?   ";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, id);
//            st.executeUpdate();
//            return;
//        } catch (SQLException e) {
//            e.printStackTrace(); // In ra toàn bộ dấu vết ngăn xếp
//            System.out.println("err: " + e.getMessage());
//        }
//        return;
//    }
//
//    public String getIdByUsername(String username) {
//        String sql = "SELECT [accountID]\n"
//                + "      ,[username]\n"
//                + "      ,[password]\n"
//                + "      ,[phoneNumber]\n"
//                + "      ,[birthdate]\n"
//                + "      ,[GoogleStatus]\n"
//                + "      ,[roleId]\n"
//                + "      ,[passwordStatus]\n"
//                + "  FROM [dbo].[Account]\n"
//                + "	where username = ?  ";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, username);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                return String.valueOf(rs.getInt("roleId"));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }

   

    public boolean checkStatusPassword(String email) {
        String sql = "SELECT [CustomerID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[GoogleStatus]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "  FROM [dbo].[Customer]\n"
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

    public Customer getCustomerByUsername(String email) {

        String sql = "SELECT [CustomerID]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[birthdate]\n"
                + "      ,[GoogleStatus]\n"
                + "      ,[passwordStatus]\n"
                + "      ,[banStatus]\n"
                + "  FROM [dbo].[Customer] \n"
                + "  where username = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String id, username, password, phone, dob, statusGoogle, passwordStatus, banStatus;
                id = String.valueOf(rs.getInt("CustomerID"));
                username = rs.getString("username");
                password = rs.getString("password");
                phone = rs.getString("phoneNumber");
                dob = String.valueOf(rs.getDate("birthdate"));
                statusGoogle = String.valueOf(rs.getBoolean("GoogleStatus"));
                passwordStatus = String.valueOf(rs.getBoolean("passwordStatus"));
                banStatus = String.valueOf(rs.getBoolean("banStatus"));
                Customer cus = new Customer(id, username, password, phone, dob, statusGoogle, passwordStatus, banStatus);
                return cus;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean setProfile(String password, String phone, String dob, String username) {
        StringBuilder sql = new StringBuilder("UPDATE [dbo].[Customer] SET ");
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
     public static void main(String[] args) {
        CustomerDAO d = new CustomerDAO();
        d.setProfile(null, "1234567890", null, "hoangvietduc19602@gmail.com");
//        d.addCustomer("hoangvietduc19602@gmail.com", "96db4c126abc7bc183e2f338bb86a337", "0", "0");
    }
}
