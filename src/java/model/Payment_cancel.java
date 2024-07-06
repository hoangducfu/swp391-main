/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author mactu
 */
public class Payment_cancel {
    // thêm bank name , bank number
      private String account_name,id_event,id_seat,id_pay,reason, bank_name, bank_number;
        private  int status;

    public Payment_cancel() {
    }

    public Payment_cancel(String account_name, String id_event, String id_seat, String id_pay, String reason, String bank_name, String bank_number, int status) {
        this.account_name = account_name;
        this.id_event = id_event;
        this.id_seat = id_seat;
        this.id_pay = id_pay;
        this.reason = reason;
        this.bank_name = bank_name;
        this.bank_number = bank_number;
        this.status = status;
    }

    public String getBank_name() {
        return bank_name;
    }

    public void setBank_name(String bank_name) {
        this.bank_name = bank_name;
    }

    public String getBank_number() {
        return bank_number;
    }

    public void setBank_number(String bank_number) {
        this.bank_number = bank_number;
    }

    
    
    public Payment_cancel(String account_name, String id_event, String id_seat, String id_pay, String reason, int status) {
        this.account_name = account_name;
        this.id_event = id_event;
        this.id_seat = id_seat;
        this.id_pay = id_pay;
        this.reason = reason;
        this.status = status;
    }

    public String getAccount_name() {
        return account_name;
    }

    public void setAccount_name(String account_name) {
        this.account_name = account_name;
    }

    public String getId_event() {
        return id_event;
    }

    public void setId_event(String id_event) {
        this.id_event = id_event;
    }

    public String getId_seat() {
        return id_seat;
    }

    public void setId_seat(String id_seat) {
        this.id_seat = id_seat;
    }

    public String getId_pay() {
        return id_pay;
    }

    public void setId_pay(String id_pay) {
        this.id_pay = id_pay;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
        
}
