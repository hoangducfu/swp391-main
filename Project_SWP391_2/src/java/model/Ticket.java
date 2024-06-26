/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nguye
 */
public class Ticket {

    private String tickID, status, eventID, booking_detail_ID, areaID, price;

    public Ticket() {
    }

    public Ticket(String tickID, String status, String eventID, String booking_detail_ID, String areaID, String price) {
        this.tickID = tickID;
        this.status = status;
        this.eventID = eventID;
        this.booking_detail_ID = booking_detail_ID;
        this.areaID = areaID;
        this.price = price;
    }

    public String getTickID() {
        return tickID;
    }

    public void setTickID(String tickID) {
        this.tickID = tickID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEventID() {
        return eventID;
    }

    public void setEventID(String eventID) {
        this.eventID = eventID;
    }

    public String getBooking_detail_ID() {
        return booking_detail_ID;
    }

    public void setBooking_detail_ID(String booking_detail_ID) {
        this.booking_detail_ID = booking_detail_ID;
    }

    public String getAreaID() {
        return areaID;
    }

    public void setAreaID(String areaID) {
        this.areaID = areaID;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Ticket{" + "tickID=" + tickID + ", status=" + status + ", eventID=" + eventID + ", booking_detail_ID=" + booking_detail_ID + ", areaID=" + areaID + ", price=" + price + '}';
    }

}
