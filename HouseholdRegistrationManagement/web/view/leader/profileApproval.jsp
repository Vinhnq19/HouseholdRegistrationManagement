<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <!-- Metadata -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Vietnamese Public Services - Duyệt hồ sơ đăng ký</title>

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
        </style>
    </head>
    <body>
        <div id="pageWrapper" class="ltr">
            <!-- Header -->
            <div class="phStickyWrap">
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../leader/leaderHeader.jsp"></jsp:include>   
                    </header>
                </div>

                <!-- Main Content -->
                <main>
            <div class="container section">
                <h2 class="text-center mt-4">Duyệt Hồ Sơ Đăng Ký</h2>

                <!-- Nút chọn loại đơn -->
                <div class="text-center my-3">
                    <a href="?filter=household" class="btn btn-primary ${filter == 'household' ? 'active' : ''}">📌 Đăng ký hộ khẩu</a>
                    <a href="?filter=separation" class="btn btn-success ${filter == 'separation' ? 'active' : ''}">📂 Tách hộ khẩu</a>
                </div>

                <!-- Hiển thị bảng Đăng ký hộ khẩu -->
                <c:if test="${filter == 'household'}">
                    <h4 class="text-center">📌 Đăng ký hộ khẩu</h4>
                    <c:choose>
                        <c:when test="${empty householdRegistrations}">
                            <p class="text-center">Không có hồ sơ nào cần duyệt.</p>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-bordered mt-3">
                                <thead class="table-light">
                                    <tr>
                                        <th>Mã</th>
                                        <th>Loại</th>
                                        <th>Địa chỉ</th>
                                        <th>Tài liệu</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="r" items="${householdRegistrations}">
                                        <tr>
                                            <td>${r.registrationId}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${r.registrationType == 'Permanent'}">
                                                        <span class="badge bg-warning text-dark">Thường trú</span>
                                                    </c:when>
                                                    <c:when test="${r.registrationType == 'Temporary'}">
                                                        <span class="badge bg-success">Tạm trú</span>
                                                    </c:when>
                                                    <c:when test="${r.registrationType == 'TemporaryStay'}">
                                                        <span class="badge bg-danger">Lưu trú</span>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>${r.address}</td>
                                            <td>
                                                <c:if test="${not empty r.documentPath}">
                                                    <a href="${pageContext.request.contextPath}/${r.documentPath}" target="_blank">Xem file</a>
                                                </c:if>
                                            </td>
                                            <td>
                                                <form action="${pageContext.request.contextPath}/approve" method="post" style="display:inline;">
                                                    <input type="hidden" name="registrationId" value="${r.registrationId}">
                                                    <button type="submit" name="action" value="approve" class="btn btn-success">Duyệt</button>
                                                </form>
                                                    <form action="${pageContext.request.contextPath}/approve" method="post" style="display:inline;">
                                                        <input type="hidden" name="registrationId" value="${r.registrationId}">
                                                        <button type="submit" name="action" value="reject" class="btn btn-danger">Từ chối</button>
                                                    </form>
                                            </td>
                                            </tr>
                                    </c:forEach>
                                    </tbody>
                            </table>    
                        </c:otherwise>
                    </c:choose>
                </c:if>

                <!-- Hiển thị bảng Tách hộ khẩu -->
                <c:if test="${filter == 'separation'}">
                    <h4 class="text-center">📂 Tách hộ khẩu</h4>
                    <c:choose>
                        <c:when test="${empty separationRegistrations}">
                            <p class="text-center">Không có hồ sơ nào cần duyệt.</p>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-bordered mt-3">
                                <thead class="table-light">
                                    <tr>
                                        <th>Mã</th>
                                        <th>Địa chỉ cũ</th>
                                        <th>Địa chỉ mới</th>
                                        <th>Tài liệu</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="r" items="${separationRegistrations}">
                                    <tr>
                                        <td>${r.registrationId}</td>
                                        <td><c:out value="${r.comments}" default="Không có" /></td>
                                    <td>${r.address}</td>
                                    <td>
                                    <c:if test="${not empty r.documentPath}">
                                        <a href="${pageContext.request.contextPath}/${r.documentPath}" target="_blank">Xem file</a>
                                    </c:if>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/approve" method="post" style="display:inline;">
                                            <input type="hidden" name="registrationId" value="${r.registrationId}">
                                            <button type="submit" name="action" value="approve" class="btn btn-success">Duyệt</button>
                                        </form>
                                        <form action="${pageContext.request.contextPath}/approve" method="post" style="display:inline;">
                                            <input type="hidden" name="registrationId" value="${r.registrationId}">
                                            <button type="submit" name="action" value="reject" class="btn btn-danger">Từ chối</button>
                                        </form>
                                    </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>  
                        </c:otherwise>
                    </c:choose>
                </c:if>
                </div>
                    </main>

                    <!-- Footer -->
            <footer
                    id="pageFooter"
                    class="text-center bg-danger pt-6 pb-3 pt-md-8 pb-md-5"
                >
                    <div class="container">
                        <p>
                            <jsp:include page="../common/ftAreaWrap.jsp"></jsp:include>
                        </p>
                    </div>
                </footer>
        </div>

        <!-- Scripts -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="https://kit.fontawesome.com/391f644c42.js"></script>
    </body>
</html>