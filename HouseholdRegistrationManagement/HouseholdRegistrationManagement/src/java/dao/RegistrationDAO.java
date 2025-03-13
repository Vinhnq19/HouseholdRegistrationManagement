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

    public static boolean insertRegistration(Registration registration) {
        DBContext db = DBContext.getInstance();
        String sql = "INSERT INTO Registrations (UserID, RegistrationType, Address, StartDate, Status, DocumentPath) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, registration.getUserId());
            statement.setString(2, registration.getRegistrationType());
            statement.setString(3, registration.getAddress());
            statement.setString(4, registration.getStartDate());
            statement.setString(5, registration.getStatus());
            statement.setString(6, registration.getDocumentPath());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

//
//    public static boolean insertHouseholdSeparation(Integer userId, String newAddress) {
//        DBContext db = DBContext.getInstance();
//        String sql = "INSERT INTO Registrations (UserID, RegistrationType, Address, StartDate, Status, DocumentPath) VALUES (?, ?, ?, NOW(), ?, ?)";
//
//        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
//            statement.setInt(1, userId);
//            statement.setString(2, "Household Separation");
//            statement.setString(3, newAddress);
//            statement.setString(4, "Pending"); // Trạng thái chờ duyệt
//
//            return statement.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
    public static String getCurrentAddress(int userId) {
        DBContext db = DBContext.getInstance();
        String sql = "SELECT TOP 1 Address FROM Registrations WHERE UserID = ? AND Status = 'Pending' ORDER BY StartDate DESC";

        try (PreparedStatement statement = db.getConnection().prepareStatement(sql)) {
            statement.setInt(1, userId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getString("Address");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không có dữ liệu
    }

    public static void main(String[] args) {
        RegistrationDAO dao = new RegistrationDAO();
        int userIdTest = 1; // Test với user ID giả lập
        String address = dao.getCurrentAddress(userIdTest);

        if (address != null) {
            System.out.println("Địa chỉ hiện tại của User " + userIdTest + " là: " + address);
        } else {
            System.out.println("Không tìm thấy địa chỉ nào cho User " + userIdTest);
        }
    }
}
