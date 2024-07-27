/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author mactu
 */
public class PaymentCancel {
      private String cancelTicketId, accountId,id_event,id_seat,id_pay,reason,bankName,bankNumber;
        private  int status;

    public PaymentCancel() {
    }

    public PaymentCancel(String cancelTicketId, String accountId, String id_event, String id_seat, String id_pay, String reason, String bankName, String bankNumber, int status) {
        this.cancelTicketId = cancelTicketId;
        this.accountId = accountId;
        this.id_event = id_event;
        this.id_seat = id_seat;
        this.id_pay = id_pay;
        this.reason = reason;
        this.bankName = bankName;
        this.bankNumber = bankNumber;
        this.status = status;
    }

    public PaymentCancel(String accountId, String id_event, String id_seat, String id_pay, String reason, String bankName, String bankNumber, int status) {
        this.accountId = accountId;
        this.id_event = id_event;
        this.id_seat = id_seat;
        this.id_pay = id_pay;
        this.reason = reason;
        this.bankName = bankName;
        this.bankNumber = bankNumber;
        this.status = status;
    }

   

    public String getCancelTicketId() {
        return cancelTicketId;
    }

    public void setCancelTicketId(String cancelTicketId) {
        this.cancelTicketId = cancelTicketId;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBankNumber() {
        return bankNumber;
    }

    public void setBankNumber(String bankNumber) {
        this.bankNumber = bankNumber;
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

    @Override
    public String toString() {
        return "PaymentCancel{" + "cancelTicketId=" + cancelTicketId + ", accountId=" + accountId + ", id_event=" + id_event + ", id_seat=" + id_seat + ", id_pay=" + id_pay + ", reason=" + reason + ", bankName=" + bankName + ", bankNumber=" + bankNumber + ", status=" + status + '}';
    }

   
        
}