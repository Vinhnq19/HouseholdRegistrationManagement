<%-- 
    Document   : home
    Created on : 2 thg 3, 2025, 15:19:18
    Author     : Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

    <!-- Mirrored from htmlbeans.com/html/egovt/home.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Mar 2025 07:35:43 GMT -->
    <head>
        <!-- set the encoding of your site -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- set the page title -->
        <title>Vienamese Public Services</title>
        <!-- inlcude google nunito sans font cdn link -->
        <link rel="preconnect" href="https://fonts.gstatic.com/" />
        <link
            href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,wght@0,300;0,400;0,600;0,700;1,300;1,400;1,600;1,700&amp;display=swap"
            rel="stylesheet"
            />
        <!-- inlcude google cabin font cdn link -->
        <link
            href="https://fonts.googleapis.com/css2?family=Cabin:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&amp;display=swap"
            rel="stylesheet"
            />
        <!-- include the site bootstrap stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <!-- include the site stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <!-- include theme color setting stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css" />
        <!-- include the site responsive stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
        <!-- include the rtl version stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rtl.css" />
    </head>
    <body>
        <!-- pageWrapper -->
        <div id="pageWrapper" class="ltr">
            <!-- phStickyWrap -->
            <div class="phStickyWrap">
                <!-- pageHeader -->
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../citizen/citizenHeader.jsp"></jsp:include>   
                    </header>

                </div>
                <main>
                    <div class="container">
                        <h2 class="text-center mt-4">Đăng ký hộ khẩu</h2>

                        <!-- Hiển thị thông báo từ Servlet -->
                    <c:if test="${not empty requestScope.message}">
                        <div class="alert ${requestScope.success ? 'alert-success' : 'alert-danger'}">
                            ${requestScope.message}
                        </div>
                    </c:if>

                    <c:if test="${not empty sessionScope.registration}">
                        <div class="card p-3 mt-3">
                            <h4>Thông tin đăng ký</h4>
                            <p><strong>Người đăng ký:</strong> ${sessionScope.userName}</p>
                            <p><strong>Loại đăng ký:</strong> ${sessionScope.registration.registrationType}</p>
                            <p><strong>Địa chỉ:</strong> ${sessionScope.registration.address}</p>
                            <p><strong>Ngày bắt đầu:</strong> ${sessionScope.registration.startDate}</p>
                            <p><strong>Ngày kết thúc:</strong> <c:out value="${sessionScope.registration.endDate}" default="Không có" /></p>
                            <p><strong>Tài liệu:</strong> 
                                <a href="${pageContext.request.contextPath}/${sessionScope.registration.documentPath}" target="_blank">Xem file</a>
                            </p>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/registration" method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="registrationType" class="form-label">Loại đăng ký:</label>
                            <select class="form-control" id="registrationType" name="registrationType" required>
                                <option value="Permanent">Thường trú</option>
                                <option value="Temporary">Tạm trú</option>
                                <option value="TemporaryStay">Lưu trú</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="address" class="form-label">Địa chỉ:</label>
                            <input type="text" class="form-control" id="address" name="address" placeholder="Nhập địa chỉ đầy đủ" required>
                        </div>

                        <div class="mb-3">
                            <label for="startDate" class="form-label">Ngày bắt đầu:</label>
                            <input type="date" class="form-control" id="startDate" name="startDate" required>
                        </div>
                        <div class="mb-3">
                            <label for="endDate" class="form-label">Ngày kết thúc (nếu có):</label>
                            <input type="date" class="form-control" id="endDate" name="endDate">
                        </div>
                        <div class="mb-3">
                            <label for="document" class="form-label">Tải lên CMND/CCCD hoặc giấy tờ chứng minh nơi ở:</label>
                            <input type="file" class="form-control" id="document" name="document" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Gửi đăng ký</button>
                    </form>
                </div>
            </main>
            <!-- ftAreaWrap -->
            <div class="ftAreaWrap position-relative bg-gDark fontAlter">
                <jsp:include page="../common/ftAreaWrap.jsp"></jsp:include>
                </div>
            </div>
            <!-- include jQuery library -->
            <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <!-- include custom JavaScript -->
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <!-- include plugins JavaScript -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- include fontAwesome -->
        <script src="../../../kit.fontawesome.com/391f644c42.js"></script>
    </body>

    <!-- Mirrored from htmlbeans.com/html/egovt/home.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Mar 2025 07:36:10 GMT -->
</html>