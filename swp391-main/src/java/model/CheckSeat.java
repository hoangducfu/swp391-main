/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hoangduc
 */
public class CheckSeat {
        private String check_seat_id, event_id, seat_id;

    public CheckSeat() {
    }

    public CheckSeat(String event_id, String seat_id) {
        this.event_id = event_id;
        this.seat_id = seat_id;
    }
    
    public CheckSeat(String check_seat_id, String event_id, String seat_id) {
        this.check_seat_id = check_seat_id;
        this.event_id = event_id;
        this.seat_id = seat_id;
    }

    public String getCheck_seat_id() {
        return check_seat_id;
    }

    public void setCheck_seat_id(String check_seat_id) {
        this.check_seat_id = check_seat_id;
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

    @Override
    public String toString() {
        return "CheckSeat{" + "check_seat_id=" + check_seat_id + ", event_id=" + event_id + ", seat_id=" + seat_id + '}';
    }
    
    
        
}
