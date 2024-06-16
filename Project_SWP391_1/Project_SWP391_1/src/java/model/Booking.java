/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Pc
 */
public class Booking {
    private String BookingID,Booking_date,Status,Total_amount,EventID,AccountID;

    public Booking() {
    }

    public Booking(String BookingID, String Booking_date, String Status, String Total_amount, String EventID, String AccountID) {
        this.BookingID = BookingID;
        this.Booking_date = Booking_date;
        this.Status = Status;
        this.Total_amount = Total_amount;
        this.EventID = EventID;
        this.AccountID = AccountID;
    }

    public String getBookingID() {
        return BookingID;
    }

    public void setBookingID(String BookingID) {
        this.BookingID = BookingID;
    }

    public String getBooking_date() {
        return Booking_date;
    }

    public void setBooking_date(String Booking_date) {
        this.Booking_date = Booking_date;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getTotal_amount() {
        return Total_amount;
    }

    public void setTotal_amount(String Total_amount) {
        this.Total_amount = Total_amount;
    }

    public String getEventID() {
        return EventID;
    }

    public void setEventID(String EventID) {
        this.EventID = EventID;
    }

    public String getAccountID() {
        return AccountID;
    }

    public void setAccountID(String AccountID) {
        this.AccountID = AccountID;
    }
    
    
}
