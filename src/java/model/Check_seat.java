/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author mactu
 */
public class Check_seat {
    private String event_id, seat_id;

    public Check_seat() {
    }

    public String getEvent_id() {
        return event_id;
    }

    public void setEvent_id(String event_id) {
        this.event_id = event_id;
    }

    public String getSeat_id() {
        return seat_id;
    }

    public void setSeat_id(String seat_id) {
        this.seat_id = seat_id;
    }

    public Check_seat(String event_id, String seat_id) {
        this.event_id = event_id;
        this.seat_id = seat_id;
    }
    
    
}
