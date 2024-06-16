/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Booking;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import model.Booking_detail;

/**
 *
 * @author Pc
 */
public class BookingDAO extends DBContext {

    public boolean createBooking(Booking booking) throws SQLException {
        String sql = "INSERT INTO Booking (BookingID, Booking_date, Status, Total_amount, EventID, AccountID) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, booking.getBookingID());
            preparedStatement.setString(2, booking.getBooking_date());
            preparedStatement.setString(3, booking.getStatus());
            preparedStatement.setString(4, booking.getTotal_amount());
            preparedStatement.setString(5, booking.getEventID());
            preparedStatement.setString(6, booking.getAccountID());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row is affected (booking created)
        }
    }

    public List<Booking> getAllBookings() throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Booking";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String bookingID = resultSet.getString("BookingID");
                String bookingDate = resultSet.getString("Booking_date");
                String status = resultSet.getString("Status");
                String totalAmount = resultSet.getString("Total_amount");
                String eventID = resultSet.getString("EventID");
                String accountID = resultSet.getString("AccountID");

                Booking booking = new Booking(bookingID, bookingDate, status, totalAmount, eventID, accountID);
                bookings.add(booking);
            }
        }
        return bookings;
    }

    // Method to find a booking by its ID
    public Booking getBookingById(String bookingID) throws SQLException {
        String sql = "SELECT * FROM Booking WHERE BookingID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, bookingID);
            ResultSet resultSet = preparedStatement.executeQuery();

            Booking booking = null;
            if (resultSet.next()) {
                String bookingDate = resultSet.getString("Booking_date");
                String status = resultSet.getString("Status");
                String totalAmount = resultSet.getString("Total_amount");
                String eventID = resultSet.getString("EventID");
                String accountID = resultSet.getString("AccountID");

                booking = new Booking(bookingID, bookingDate, status, totalAmount, eventID, accountID);
            }

            return booking;
        }
    }

    public boolean updateBookingStatus(String bookingID, String newStatus) throws SQLException {
        String sql = "UPDATE Booking SET Status = ? WHERE BookingID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, newStatus);
            preparedStatement.setString(2, bookingID);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row is affected (booking updated)
        }
    }

    // (Optional) Method to delete a booking by its ID (implement with caution)
    public boolean deleteBooking(String bookingID) throws SQLException {
        String sql = "DELETE FROM Booking WHERE BookingID = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, bookingID);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row is affected (booking deleted)
        }
    }

    public List<Booking> searchBookings(String searchTerm, String searchColumn) throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Booking WHERE " + searchColumn + " LIKE ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + searchTerm + "%"); // Add wildcards for partial matches

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String bookingID = resultSet.getString("BookingID");
                String bookingDate = resultSet.getString("Booking_date");
                String status = resultSet.getString("Status");
                String totalAmount = resultSet.getString("Total_amount");
                String eventID = resultSet.getString("EventID");
                String accountID = resultSet.getString("AccountID");

                Booking booking = new Booking(bookingID, bookingDate, status, totalAmount, eventID, accountID);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            throw e; // Re-throw the exception for handling in the calling method
        }
        return bookings;
    }
    
    public List<Booking> getBookingsByAccountID(String accountID) throws SQLException {
    List<Booking> bookings = new ArrayList<>();
    String sql = "SELECT * FROM Booking WHERE AccountID = ?";
    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        preparedStatement.setString(1, accountID);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            String bookingID = resultSet.getString("BookingID");
            String bookingDate = resultSet.getString("Booking_date");
            String status = resultSet.getString("Status");
            String totalAmount = resultSet.getString("Total_amount");
            String eventID = resultSet.getString("EventID");

            Booking booking = new Booking(bookingID, bookingDate, status, totalAmount, eventID, accountID);
            bookings.add(booking);
        }
    }
    return bookings;
}
    
    public List<Booking_detail> getBookingDetailByAccountId(String accountId) throws SQLException {
    List<Booking_detail> bookingDetails = new ArrayList<>();

    String sql = "SELECT bd.Booking_detail_ID, bd.Quantity, bd.Unit_price, bd.Subtotal, b.BookingID " +
            "FROM Booking_detail bd JOIN Booking b ON bd.BookingID = b.BookingID " +
            "WHERE b.AccountID = ?";

    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        preparedStatement.setString(1, accountId);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            String Booking_detail_ID = resultSet.getString("Booking_detail_ID");
            String Quantity = resultSet.getString("Quantity");
            String unitPrice = resultSet.getString("Unit_price");
            String Subtotal = resultSet.getString("Subtotal");
            String BookingID = resultSet.getString("BookingID");

            Booking_detail bookingDetail = new Booking_detail(Booking_detail_ID, Quantity,
                    unitPrice, Subtotal, BookingID);
            bookingDetails.add(bookingDetail);
        }
    }

    return bookingDetails;
}
    
}
    

