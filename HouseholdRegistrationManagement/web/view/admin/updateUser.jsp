<%@ page import="java.sql.*" %>
<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");

    int userId = Integer.parseInt(request.getParameter("userId"));
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String role = request.getParameter("role");
    String address = request.getParameter("address");

    UserDAO userDAO = new UserDAO();
    boolean isUpdated = userDAO.updateUser(userId, fullName, email, role, address);

    if (isUpdated) {
        response.sendRedirect("manageUsers.jsp?msg=Cập nhật thành công!");
    } else {
        out.println("<h3>Cập nhật thất bại!</h3>");
    }
%>


