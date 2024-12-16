/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author mactu
 */
public class Payment {
    private int event_id, payment_id, amount;
    private String accountId, payment_date, trasaction_id, transaction_description,status,payment_method, id_seat;

    public Payment() {
    }

    public Payment(int event_id, int payment_id, int amount, String accountId, String payment_date, String trasaction_id, String transaction_description, String status, String payment_method, String id_seat) {
        this.event_id = event_id;
        this.payment_id = payment_id;
        this.amount = amount;
        this.accountId = accountId;
        this.payment_date = payment_date;
        this.trasaction_id = trasaction_id;
        this.transaction_description = transaction_description;
        this.status = status;
        this.payment_method = payment_method;
        this.id_seat = id_seat;
    }

    public Payment(int event_id, int amount, String accountId, String payment_date, String trasaction_id, String transaction_description, String status, String payment_method, String id_seat) {
        this.event_id = event_id;
        this.amount = amount;
        this.accountId = accountId;
        this.payment_date = payment_date;
        this.trasaction_id = trasaction_id;
        this.transaction_description = transaction_description;
        this.status = status;
        this.payment_method = payment_method;
        this.id_seat = id_seat;
    }
    
//    public Payment(int event_id,  int amount, String accountId, String payment_date, String trasaction_id, String transaction_description, String status, String payment_method, String id_seat) {
//        this.event_id = event_id;
//        this.amount = amount;
//        this.accountId = accountId;
//        this.payment_date = payment_date;
//        this.trasaction_id = trasaction_id;
//        this.transaction_description = transaction_description;
//        this.status = status;
//        this.payment_method = payment_method;
//        this.id_seat = id_seat;
//    }

    public String getId_seat() {
        return id_seat;
    }

    public void setId_seat(String id_seat) {
        this.id_seat = id_seat;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    
    public String getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(String payment_date) {
        this.payment_date = payment_date;
    }

    public String getTrasaction_id() {
        return trasaction_id;
    }

    public void setTrasaction_id(String trasaction_id) {
        this.trasaction_id = trasaction_id;
    }

    public String getTransaction_description() {
        return transaction_description;
    }

    public void setTransaction_description(String transaction_description) {
        this.transaction_description = transaction_description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    @Override
    public String toString() {
        return "Payment{" + "event_id=" + event_id + ", payment_id=" + payment_id + ", amount=" + amount + ", accountId=" + accountId + ", payment_date=" + payment_date + ", trasaction_id=" + trasaction_id + ", transaction_description=" + transaction_description + ", status=" + status + ", payment_method=" + payment_method + ", id_seat=" + id_seat + '}';
    }
    
}