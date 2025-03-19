/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import model.Registration;
import java.sql.SQLException;


/**
 *
 * @author Vinh
 */
public class ApprovalServlet extends HttpServlet {
    RegistrationDAO registrationDAO = new RegistrationDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Registration> householdRegistrations = registrationDAO.getPendingHouseholdRegistrations();
        List<Registration> separationRegistrations = registrationDAO.getPendingSeparationRegistrations();

        String filter = request.getParameter("filter");
        if (filter == null) {
            filter = "household"; // Mặc định hiển thị danh sách đăng ký hộ khẩu
        }

        request.setAttribute("householdRegistrations", householdRegistrations);
        request.setAttribute("separationRegistrations", separationRegistrations);
        request.setAttribute("filter", filter);

        request.getRequestDispatcher("/view/leader/profileApproval.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int registrationId = Integer.parseInt(request.getParameter("registrationId"));
        String action = request.getParameter("action");
        try{

            if ("approve".equals(action)) {
                registrationDAO.updateRegistrationStatus(registrationId, "Approved");
                sendNotification(registrationId, "Hồ sơ của bạn đã được duyệt.");
            } else if ("reject".equals(action)) {
                registrationDAO.updateRegistrationStatus(registrationId, "Rejected");
                sendNotification(registrationId, "Hồ sơ của bạn đã bị từ chối.");
            }
            response.sendRedirect("approval");
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }

    private void sendNotification(int registrationId, String message) {
        // Gửi thông báo đến người dân (có thể dùng Email hoặc Notification Table)
        System.out.println("Thông báo gửi đến đơn " + registrationId + ": " + message);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

