/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author Admin
 */
public class Event {
    private String id , categoryID,name,description, image, locationID, timeStart,timeEnd,priceType1,priceType2, priceType3, accountID, status;

    public Event() {
    }

    public Event(String categoryID, String name, String description, String image, String locationID, String timeStart, String timeEnd, String priceType1, String priceType2, String priceType3, String accountID, String status) {
        this.categoryID = categoryID;
        this.name = name;
        this.description = description;
        this.image = image;
        this.locationID = locationID;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.priceType1 = priceType1;
        this.priceType2 = priceType2;
        this.priceType3 = priceType3;
        this.accountID = accountID;
        this.status = status;
    }

    public Event(String id, String categoryID, String name, String description, String image, String locationID, String timeStart, String timeEnd, String priceType1, String priceType2, String priceType3, String accountID, String status) {
        this.id = id;
        this.categoryID = categoryID;
        this.name = name;
        this.description = description;
        this.image = image;
        this.locationID = locationID;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.priceType1 = priceType1;
        this.priceType2 = priceType2;
        this.priceType3 = priceType3;
        this.accountID = accountID;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLocationID() {
        return locationID;
    }

    public void setLocationID(String locationID) {
        this.locationID = locationID;
    }

    public String getTimeStart() {
        return timeStart;
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

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Event{" + "id=" + id + ", categoryID=" + categoryID + ", name=" + name + ", description=" + description + ", image=" + image + ", locationID=" + locationID + ", timeStart=" + timeStart + ", timeEnd=" + timeEnd + ", priceType1=" + priceType1 + ", priceType2=" + priceType2 + ", priceType3=" + priceType3 + ", accountID=" + accountID + ", status=" + status + '}';
    }
    
    
    
}