/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import com.sun.jdi.connect.spi.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import dao.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import java.nio.file.Paths;
import model.Registration;

/**
 *
 * @author Vinh
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 *10,
        maxRequestSize = 1024 * 1024 * 50)
public class RegistrationServlet extends HttpServlet {   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrationServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrationServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        try {
            // Kiểm tra userId
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                userId = 1; // Gán userId giả lập nếu chưa đăng nhập
                session.setAttribute("userId", userId);
                session.setAttribute("userName", "User Test");
            }

            // Lấy dữ liệu từ form
            String registrationType = request.getParameter("registrationType");
            String address = request.getParameter("address");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate").isEmpty() ? null : request.getParameter("endDate");

            // Xử lý file upload
            Part filePart = request.getPart("document");
            String filename = (filePart != null && filePart.getSubmittedFileName() != null)
                    ? filePart.getSubmittedFileName() : "";

            String documentPath = null;
            if (!filename.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("/uploads");
                Files.createDirectories(Paths.get(uploadPath)); // Tạo thư mục nếu chưa có
                filePart.write(uploadPath + File.separator + filename);
                documentPath = "uploads/" + filename; // Chỉ lưu đường dẫn tương đối vào DB
            }

            // Tạo đối tượng Registration
            Registration r = new Registration();
            r.setUserId(userId);
            r.setRegistrationType(registrationType);
            r.setAddress(address);
            r.setStartDate(startDate);
            r.setEndDate(endDate);
            r.setStatus("Pending");
            r.setDocumentPath(documentPath);

            // Gọi insertRegistration()
            boolean success = RegistrationDAO.insertRegistration(r);

            if (success) {
                session.setAttribute("registration", r);
                request.setAttribute("message", "✅ Đăng ký thành công! Vui lòng chờ xét duyệt.");
                request.setAttribute("success", true);
            } else {
                request.setAttribute("message", "❌ Đăng ký thất bại, vui lòng thử lại.");
                request.setAttribute("success", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "❌ Lỗi hệ thống: " + e.getMessage());
            request.setAttribute("success", false);
        }

        // Chuyển hướng lại trang đăng ký để hiển thị thông báo
        request.getRequestDispatcher("/view/citizen/HouseholdRegistration.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
