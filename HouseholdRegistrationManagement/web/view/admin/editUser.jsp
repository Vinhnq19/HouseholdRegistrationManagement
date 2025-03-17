<%@ page import="java.sql.*" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Lấy ID từ URL
    int userId = Integer.parseInt(request.getParameter("id"));
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserById(userId);

    if (user == null) {
        out.println("<h3>Không tìm thấy người dùng!</h3>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa người dùng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
    <div class="container mt-5">
        <h2>Chỉnh sửa thông tin người dùng</h2>
        <form action="updateUser.jsp" method="post">
            <input type="hidden" name="userId" value="<%= user.getUserId() %>">

            <div class="mb-3">
                <label for="fullName" class="form-label">Họ và tên:</label>
                <input type="text" class="form-control" name="fullName" value="<%= user.getFullName() %>" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" name="email" value="<%= user.getEmail() %>" required>
            </div>

            <div class="mb-3">
                <label for="role" class="form-label">Vai trò:</label>
                <select class="form-control" name="role">
                    <option value="Admin" <%= user.getRole().equals("Admin") ? "selected" : "" %>>Admin</option>
                    <option value="User" <%= user.getRole().equals("User") ? "selected" : "" %>>User</option>
                    <option value="Citizen" <%= user.getRole().equals("Citizen") ? "selected" : "" %>>Citizen</option>
                    <option value="Police" <%= user.getRole().equals("Police") ? "selected" : "" %>>Police</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="address" class="form-label">Địa chỉ:</label>
                <input type="text" class="form-control" name="address" value="<%= user.getAddress() %>">
            </div>

            <button type="submit" class="btn btn-success">Cập nhật</button>
            <a href="manageUsers.jsp" class="btn btn-secondary">Hủy</a>
        </form>
    </div>
</body>
</html>
