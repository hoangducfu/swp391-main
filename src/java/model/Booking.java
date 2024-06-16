/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Pc
 */
public class Booking {

    private int bookingId;
    private Date bookingDate;
    private String status;
    private double totalAmount;
    private int eventId;
    private int accountId;
    private String name;
    private String phone;
    private String address;
    private String email;

    public Booking() {
    }

    public Booking(int bookingId, Date bookingDate, String status, double totalAmount, int eventId, int accountId, String name, String phone, String address, String email) {
        this.bookingId = bookingId;
        this.bookingDate = bookingDate;
        this.status = status;
        this.totalAmount = totalAmount;
        this.eventId = eventId;
        this.accountId = accountId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }
    
     public Booking(Date bookingDate, String status, double totalAmount, int eventId, int accountId, String name, String phone, String address, String email) {
        this.bookingDate = bookingDate;
        this.status = status;
        this.totalAmount = totalAmount;
        this.eventId = eventId;
        this.accountId = accountId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

   

}
