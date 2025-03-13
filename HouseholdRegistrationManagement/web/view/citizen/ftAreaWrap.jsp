<%-- 
    Document   : ftAreaWrap
    Created on : 6 thg 3, 2025, 22:56:13
    Author     : Vinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- footerAside -->
<aside class="footerAside pt-9 pb-sm-2 pt-xl-14 pb-xl-12">
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-6 col-md-5 col-xl-3 mb-6">
                <div class="ftLogo mt-md-1 mb-6">
                    <a href="${pageContext.request.contextPath}/view/citizen/citizenHome.jsp">
                        <img
                            src="${pageContext.request.contextPath}/img/VNPS2.png"
                            class="img-fluid"
                            alt="VNPS"
                            />
                    </a>
                </div>
            </div>
            <div
                class="col-12 col-sm-8 col-xl-4 mb-6"
                >
                <div class="ml-xl-n1 ml-xlwd-n7">
                    <h3 class="ftHeading text-white mb-5">
                        City News &amp; Updates
                    </h3>
                    <form action="#" class="ftSubscribeForm">
                        <label class="d-block mb-7"
                               >The latest Egovt news, articles,
                            and resources, sent straight to your
                            inbox every month.</label
                        >
                        <div class="input-group mb-3">
                            <input
                                type="text"
                                class="form-control form-control-lg"
                                placeholder="Enter Your Email"
                                />
                            <div class="input-group-append">
                                <button
                                    type="button"
                                    class="btn btnTheme d-flex font-weight-bold text-capitalize position-relative border-0 p-0"
                                    data-hover="Send"
                                    >
                                    <span
                                        class="d-block btnText"
                                        >Subscribe</span
                                    >
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</aside>
<!-- pageFooter -->
<footer
    id="pageFooter"
    class="text-center bg-dark pt-6 pb-3 pt-md-8 pb-md-5"
    >
    <div class="container">
        <p>
            <a href="javascript:void(0);">@Dịch vụ công quốc gia</a>
        </p>
    </div>
</footer>