/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controler;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author Admin
 */
public class thu1 {
      public static List<String> getFavoriteProducts(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        List<String> favoriteProducts = new ArrayList<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart")) {
                    String cartValue = cookie.getValue();
                    favoriteProducts = new ArrayList<>(Arrays.asList(cartValue.split("\\|")));
                    break;
                }
            }
        }
        return favoriteProducts;
    }
}
