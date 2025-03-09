/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import model.Registration;

/**
 *
 * @author Vinh
 */
public class RegistrationDAO{

    public static boolean insertRegistration(Registration registration) throws SQLException {
        DBContext db = DBContext.getInstance();
        String sql = "INSERT INTO Registrations (UserID, RegistrationType, Address, StartDate, EndDate, Status, DocumentPath) "
                + "VALUES (?, ?, ?, ?, ?, 'Pending', ?)";

        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, registration.getUserId()); // Đặt đúng vị trí UserID
            statement.setString(2, registration.getRegistrationType());
            statement.setString(3, registration.getAddress());
            statement.setString(4, registration.getStartDate());
            statement.setString(5, registration.getEndDate());
            statement.setString(6, registration.getDocumentPath());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0; // Trả về true nếu chèn thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi
        }
    }
}

