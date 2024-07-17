/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hoangduc
 */
public class Customer {

    private String id, username, password, phone, dob, statusGoogle, passwordStatus, banStatus;
    private String type = "customer";
    public Customer(String id, String username, String password, String phone, String dob, String statusGoogle, String passwordStatus, String banStatus) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.dob = dob;
        this.statusGoogle = statusGoogle;
        this.passwordStatus = passwordStatus;
        this.banStatus = banStatus;
    }

    public Customer(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Customer(String username) {
        this.username = username;
    }
    
    

    public Customer() {
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

    public String getPasswordStatus() {
        return passwordStatus;
    }

    public void setPasswordStatus(String passwordStatus) {
        this.passwordStatus = passwordStatus;
    }

    public String getBanStatus() {
        return banStatus;
    }

    public void setBanStatus(String banStatus) {
        this.banStatus = banStatus;
    }

    public String getType() {
        return type;
    }
    
    
    @Override
    public String toString() {
        return "Customer{" + "id=" + id + ", username=" + username + ", password=" + password + ", phone=" + phone + ", dob=" + dob + ", statusGoogle=" + statusGoogle + ", passwordStatus=" + passwordStatus + ", banStatus=" + banStatus + '}';
    }
    

}
