/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalTime;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Event {

    private int eventId;
    private int categoryId;
    private String eventName;
    private String description;
    private String eventImg;
    private int locationId;
    private Date date;
    private LocalTime time;
    private int accountId;
    private boolean statusDisable;
    
    private Category category;

    public Event() {
    }

    public Event(int eventId, int categoryId, String eventName, String description, String eventImg, int locationId, Date date, LocalTime time, int accountId, boolean statusDisable) {
        this.eventId = eventId;
        this.categoryId = categoryId;
        this.eventName = eventName;
        this.description = description;
        this.eventImg = eventImg;
        this.locationId = locationId;
        this.date = date;
        this.time = time;
        this.accountId = accountId;
        this.statusDisable = statusDisable;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
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

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public boolean isStatusDisable() {
        return statusDisable;
    }

    public void setStatusDisable(boolean statusDisable) {
        this.statusDisable = statusDisable;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

}
