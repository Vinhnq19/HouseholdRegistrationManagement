<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <!-- Metadata -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Vietnamese Public Services - Công dân</title>

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
    </head>
    <body>
        <div id="pageWrapper" class="ltr">
            <!-- Header -->
            <div class="phStickyWrap">
                <header id="pageHeader" class="bg-white">
                    <jsp:include page="../citizen/citizenHeader.jsp"></jsp:include>   
                </header>
            </div>

            <!-- Main Content -->
            <main>
                <!-- Slider -->
                <div class="introBlock ibSlider">
                    <jsp:include page="../common/ibSlider.jsp"></jsp:include>
                </div>
                
                <!-- Features -->
                <aside id="featuresAsideBlock" class="featuresAsideBlock position-relative text-white">
                    <jsp:include page="../citizen/featuresAsideBlock.jsp"></jsp:include>
                </aside>
                
                <!-- Meet Council -->
                <section class="meetCouncilBlock position-relative pt-7 pt-md-9 pt-lg-14 pt-xl-20 pb-6">
                    <jsp:include page="../common/meetCouncilBlock.jsp"></jsp:include>
                </section>
            </main>

            <!-- Footer -->
            <div class="ftAreaWrap position-relative bg-gDark fontAlter">
                <jsp:include page="../citizen/ftAreaWrap.jsp"></jsp:include>
            </div>
        </div>

        <!-- Scripts -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jqueryCustom.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="https://kit.fontawesome.com/391f644c42.js"></script>
    </body>
</html>