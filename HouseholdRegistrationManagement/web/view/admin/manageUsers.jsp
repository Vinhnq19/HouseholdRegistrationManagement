<%-- 
    Document   : manageUsers
    Created on : 17 thg 3, 2025, 14:17:36
    Author     : Vinh
--%>


<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String searchQuery = request.getParameter("searchQuery") != null ? request.getParameter("searchQuery") : "";
String roleFilter = request.getParameter("roleFilter") != null ? request.getParameter("roleFilter") : "";
UserDAO userDAO = new UserDAO();
List<User> userList;

if ((!searchQuery.isEmpty() || !roleFilter.isEmpty())) {
    userList = userDAO.searchUsersByNameAndRole(searchQuery, roleFilter);
} else {
    userList = userDAO.getAllUsers();
}
%>



<html>
    <head>
        <!-- Metadata -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Vietnamese Public Services - Quản trị viên</title>

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com/" />
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Cabin:wght@400;500;600;700&display=swap" rel="stylesheet" />

        <!-- Stylesheets -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rtl.css" />
        <style>
            .container {
                width: 80%;
                margin: auto;
                padding-top: 20px;
            }
            .button-container {
                display: flex;
                justify-content: center;
                gap: 20px;
            }
            .card {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                width: 250px;
                text-align: center;
            }
            .card h2 {
                font-size: 18px;
                margin-bottom: 10px;
            }
            .btn {
                display: block;
                padding: 10px;
                border-radius: 5px;
                text-decoration: none;
                font-size: 16px;
                font-weight: bold;
                color: white;
            }
            .btn-approve {
                background-color: red;
            }
            .btn-manage {
                background-color: green;
            }
            .btn-report {
                background-color: orange;
            }
            .bg-container {
                background-image: url(${pageContext.request.contextPath}/img/trongdong.jpg);
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                height: 100vh; /* Chiều cao full màn hình */
            }
            #pageWrapper {
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            main {
                flex-grow: 1;
            }
            body {
                font-family: 'Nunito Sans', sans-serif;
                background-color: #f8f9fa;
            }
            .container {
                max-width: 900px;
                margin: auto;
                padding-top: 20px;
            }
            .search-container {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 10px;
                flex-wrap: wrap;
            }
            .table-container {
                margin-top: 20px;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .table th, .table td {
                text-align: center;
                vertical-align: middle;
            }
            .btn-action {
                display: flex;
                gap: 5px;
                justify-content: center;
            }
            .search-wrapper {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 15px;
                flex-wrap: nowrap;
            }

            .search-wrapper input,
            .search-wrapper select,
            .search-wrapper button {
                height: 45px;
                font-size: 16px;
                padding: 5px 15px;
                border-radius: 8px;
                border: 1px solid #ccc;
            }

            .search-wrapper input {
                flex: 1;
                max-width: 300px;
                min-width: 250px;
            }

            .search-wrapper select {
                width: 200px;
            }

            .search-wrapper button {
                width: 100px;
                height: 45px;
                background-color: #162a52;
                color: white;
                border: none;
                cursor: pointer;
                transition: all 0.3s ease;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .search-wrapper button:hover {
                background-color: #0d1b3c;
            }


        </style>
    </head>
    <body>
        <!-- pageWrapper -->
        <div id="pageWrapper" class="ltr">
            <!-- phStickyWrap -->
            <div class="phStickyWrap">
                <!-- pageHeader -->
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../admin/adminHeader.jsp"></jsp:include>   
                    </header>
                </div>

                <main>
                    <div class="container mt-4">
                        <h2 class="text-center">Quản lý người dùng</h2>

                        <!-- Thanh tìm kiếm -->
                        <div class="row mb-3">
                            <form id="filterForm" action="manageUsers.jsp" method="GET">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="search-wrapper">
                                            <input type="text" name="searchQuery" placeholder="Tìm kiếm theo tên..." 
                                                   value="<%= request.getParameter("searchQuery") != null ? request.getParameter("searchQuery") : "" %>">

                                        <select name="roleFilter">
                                            <option value="">Tất cả vai trò</option>
                                            <option value="Citizen" <%= "Citizen".equals(request.getParameter("roleFilter")) ? "selected" : "" %>>Citizen</option>
                                            <option value="Police" <%= "Police".equals(request.getParameter("roleFilter")) ? "selected" : "" %>>Police</option>
                                            <option value="AreaLeader" <%= "AreaLeader".equals(request.getParameter("roleFilter")) ? "selected" : "" %>>Area Leader</option>
                                        </select>

                                        <button type="submit" class="btn btn-secondary">Lọc</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>



                    <!-- Bảng danh sách người dùng -->
                    <table class="table table-bordered table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Vai trò</th>
                                <th>Hành động</th>
                                <th>Địa chỉ</th>
                                <th>Chức năng</th>
                            </tr>
                        </thead>
                        <tbody id="userTable">
                            <%
                                for (User user : userList) {
                            %>
                            <tr>
                                <td><%= user.getUserId() %></td>
                                <td><%= user.getFullName() %></td>
                                <td><%= user.getEmail() %></td>
                                <td><%= user.getRole() %></td>
                                <td><%= user.getAddress() %></td>
                                <td>
                                    <a href="editUser.jsp?id=<%= user.getUserId() %>" class="btn btn-warning">Sửa</a>
                                    <a href="deleteUser.jsp?id=<%= user.getUserId() %>" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>

                        </tbody>
                    </table>
                </div>
            </main>

            <!-- Footer -->
            <footer
                id="pageFooter"
                class="text-center bg-danger pt-6 pb-3 pt-md-8 pb-md-5"
                >
                <div class="container">
                    <p>
                        <jsp:include page="../citizen/ftAreaWrap.jsp"></jsp:include>
                        </p>
                    </div>
                </footer>
            </div>
            <!-- include jQuery library -->
            <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <!-- include custom JavaScript -->
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <!-- include plugins JavaScript -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- include fontAwesome -->
        <script src="../../../kit.fontawesome.com/391f644c42.js"></script>
        <!-- Thêm jQuery và jQuery UI -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    </body>
</html>
