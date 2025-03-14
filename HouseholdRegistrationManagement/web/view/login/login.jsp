<%-- 
    Document   : login
    Created on : Mar 12, 2025, 10:26:55 PM
    Author     : athuu
--%>
<%-- 
    Document   : leaderHome
    Created on : Mar 12, 2025, 4:19:41 PM
    Author     : athuu
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vietnamese Public Services - Login</title>
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
        <link rel="stylesheet" href="styles.css"> 
    </head>
    <body>
        <div
            class="hdTopBar py-2 py-xl-3 bg-danger d-none d-md-block"
            >
        </div>
        <div>
            <article
                class="d-flex w-100 position-relative ibColumn text-white overflow-hidden"
                >
                <div
                    class="alignHolder d-flex align-items-center w-100"
                    >
                    <div
                        class="align w-100 pt-20 pb-20 pt-md-40 pb-md-30 px-md-17"
                        >
                        <div class="container position-relative">
                            <div class="row" style="justify-content: center">
                                <div class="login-container" style="background-color: lightsteelblue ; padding: 20px; border-radius: 10px;">
                                    <h1 style="text-align: center">Đăng nhập</h1>
                                    <form action="LoginServlet" method="post"  style="margin-left:50px">
                                        <table class="login-table" border="0" >
                                            <tr>
                                                <td><label for="username">Email</label></td>
                                                <td><input type="text" id="username" name="username" required style="width: 100%; margin-right: 60px;"></td>
                                            </tr>
                                            <tr>
                                                <td><label for="password">Mật khẩu</label></td>
                                                <td><input type="password" id="password" name="password" required style="width: 100%; margin-right: 60px;"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                </td>
                                            </tr>
                                        </table>
                                        <br>
                                        <td><button type="submit" class="login-button" style="display: block; margin: auto; padding-left: 60px; padding-right: 60px">Đăng nhập</button>
                                    </form>
                                    <p style="text-align: center; margin-top: 10px;">
                                        Không có tài khoản, vui lòng <a href="register.jsp">Đăng kí</a>.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <span
                    class="ibBgImage bgCover position-absolute"
                    style="background-image: url(${pageContext.request.contextPath}/img/trongdo.avif)"
                    ></span>
            </article>
                    <div
            class="hdTopBar py-2 py-xl-3 bg-danger d-none d-md-block"
            >
        </div>
        </div>
        <section
            class="meetCouncilBlock position-relative pt-7 pt-md-9 pt-lg-14 pt-xl-20 pb-6"
            >
            <jsp:include page="../common/meetCouncilBlock.jsp"></jsp:include>
            </section>
            <div class="ftAreaWrap position-relative bg-gDark fontAlter">
            <jsp:include page="../common/ftAreaWrap.jsp"></jsp:include>
        </div>
    </body>
    <!-- Mirrored from htmlbeans.com/html/egovt/home.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 02 Mar 2025 07:36:10 GMT -->
</html>