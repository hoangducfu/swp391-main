/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Pc
 */
public class Booking_detail {
    private String Booking_detail_ID,Quantity,Unit_price,Subtotal,BookingID;

    public Booking_detail() {
    }

    public Booking_detail(String Booking_detail_ID, String Quantity, String Unit_price, String Subtotal, String BookingID) {
        this.Booking_detail_ID = Booking_detail_ID;
        this.Quantity = Quantity;
        this.Unit_price = Unit_price;
        this.Subtotal = Subtotal;
        this.BookingID = BookingID;
    }

    public String getBooking_detail_ID() {
        return Booking_detail_ID;
    }

    public void setBooking_detail_ID(String Booking_detail_ID) {
        this.Booking_detail_ID = Booking_detail_ID;
    }

    public String getQuantity() {
        return Quantity;
    }

    public void setQuantity(String Quantity) {
        this.Quantity = Quantity;
    }

    public String getUnit_price() {
        return Unit_price;
    }

    public void setUnit_price(String Unit_price) {
        this.Unit_price = Unit_price;
    }

    public String getSubtotal() {
        return Subtotal;
    }

    public void setSubtotal(String Subtotal) {
        this.Subtotal = Subtotal;
    }

    public String getBookingID() {
        return BookingID;
    }

    public void setBookingID(String BookingID) {
        this.BookingID = BookingID;
    }
    
}
