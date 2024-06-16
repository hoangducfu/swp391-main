/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Booking;
import model.BookingDetail;

/**
 *
 * @author Admin
 */
public class BookingDetailDAO extends DBContext {

    public boolean createBookingDetail(BookingDetail booking) throws SQLException {
        String sql = "INSERT INTO Booking_detail ([Quantity]\n"
                + "      ,[Unit_price]\n"
                + "      ,[Subtotal]\n"
                + "      ,[BookingID]) VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, booking.getQuantity());
            preparedStatement.setDouble(2, booking.getUnitPrice());
            preparedStatement.setDouble(3, booking.getSubtotal());
            preparedStatement.setInt(4, booking.getBookingId());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row is affected (booking created)
        }
    }

    public List<BookingDetail> getBookingDetailByBookingId(String bookingID) throws SQLException {
        List<BookingDetail> lst = new ArrayList<>();
        String sql = "SELECT * FROM Booking_detail WHERE BookingID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, bookingID);
            ResultSet resultSet = preparedStatement.executeQuery();

            Booking booking = null;
            if (resultSet.next()) {
                BookingDetail bookingDetail = new BookingDetail(resultSet.getInt(1),
                        resultSet.getInt(2),
                        resultSet.getDouble(3), resultSet.getDouble(4), resultSet.getInt(5));
                lst.add(bookingDetail);
            }

            return lst;
        }
    }

}
