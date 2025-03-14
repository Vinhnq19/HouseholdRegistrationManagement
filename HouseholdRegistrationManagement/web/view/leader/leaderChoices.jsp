<%-- 
    Document   : leaderChoices
    Created on : Mar 12, 2025, 6:54:03 PM
    Author     : athuu
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <div class="flatpWrap position-relative mt-n8 mt-md-n18">
        <ul class="list-unstyled fabFeaturesList mb-0 d-flex flex-row justify-content-center">
            <li class="mx-3">
                <a href="${pageContext.request.contextPath}/view/leader/leaderHome.jsp"
                   class="fflColumn d-block text-center px-3 pt-4 pb-10">
                    <h2 class="mb-0">Trang chủ</h2>
                </a>
            </li>
            <li class="mx-3">
                <a href="${pageContext.request.contextPath}/view/leader/leaderApproval.jsp"
                   class="fflColumn d-block text-center px-3 pt-4 pb-10">
                    <h2 class="mb-0">Phê duyệt hồ sơ</h2>
                </a>
            </li>
            <li class="mx-3">
                <a href="javascript:void(0);"
                   class="fflColumn d-block text-center px-3 pt-4 pb-10">
                    <h2 class="mb-0">Gửi ý kiến</h2>
                </a>
            </li>
            <li class="mx-3">
                <a href="servicesSingle.html"
                   class="fflColumn d-block text-center px-3 pt-4 pb-10">
                    <h2 class="mb-0">Thông báo</h2>
                </a>
            </li>
        </ul>
    </div>
</div>
