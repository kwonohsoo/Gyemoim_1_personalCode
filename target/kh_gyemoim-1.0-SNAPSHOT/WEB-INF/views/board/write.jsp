<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jspf" %>
<!-- jQuery 3.1.1 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<link href="resources/dist/css/board/write.css" rel="stylesheet"/>

<section class="py-5">
  <div class="container px-5">
    <div class="row justify-content-center">
      <div class="col-11 ">
        <div class="title text-center mb-3">
          <h1>커뮤니티 글쓰기</h1>
          <p>계모임의 소식을 전합니다</p>
        </div>
        <form action="/writePost" method="post" enctype="multipart/form-data" id="writeConn">
          <input type="hidden" id="write-input-uNo" name="uno" value="${login.getUno()}">

          <div class="write-attr">
            <label class="attr-name" for="write-input-title">제목</label>
            <input type="text" id="write-input-title" class="form-control" name="title" value="" placeholder="제목을 입력해주세요" required>
          </div>
          <div class="write-attr">
            <label class="attr-name" for="write-input-writer">작성자</label>
            <input type="text" id="write-input-writer" class="form-control" name="name" value="${login.name}" readonly>
          </div>
          <div class="secret-attr">
            <label class="attr-name" for="write-input-writer">공개설정</label>
            <div class="secretF-9">
              <div class="secret-detail">
                <input type="radio" name="secret" id="write-cs_open" value="P" class="radio" checked required/>
                <label class="attr-name" for="write-cs_open">공개</label>
              </div>
              <div class="secret-detail">
                <input type="radio" name="secret" id="write-cs_open" value="S" class="radio" required/>
                <label class="attr-name" for="write-cs_open">비공개</label>
              </div>
            </div>
          </div>
          <div class="write-attr">
            <textarea class="form-control" name="content" placeholder="내용을 입력해주세요" required></textarea>
          </div>

          <div class="write-attr Attached">
            <label class="attr-name" for="upload" multipart>첨부파일</label>
            <div class="attr-img">
              <input type="file" class="" name="UploadFile" value="" id="theFile">
              <img id="ImgPreview" src="" class="preview"/>
              <input type="button" id="removeImage" value="X" class="btn-rmv"/>
            </div>
          </div>


          <div class="write-btn-area text-center">
            <button type="submit" class="btn btn-primary btn-lg px-4 me-sm-3"/>
            작성하기</button>
          </div>
        </form>
      </div>
    </div>
  </div>


  <script>
    function readURL(input, imgControlName) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $(imgControlName).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }

    $("#theFile").change(function () {
      var imgControlName = "#ImgPreview";
      readURL(this, imgControlName);
      $('.preview').addClass('it');
      $('.btn-rmv').addClass('rmv');
    });
    $("#removeImage").click(function (e) {
      e.preventDefault();
      $("#theFile").val("");
      $("#ImgPreview").attr("src", "");
      $('.preview').removeClass('it');
      $('.btn-rmv').removeClass('rmv');
    });

  </script>

</section>

<%@ include file="../include/footer.jspf" %>