<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include
        file="../include/header.jspf" %>
<link
        href="${path}/resources/dist/css/member/findEmail.css"
        rel="stylesheet"
        type="text/css"
/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- Page Content-->
<section class="py-5">
    <div class="container px-5">
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-6">

                <div id="content">
                    <div class="login_wrap">
                        <form commandName="memberVO" id="createForm" action="${path}/member/findResultPwd"
                              method="post">

                            <div id="findIdArea1" class="login_wrap_inner">

                                <h2 class="log_logo">계모임</h2>
                                <h1 class="fw-bolder text-center">비밀번호 찾기</h1>
                                <%--                                    <p>계모임 가입으로 목돈 모으기 성공! </p>--%>
                                <fieldset class="find_field">
                                    <dl>
                                        <dt>이메일</dt>
                                        <dd>
                                            <input
                                                    id="email"
                                                    name="email"
                                                    placeholder="가입 시 등록한 이메일을 입력해 주세요."
                                                    maxlength="25"
                                                    type="text"
                                            />
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>이름</dt>
                                        <dd>
                                            <input
                                                    id="name"
                                                    name="name"
                                                    placeholder="이름을 입력해 주세요."
                                                    maxlength="10"
                                                    type="text"
                                            />
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>주민등록번호</dt>
                                        <dd>
                                            <input
                                                    id="ssn"
                                                    name="ssn"
                                                    placeholder="주민등록번호를 입력해 주세요."
                                                    type="text"
                                            />
                                        </dd>
                                    </dl>
                                    <dl>
                                        <dt>휴대폰</dt>
                                        <dd>
                                            <input
                                                    id="phone"
                                                    name="phone"
                                                    placeholder="휴대폰 번호를 ‘-’ 없이 입력해 주세요."
                                                    maxlength="14"
                                                    type="text"
                                            />
                                        </dd>
                                    </dl>
                                </fieldset>

                                <div class="login_btns_wrap">
                                    <a
                                            class="login"
                                            id="findIdBtn"
                                            onclick="fnSubmit(); return false;"
                                            href="javascript:void(0)"
                                    >확인</a
                                    >
                                </div>
                                <div class="findidpw_btns_wrap">
                                    <p><a href="<%=request.getContextPath()%>/member/findEmail">이메일 찾기</a></p>
                                    <p><a href="<%=request.getContextPath()%>/member/login">로그인</a></p>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>


            </div>
        </div> <!--row -->
    </div> <!--container-->
</section>


<%--javascript--%>


<script>

    var path = "${pageContext.request.contextPath }";

    $(document).ready(function () {
        var msg = "${msg}";
        if (msg != "") {
            alert(msg);
        }
    });

    function fnSubmit() {

        var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var phone_rule = /^\d{2,3}\d{3,4}\d{4}$/;

        if ($("#email").val() == null || $("#email").val() == "") {
            alert("이메일을 입력해주세요.");
            $("#email").focus();

            return false;
        }

        if (!email_rule.test($("#email").val())) {
            alert("이메일 형식에 맞게 입력해주세요.");
            return false;
        }

        if ($("#name").val() == null || $("#name").val() == "") {
            alert("이름을 입력해주세요.");
            $("#name").focus();

            return false;
        }

        if ($("#ssn").val() == null || $("#ssn").val() == "") {
            alert("주민등록번호를 입력해주세요.");
            $("#phone").focus();

            return false;
        }


        if ($("#phone").val() == null || $("#phone").val() == "") {
            alert("휴대폰 번호를 입력해주세요.");
            $("#me_tel").focus();

            return false;
        }

        // if (!phone_rule.test($("#phone").val())) {
        //     alert("전화번호 형식에 맞게 입력해주세요.");
        //     return false;
        // }


        if (confirm("비밀번호를 찾으시겠습니까?")) {

            $("#createForm").submit();

            return false;
        }

    }

</script>

<%@ include file="../include/footer.jspf" %>
