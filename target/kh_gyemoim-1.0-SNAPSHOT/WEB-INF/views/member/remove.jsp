<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jspf" %>
<link href="/resources/dist/css/member/remove.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<body>
<!-- Page Content-->
<section class="py-5 h-100">
  <div class="container px-5 my-5">
    <div class="row gx-5">
      <div class="col-lg-12">
        <div>
          <div class="col-lg-3" style="margin:0 auto">
            <article><!--본문 시작-->
              <h1 class="fw-bolder mb-4 text-center">회원탈퇴</h1>
                <form method="post" id="form" onsubmit="return false;">
                <input type="hidden"
                        name="password"
                        id="password1"
                        class="form-control "
                        value="${login.password}"
                        >
                   <input type="password"
                          name="password2"
                          id="password2"
                          class="form-control "
                          value=""
                          placeholder="비밀번호를 입력해주세요"
                          >

                    <div class="btnArea join-footer py-5 text-center">
                      <button type="submit" onclick="isSame()" class="btn btn-primary btn-lg px-4 me-sm-3">탈퇴하기</button>
                      <button type="button" class="btn btn-primary btn-lg px-4 me-sm-3"
                      onclick="location.href='<%=request.getContextPath()%>/'">메인화면</button>
                    </div>
                </form>
        </div>
      </div>
    </div>
  </div>
</section>

 <%@ include file="../include/footer.jspf" %>

 <!-- 비밀번호 일치여부 -->
 <script>
  function isSame() {
     var password1 = document.getElementById('password1');
     var password2 = document.getElementById('password2');
     var form = document.getElementById("form");
  console.log(document.getElementById('password2').value);
     if (document.getElementById('password1').value!=document.getElementById('password2').value) {
          alert('비밀번호가 일치하지 않습니다.');
     }
     else if(document.getElementById('password1').value==document.getElementById('password2').value){
            if(confirm('회원탈퇴를 진행합니다.')){
              form.action = "http://localhost:8080/member/delete";
              form.mothod = "POST";
              form.submit();
              alert('탈퇴가 완료되었습니다.');
            }
            else{return false;}
          }
 }
 </script>
