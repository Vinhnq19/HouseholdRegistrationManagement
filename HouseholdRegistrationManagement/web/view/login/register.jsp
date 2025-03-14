<%-- 
    Document   : register
    Created on : Mar 12, 2025, 10:27:02 PM
    Author     : athuu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vietnamese Public Services - Register</title>
        <link rel="preconnect" href="https://fonts.gstatic.com/" />
        <link
            href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700&amp;display=swap"
            rel="stylesheet"
        />
        <link
            href="https://fonts.googleapis.com/css2?family=Cabin:wght@400;500;600;700&amp;display=swap"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colors.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/rtl.css" />
        <link rel="stylesheet" href="styles.css"> 
    </head>
    <body>
        <div class="hdTopBar py-2 py-xl-3 bg-danger d-none d-md-block"></div>
        <div>
            <article class="d-flex w-100 position-relative ibColumn text-white overflow-hidden">
                <div class="alignHolder d-flex align-items-center w-100">
                    <div class="align w-100 pt-20 pb-20 pt-md-40 pb-md-30 px-md-17">
                        <div class="container position-relative">
                            <div class="row" style="justify-content: center">
                                <div class="login-container" style="background-color: lightsteelblue; padding: 20px; border-radius: 10px;">
                                    <h1 style="text-align: center">Đăng ký</h1>
                                    <form action="RegisterServlet" method="post" style="margin-left:50px">
                                        <table class="login-table" border="0">
                                            <tr>
                                                <td><label for="fullname">Họ và tên</label></td>
                                                <td><input type="text" id="fullname" name="fullname" required style="width: 100%; margin-right: 60px;"></td>
                                            </tr>
                                            <tr>
                                                <td><label for="email">Email</label></td>
                                                <td><input type="email" id="email" name="email" required style="width: 100%; margin-right: 60px;"></td>
                                            </tr>
                                            <tr>
                                                <td><label for="password">Mật khẩu</label></td>
                                                <td><input type="password" id="password" name="password" required style="width: 100%; margin-right: 70px;"></td>
                                            </tr>
                                            <tr>
                                                <td><label for="confirmPassword">Nhập lại mật khẩu</label></td>
                                                <td><input type="password" id="confirmPassword" name="confirmPassword" required style="width: 100%; margin-right: 70px;"></td>
                                            </tr>
                                        </table>
                                        <br>
                                        <td><button type="submit" class="login-button" style="display: block; margin: auto; padding-left: 60px; padding-right: 60px">Đăng ký</button></td>
                                    </form>
                                    <p style="text-align: center; margin-top: 10px;">
                                        Đã có tài khoản? <a href="login.jsp">Đăng nhập</a>.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <span class="ibBgImage bgCover position-absolute" style="background-image: url(${pageContext.request.contextPath}/img/trongdo.avif)"></span>
            </article>
            <div class="hdTopBar py-2 py-xl-3 bg-danger d-none d-md-block"></div>
        </div>
        <section class="meetCouncilBlock position-relative pt-7 pt-md-9 pt-lg-14 pt-xl-20 pb-6">
            <jsp:include page="../common/meetCouncilBlock.jsp"></jsp:include>
        </section>
        <div class="ftAreaWrap position-relative bg-gDark fontAlter">
            <jsp:include page="../common/ftAreaWrap.jsp"></jsp:include>
        </div>
    </body>
</html>
