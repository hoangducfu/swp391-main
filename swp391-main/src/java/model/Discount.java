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
<<<<<<< Updated upstream
       String id,code, quantity;
=======
    String id, code, quantity, DiscountPercent, EventID;
>>>>>>> Stashed changes

    public Discount() {
    }

<<<<<<< Updated upstream
    public Discount(String id, String code, String quantity) {
        this.id = id;
        this.code = code;
        this.quantity = quantity;
=======
    public Discount(String id, String code, String quantity, String DiscountPercent, String EventID) {
        this.id = id;
        this.code = code;
        this.quantity = quantity;
        this.DiscountPercent = DiscountPercent;
        this.EventID = EventID;
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
    @Override
    public String toString() {
        return "Discount{" + "id=" + id + ", code=" + code + ", quantity=" + quantity + '}';
    }
 
       
=======
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
    
    
>>>>>>> Stashed changes
}
