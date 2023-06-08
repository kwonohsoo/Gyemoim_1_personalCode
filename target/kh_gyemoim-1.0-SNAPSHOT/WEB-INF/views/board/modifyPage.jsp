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
          <h1>커뮤니티 수정하기</h1>
          <p>계모임의 소식을 전합니다</p>
        </div>
        <form action="/modifyPost" method="post" enctype="multipart/form-data">

          <input type="hidden" id="write-input-bid" name="bid" value="${board.getBid()}">
          <input type="hidden" id="write-input-uNo" name="uno" value="${login.getUno()}">

          <div class="write-attr">
            <label class="attr-name" for="write-input-title">제목</label>
            <input type="text" id="write-input-title" name="title" value="${board.getTitle()}" class="form-control" required>
          </div>
          <div class="write-attr">
            <label class="attr-name" for="write-input-writer">작성자</label>
            <input type="text" id="write-input-writer" name="name" value="${board.getName()}" class="form-control" readonly>
          </div>

          <div class="secret-attr">
            <label class="attr-name" for="write-input-writer">공개설정</label>
            <div class="secretF-9">
              <c:choose>
                <c:when test="${board.getSecret() == 'S'}">
                  <div class="secret-detail">
                    <input type="radio" name="secret" id="write-cs_open" value="P" class="radio"/>
                    <label class="attr-name" for="write-cs_open">공개</label>
                  </div>
                  <div class="secret-detail">
                    <input type="radio" name="secret" id="write-cs_open" value="S" class="radio" checked/>
                    <label class="attr-name" for="write-cs_open">비공개</label>
                  </div>
                </c:when>
                <c:when test="${board.getSecret() == 'P'}">
                  <div class="secret-detail">
                    <input type="radio" name="secret" id="write-cs_open" value="P" class="radio" checked/>
                    <label class="attr-name" for="write-cs_open">공개</label>
                  </div>
                  <div class="secret-detail">
                    <input type="radio" name="secret" id="write-cs_open" value="S" class="radio"/>
                    <label class="attr-name" for="write-cs_open">비공개</label>
                  </div>
                </c:when>
              </c:choose>
            </div>
          </div>
          <div class="write-attr">
            <textarea class="form-control" name="content" required>${board.getContent()}</textarea>
          </div>

          <div class="write-attr Attached">
            <label class="attr-name" for="upload" multipart>첨부파일</label>
            <div class="attr-img">
<!--
   <c:choose>
      <c:when test="${attached.getFileName() eq ''}">
    <input type="file" class="" name="UploadFile" value="${attached.getFileName()}" id="theFile">
        </c:when>
      <c:when test="${attached.getFileName() ne ''}">
       <img id="ImgPreview" name="fileName" src="/fileDownload?fileName=${attached.getFileName()}"
                         class="preview it"/>
                    <input type="button" id="removeImage" value="X" class="btn-rmv rmv"/>
    </c:when>
        </c:choose>
-->
    <input type="file" class="d-none" name="UploadFile" value="${attached.getFileName()}" id="theFile" onclick="imgClick()">
    <div id="theImg" class="d-none">
    <img id="ImgPreview" name="fileName" src="/fileDownload?fileName=${attached.getFileName()}" class="preview it" onchange="imgChange(this.src)" />
    <input type="button" id="removeImage" value="X" class="btn-rmv rmv"/>
    </div>


            </div>
          </div>
          <div class="write-btn-area text-center">
            <button type="submit" class="btn btn-primary btn-lg px-4 me-sm-3"/>
            수정하기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>


<script type="text/javascript">
  <!--첨부파일 이미지 미리보기-->
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

  <!--첨부파일 여부 확인해서 class 추가-->
if('${attached.getFileName()}' === ''){
    document.getElementById('theFile').classList.remove('d-none');
    document.getElementById('theFile').classList.add('d-block');
    document.getElementById('theImg').classList.remove('d-block');
    document.getElementById('theImg').classList.add('d-none');
}else{
    document.getElementById('theFile').classList.remove('d-block');
    document.getElementById('theFile').classList.add('d-none');
    document.getElementById('theImg').classList.remove('d-none');
    document.getElementById('theImg').classList.add('d-block');
}

const removeImage = document.getElementById('removeImage');
removeImage.addEventListener('click', function(){
      document.getElementById('theFile').classList.remove('d-none');
      document.getElementById('theFile').classList.add('d-block');
      document.getElementById('theImg').classList.remove('d-block');
      document.getElementById('theImg').classList.add('d-none');
});

function imgClick() {
    const imgSrc = document.getElementById('ImgPreview').src;
    if(imgSrc) {
        document.getElementById('theFile').classList.remove('d-block');
        document.getElementById('theFile').classList.add('d-none');
        document.getElementById('theImg').classList.remove('d-none');
        document.getElementById('theImg').classList.add('d-block');
    }
}

</script>


<%@ include file="../include/footer.jspf" %>