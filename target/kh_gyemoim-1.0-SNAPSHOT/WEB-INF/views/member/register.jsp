
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../include/header.jspf" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="/resources/dist/css/member/register.css" rel="stylesheet" />



<body>
<!-- Page Content-->
<section class="py-5">
  <div class="container px-5 my-5 ">
    <div class="row gx-5 justify-content-center">
      <div class="col-lg-6">
        <div class="text-center mb-5">
          <h1 class="fw-bolder">회원가입</h1>
          <p>계모임 가입으로 목돈 모으기 성공! </p>


          <form action="/member/registerPost" method="post" name="form">
            <!--이메일-->
            <div class="col-11 ">
              <div class="text-start mb-5 passbox">
                <h5 class="fw-normal">이메일</h5>
                <div class="flex">
                  <input type="email" id="email" name="email" autocapitalize="off" autocomplete="off"
                         placeholder="gyemoim@naver.com">
                  <button type="button" action="/member/checkMember" class="btn btn-primary btn-md px-4 button-request" id="emailCheck"><span>중복 확인</span>
                  </button>
                  <span id="result"></span>
                </div>
              </div>
            </div>

            <!--비밀번호-->
            <div class="col-11">
              <div class="text-start mb-5 passbox">
                <h5 class="fw-normal">비밀번호</h5>
                <input type="password"  id = "password" name="password" autocapitalize="off" autocomplete="off"
                       placeholder="영문 대소문자와 숫자 4~12자리로 입력">
              </div>
            </div>

            <!--이름-->
            <div class="col-11">
              <div class="text-start mb-5 passbox">
                <h5 class="fw-normal">이름</h5>
                <input type="text" id = "name" name="name" autocapitalize="off" autocomplete="off" placeholder="이름 입력">
              </div>
            </div>
            <!--주민등록번호-->
            <div class="col-11">
              <div class="text-start mb-5 passbox">
                <h5 class="fw-normal">주민등록번호</h5>
                <input type="text"  id ="ssn" name="ssn" autocapitalize="off" autocomplete="off" placeholder="-빼고 숫자 입력">

              </div>
            </div>

            <!--휴대폰-->
            <div class="col-11">
              <div class="text-start mb-5 passbox">
                <h5 class="fw-normal">휴대폰</h5>
                 <div class="flex">
                  <input type="text"   id ="phone"  name="phone" autocapitalize="off" autocomplete="off" placeholder="-빼고 숫자 입력">

                </div>
              </div>
            </div>

            <!--주소-->
            <div class="col-11">
              <div class="text-start mb-5 passbox">
                <h5 class="fw-normal">주소</h5>
                <div class="flex">
                  <input type="text" name="addresscode" class="postcodify_postcode5" placeholder="우편번호 검색">
                  <button type="button" class="btn btn-primary btn-md px-4 button-request" id="postcodify_search_button"><span>검색</span></button>
                </div>
                <span class="input_area"><input type="text" name="address" class="postcodify_address my-1" placeholder="우편주소 검색"></span>
                <span class="input_area"><input type="text" name="addressdetail" placeholder="상세주소 입력"></span>
              </div>
            </div>


            <!--회원가입 완료-->
            <div class="col-11">
              <div class="text-start mb-5 passbox">
                <button type="submit" class="btn btn-primary btn-md px-4 button-complete" onclick="fnSubmit(); return false;">회원가입 완료</button>

              </div>
            </div>
          </form>

          <div class="row gx-5 justify-content-center">
            <div class="col-6">
              <div class="text-center mb-5">
                <p class="lead fw-normal text-muted">회원가입 완료 후, 계모임을 만들어보세요!</p>
                <a class="text-decoration-none" href="#!">
                  계모임 생성하기
                  <i class="bi-arrow-right"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>

<script>
var path = "${pageContext.request.contextPath }";

    $(document).ready(function () {
        var msg = "${msg}";
        if (msg != "") {
            alert(msg);
        }
    });

    function fnSubmit() {
        var email_rule =
           /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var password_rule = /^[0-9a-zA-Z]{4,12}$/;
        var phone_rule = /^\d{2,3}\d{3,4}\d{4}$/;


         if (!email_rule.test($("#email").val())) {
            alert("메일 형식에 맞게 입력해주세요.");
             return false;

            }else if (!password_rule.test($("#password").val())) {
             alert("비밀번호 형식에 맞게 입력해주세요");
             return false;

          }else if ($("#password").val() == null || $("#password").val() == "") {
            alert("비밀번호를 입력해주세요.");
            $("#password").focus();
            return false;

          }else if ($("#name").val() == null || $("#name").val() == "") {
               alert("이름을 입력해주세요.");
               $("#name").focus();
               return false;

          }else if ($("#ssn").val() == null || $("#ssn").val() == "") {
             alert("주민등록번호를 입력해주세요.");
             $("#ssn").focus();
             return false;

          }else if ($("#phone").val() == null || $("#phone").val() == "") {
            alert("휴대폰 번호를 입력해주세요.");
            $("#phone").focus();
            return false;

          }else if (!phone_rule.test($("#phone").val())) {
            alert("휴대폰 번호 형식에 맞게 입력해주세요.");
            return false;
        }else {
               joinInsertForm.action = '/member/registerPost';
               joinInsertForm.method = 'POST';
               return joinInsertForm.submit();
             }
           }
</script>


<!— 아이디 중복확인 —>
<script>
  $(function () {
    $("#emailCheck").click(function () {

      if ($("#email").val() != "") {

        $.ajax({
          type: 'GET',
          url: '/member/checkMember',
          data: 'email=' + $('#email').val(),
          dataType: 'json',
          success: function (result) {
            if (result == "0") {
              alert('사용 가능한 아이디입니다.');
            } else if (result == "1") {
              alert('이미 사용중인 아이디입니다.');
            }
          },
          error: function (a, b, c) {
            console.log(a, b, c);
          }

        });

      } else {
        alert('아이디를 입력하세요.');
        $('#email').focus();
      }
    });
  });
</script>

<!— 주소 API 스크립트 —>
<!— jQuery와 Postcodify를 로딩한다 —>
<script
="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>


<!— "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 —>
<script> $(function () {
  $("#postcodify_search_button").postcodifyPopUp();
}); </script>

<%@ include file="../include/footer.jspf" %>


