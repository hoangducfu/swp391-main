/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author mactu
 */
public class Account {
    private String id, username, password, phone,dob,statusGoogle,roleid,passwordStatus;

    public Account() {
    }

    public Account(String username) {
        this.username = username;
    }
    

    public Account(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Account(String username, String password, String roleid) {
        this.username = username;
        this.password = password;
        this.roleid = roleid;
    }

    public Account(String id, String username, String password, String phone, String dob, String statusGoogle, String roleid, String passwordStatus) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.dob = dob;
        this.statusGoogle = statusGoogle;
        this.roleid = roleid;
        this.passwordStatus = passwordStatus;
    }

   

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getStatusGoogle() {
        return statusGoogle;
    }

    public void setStatusGoogle(String statusGoogle) {
        this.statusGoogle = statusGoogle;
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }

    public String getPasswordStatus() {
        return passwordStatus;
    }

    public void setPasswordStatus(String passwordStatus) {
        this.passwordStatus = passwordStatus;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", username=" + username + ", password=" + password + ", phone=" + phone + ", dob=" + dob + ", statusGoogle=" + statusGoogle + ", roleid=" + roleid + ", passwordStatus=" + passwordStatus + '}';
    }
    
    

    
}
