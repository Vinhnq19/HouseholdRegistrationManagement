
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Trạng thái hồ sơ - Vietnamese Public Services</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    </head>
    <body>
        <div id="pageWrapper">
            <div class="phStickyWrap">
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../citizen/citizenHeader.jsp"></jsp:include>
                    </header>
                </div>
                <main>
                    <div class="container">
                        <h2 class="text-center mt-4">Trạng thái hồ sơ đăng ký</h2>
                    <c:choose>
                        <c:when test="${empty registrations}">
                            <p class="text-center">Bạn chưa có hồ sơ nào</p>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-bordered mt-3">
                                <thead class="table-light">
                                    <tr>
                                        <th>Mã đăng ký</th>
                                        <th>Loại đăng ký</th>
                                        <th>Địa chỉ</th>
                                        <th>Ngày bắt đầu</th>
                                        <th>Ngày kết thúc</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="r" items="${registrations}" varStatus="status">
                                        <tr>
                                            <td>${r.registrationId}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${r.registrationType == 'Permanent'}">
                                                        <span class="badge bg-warning text-dark">Thường trú</span>
                                                    </c:when>
                                                    <c:when test="${r.registrationType == 'Temporary'}">
                                                        <span class="badge bg-success">Lưu trú</span>
                                                    </c:when>
                                                    <c:when test="${r.registrationType == 'TemporaryStay'}">
                                                        <span class="badge bg-danger">Tạm trú</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">Không xác định</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${r.address}</td>
                                            <td>${r.startDate}</td>
                                            <td>${empty r.endDate ? 'Không có' : r.endDate}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${r.status == 'Pending'}">
                                                        <span class="badge bg-warning text-dark">Chờ duyệt</span>
                                                    </c:when>
                                                    <c:when test="${r.status == 'Approved'}">
                                                        <span class="badge bg-success">Đã duyệt</span>
                                                    </c:when>
                                                    <c:when test="${r.status == 'Rejected'}">
                                                        <span class="badge bg-danger">Bị từ chối</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">Không xác định</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>    
                        </c:otherwise>
                    </c:choose>

                </div>


            </main>
            <div class="ftAreaWrap position-relative bg-gDark fontAlter">
                <jsp:include page="../common/ftAreaWrap.jsp"></jsp:include>
                </div>
            </div>

            <!-- include jQuery library -->
            <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
    </body>
</html>
