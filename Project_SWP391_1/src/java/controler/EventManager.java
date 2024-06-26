/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controler;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import model.Event;

/**
 *
 * @author Admin
 */
public class EventManager {

    public List<Event> getFavoriteProducts(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();

        List<Event> favoriteEvents = new ArrayList<>();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart")) {
                    String cartValue = cookie.getValue();
                    String[] products = cartValue.split("\\|");
                    for (String product : products) {
                        String[] parts = product.split(":");
                        if (parts.length == 13) {
                            Event e = new Event();
                            e.setEventId(parts[0]);
                            e.setCategoryID(parts[1]);
                            e.setEventName(parts[2]);
                            e.setDescription(parts[3]);
                            e.setEventImg(parts[4]);
                            e.setLocationId(parts[5]);
                            e.setTimeStart(parts[6]);
                            e.setTimeEnd(parts[7]);
                            e.setPriceType1(parts[8]);
                            e.setPriceType2(parts[9]);
                            e.setPriceType3(parts[10]);
                            e.setAccountId(parts[11]);
                            e.setStatusDisable(parts[12]);
                            favoriteEvents.add(e);
                        }
                    }
                    break;
                }
            }
        }
        return favoriteEvents;
    }
}
