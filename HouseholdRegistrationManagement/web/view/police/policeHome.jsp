<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý Hộ Khẩu - Công An Khu Vực</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
        <style>
            
            .bg-container {
                background-image: url('https://gitiho.com/caches/p_medium_large//uploads/338054/images/image_5-hinh-nen-powerpoint-trong-dong.jpg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                height: 100vh; /* Chiều cao full màn hình */
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
                    <jsp:include page="../police/policeHeader.jsp"></jsp:include>   
                    </header>

                    <div class="bg-container">
                        
                </div>
                    <div class="ftAreaWrap position-relative bg-gDark fontAlter">
                            <jsp:include page="../common/ftAreaWrap.jsp"></jsp:include>
                        </div>
                </body>
                </html>

