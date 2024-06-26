/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

/**
 *
 * @author hoangduc
 */
public class Event {

    private String eventId, categoryID, eventName, description, eventImg,
            locationId, timeStart, timeEnd, priceType1, priceType2,
            priceType3, accountId, statusDisable;

    public Event() {
    }

    public Event(String eventId, String categoryID, String eventName, String description, String eventImg, String locationId, String timeStart, String timeEnd, String priceType1, String priceType2, String priceType3, String accountId, String statusDisable) {
        this.eventId = eventId;
        this.categoryID = categoryID;
        this.eventName = eventName;
        this.description = description;
        this.eventImg = eventImg;
        this.locationId = locationId;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.priceType1 = priceType1;
        this.priceType2 = priceType2;
        this.priceType3 = priceType3;
        this.accountId = accountId;
        this.statusDisable = statusDisable;
    }

    public Event(String categoryID, String eventName, String description, String eventImg, String locationId, String timeStart, String timeEnd, String priceType1, String priceType2, String priceType3, String accountId, String statusDisable) {
        this.categoryID = categoryID;
        this.eventName = eventName;
        this.description = description;
        this.eventImg = eventImg;
        this.locationId = locationId;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.priceType1 = priceType1;
        this.priceType2 = priceType2;
        this.priceType3 = priceType3;
        this.accountId = accountId;
        this.statusDisable = statusDisable;
    }

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEventImg() {
        return eventImg;
    }

    public void setEventImg(String eventImg) {
        this.eventImg = eventImg;
    }

    public String getLocationId() {
        return locationId;
    }

    public void setLocationId(String locationId) {
        this.locationId = locationId;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public String getTimeStartFormat() {
        String time1 = this.timeStart;
        DateTimeFormatter originalFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
        DateTimeFormatter newFormat = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");

        try {
            LocalDateTime dateTime = LocalDateTime.parse(time1, originalFormat);
            return dateTime.format(newFormat);
        } catch (DateTimeParseException e) {
            System.err.println("Error parsing date: " + e.getMessage());
            return null;
        }

    }

    public String getTimePeriod() {
// Chuỗi ngày tháng ban đầu
        String dateStr1 = this.timeStart;
        String dateStr2 = this.timeEnd;

        // Định dạng ban đầu của chuỗi ngày tháng bao gồm phần mili giây tùy chọn
        DateTimeFormatter originalFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss[.S]");

        try {
            // Chuyển đổi chuỗi ngày tháng sang đối tượng LocalDateTime
            LocalDateTime dateTime1 = LocalDateTime.parse(dateStr1, originalFormat);
            LocalDateTime dateTime2 = LocalDateTime.parse(dateStr2, originalFormat);

            // Tính thời gian giữa hai chuỗi
            Duration duration = Duration.between(dateTime1, dateTime2);

            // Xuất kết quả
            long hours = duration.toHours();
            long minutes = duration.toMinutes() % 60;
            String output = hours + " giờ " ;
            if(minutes!=0){
                output += minutes + " phút";
            }
            return  output;
        } catch (DateTimeParseException e) {
            System.err.println("Error parsing date: " + e.getMessage());
            return null;
        }
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(String timeEnd) {
        this.timeEnd = timeEnd;
    }

    public String getPriceType1() {
        return priceType1;
    }

    public void setPriceType1(String priceType1) {
        this.priceType1 = priceType1;
    }

    public String getPriceType2() {
        return priceType2;
    }

    public void setPriceType2(String priceType2) {
        this.priceType2 = priceType2;
    }

    public String getPriceType3() {
        return priceType3;
    }

    public void setPriceType3(String priceType3) {
        this.priceType3 = priceType3;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getStatusDisable() {
        return statusDisable;
    }

    public void setStatusDisable(String statusDisable) {
        this.statusDisable = statusDisable;
    }

    @Override
    public String toString() {
        return "Event{" + "eventId=" + eventId + ", categoryID=" + categoryID + ", eventName=" + eventName + ", description=" + description + ", eventImg=" + eventImg + ", locationId=" + locationId + ", timeStart=" + timeStart + ", timeEnd=" + timeEnd + ", priceType1=" + priceType1 + ", priceType2=" + priceType2 + ", priceType3=" + priceType3 + ", accountId=" + accountId + ", statusDisable=" + statusDisable + '}';
    }

}
