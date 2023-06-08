<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include
        file="../include/header.jspf" %>
<link href="${path}/resources/dist/css/member/findResultPwd.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Page Content-->
<section class="py-5 mhc-150 d-flex">
    <div class="container px-5 d-flex">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-6">
                <div id="findIdArea1" class="login_wrap_inner">
                    <h2 class="log_logo">계모임</h2>
                    <h1 class="fw-bolder text-center">이메일을 확인해 주세요.</h1>
                    <fieldset class="find_field">
                        <c:choose>
                            <c:when test="${empty memberVO}">
                                <p class="">조회결과가 없습니다.</p>
                            </c:when>
                            <c:otherwise>
                                <p class="">${memberVO.email}</p>
                            </c:otherwise>
                        </c:choose>
                    </fieldset>


                    <div class="login_frm_guide">
                        <ul class="p-0">
                            <li>
                                <a href="<%=request.getContextPath()%>/member/findPwd">비밀번호 찾기</a>
                            </li>
                            <li>｜</li>
                            <li>
                                <a href="<%=request.getContextPath()%>/member/login">로그인</a>
                            </li>
                            <li>｜</li>
                            <li>
                                <a href="<%=request.getContextPath()%>/member/register">회원가입</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="../include/footer.jspf" %>
<script>
    var path = "${pageContext.request.contextPath }";

    $(document).ready(function () {
    });
</script>