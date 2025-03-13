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
            body {
                font-family: "Times New Roman", Times, serif;
                background-color: #f8f9fa;
                text-align: center;
            }
            .container {
                width: 80%;
                margin: auto;
                padding-top: 20px;
            }
            h1 {
                color: white; /* Đổi màu chữ thành trắng */
                font-size: 50px; /* Làm chữ to hơn */
                font-weight: bold; /* Làm chữ đậm */
                text-align: center; /* Căn giữa */
                text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7); /* Tạo hiệu ứng bóng để nổi bật hơn */
                margin-top: 20px; /* Tạo khoảng cách giữa tiêu đề và thanh điều hướng */
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

