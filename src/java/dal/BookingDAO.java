/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import model.Booking;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import model.BookingDetail;

/**
 *
 * @author Pc
 */
public class BookingDAO extends DBContext {

    public boolean createBooking(Booking booking) throws SQLException {
        String sql = "INSERT INTO Booking (Booking_date, Status, Total_amount, EventID, AccountID,[Name]\n" +
"      ,[Phone]\n" +
"      ,[Address]\n" +
"      ,[Email]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setDate(1, new java.sql.Date( booking.getBookingDate().getTime()));
            preparedStatement.setString(2, booking.getStatus());
            preparedStatement.setDouble(3, booking.getTotalAmount());
            preparedStatement.setInt(4, booking.getEventId());
            preparedStatement.setInt(5, booking.getAccountId());
            
            preparedStatement.setString(6, booking.getName());
            preparedStatement.setString(7, booking.getPhone());
            preparedStatement.setString(8, booking.getAddress());
            preparedStatement.setString(9, booking.getEmail());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row is affected (booking created)
        }
    }
    
    
    public int getBookingID() {
        String query = "SELECT TOP(1) BookingID from Booking order BY BookingID DESC";
         try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
             ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Booking> getAllBookings() throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Booking";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int bookingID = resultSet.getInt("BookingID");
                Date bookingDate = resultSet.getDate("Booking_date");
                String status = resultSet.getString("Status");
                double totalAmount = resultSet.getDouble("Total_amount");
                int eventID = resultSet.getInt("EventID");
                int accountID = resultSet.getInt("AccountID");

                Booking booking = new Booking(bookingID, bookingDate, status, totalAmount, eventID, accountID, resultSet.getString(7)
                , resultSet.getString(8)
                , resultSet.getString(9)
                , resultSet.getString(10));
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
                int iD = resultSet.getInt("BookingID");
                Date bookingDate = resultSet.getDate("Booking_date");
                String status = resultSet.getString("Status");
                double totalAmount = resultSet.getDouble("Total_amount");
                int eventID = resultSet.getInt("EventID");
                int accountID = resultSet.getInt("AccountID");

                 booking = new Booking(iD, bookingDate, status, totalAmount, eventID, accountID, resultSet.getString(7)
                , resultSet.getString(8)
                , resultSet.getString(9)
                , resultSet.getString(10));
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
                int iD = resultSet.getInt("BookingID");
                Date bookingDate = resultSet.getDate("Booking_date");
                String status = resultSet.getString("Status");
                double totalAmount = resultSet.getDouble("Total_amount");
                int eventID = resultSet.getInt("EventID");
                int accountID = resultSet.getInt("AccountID");

                 Booking booking = new Booking(iD, bookingDate, status, totalAmount, eventID, accountID, resultSet.getString(7)
                , resultSet.getString(8)
                , resultSet.getString(9)
                , resultSet.getString(10));
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
            int iD = resultSet.getInt("BookingID");
                Date bookingDate = resultSet.getDate("Booking_date");
                String status = resultSet.getString("Status");
                double totalAmount = resultSet.getDouble("Total_amount");
                int eventID = resultSet.getInt("EventID");
                int accID = resultSet.getInt("AccountID");

                 Booking booking = new Booking(iD, bookingDate, status, totalAmount, eventID, accID, resultSet.getString(7)
                , resultSet.getString(8)
                , resultSet.getString(9)
                , resultSet.getString(10));
            bookings.add(booking);
        }
    }
    return bookings;
}
    
    public List<BookingDetail> getBookingDetailByAccountId(String accountId) throws SQLException {
    List<BookingDetail> bookingDetails = new ArrayList<>();

    String sql = "SELECT bd.Booking_detail_ID, bd.Quantity, bd.Unit_price, bd.Subtotal, b.BookingID " +
            "FROM Booking_detail bd JOIN Booking b ON bd.BookingID = b.BookingID " +
            "WHERE b.AccountID = ?";

    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        preparedStatement.setString(1, accountId);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            int Booking_detail_ID = resultSet.getInt("Booking_detail_ID");
            int Quantity = resultSet.getInt("Quantity");
            double unitPrice = resultSet.getDouble("Unit_price");
            double Subtotal = resultSet.getDouble("Subtotal");
            int BookingID = resultSet.getInt("BookingID");

            BookingDetail bookingDetail = new BookingDetail(Booking_detail_ID, Quantity,
                    unitPrice, Subtotal, BookingID);
            bookingDetails.add(bookingDetail);
        }
    }

    return bookingDetails;
}
    
}
    

