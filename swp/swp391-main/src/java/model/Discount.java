/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Discount {
    private String id, code, quantity, DiscountPercent, EventID,status;

    public Discount() {
    }

    public Discount(String id, String code, String quantity, String DiscountPercent, String EventID, String status) {
        this.id = id;
        this.code = code;
        this.quantity = quantity;
        this.DiscountPercent = DiscountPercent;
        this.EventID = EventID;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getDiscountPercent() {
        return DiscountPercent;
    }

    public void setDiscountPercent(String DiscountPercent) {
        this.DiscountPercent = DiscountPercent;
    }

    public String getEventID() {
        return EventID;
    }

    public void setEventID(String EventID) {
        this.EventID = EventID;
    }

    @Override
    public String toString() {
        return "Discount{" + "id=" + id + ", code=" + code + ", quantity=" + quantity + ", DiscountPercent=" + DiscountPercent + ", EventID=" + EventID + '}';
    }
    
    
}
