<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page isELIgnored="false" %>

<%@ include file="../include/header.jspf" %>
<!-- jQuery 3.1.1 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<link href="/resources/dist/css/board/read.css" rel="stylesheet"/>

<section class="py-5">
  <div class="container px-5">
    <div class="row justify-content-center">
      <div class="col-11">
        <div class="title">
          <h1>커뮤니티</h1>
          <p>계모임의 소식을 전합니다</p>
        </div>
        <div class="container">
          <table class="table text-center">
            <tr>
              <td><h2>제목: ${board.getTitle()}
              </h2></td>
            </tr>
            <tr>
              <td class="read-detail">
                <div><b>작성자 : </b>${board.getName()}</div>
                <div><b>작성일자 : </b><fmt:formatDate value="${board.getWriteDate()}" pattern="yyyy-MM-dd"/></div>
                <div><b>조회수 : </b>${board.getViews()}</div>
              </td>
            </tr>
            <tr>
              <td class="read-content p-3">${board.getContent()}</td>
            </tr>

            <c:choose>
              <c:when test="${attached.getFileName() == null}">

              </c:when>
              <c:when test="${attached.getFileName() != null}">
                <tr>
                  <td class="text-start AttachedFile">
                    <b>첨부파일 : </b> <a
                          href="/fileDownload?fileName=${attached.getFileName()}">${attached.getFileName()}<br>
                    <div class="fileImg pt-3"><img id="ImgPreview" name="fileName"
                                                   src="/fileDownload?fileName=${attached.getFileName()}"
                                                   class="preview"/>
                    </div>
                    <input type="hidden" id="write-input-bid" name="fileName" value="${attached.getFileName()}">
                  </a>
                  </td>
                </tr>
              </c:when>
            </c:choose>

          </table>

          <!--댓글 시작-->
          <div id="replyArea" class="card bg-light replyArea">
            <div class="card-body">
              <textarea class="form-control" name="comm" id="newReplyComm" cols="30" rows="3"
                        placeholder="댓글을 입력해주세요"></textarea>
              <input class="form-control" type="hidden" id="newReplyBid" name="bid" value="${board.getBid()}">
              <input class="form-control" type="hidden" id="newReplyUNo" name="uno" value="${login.getUno()}">
              <input class="form-control" type="hidden" id="newReplyName" name="name" value="${login.getName()}">

              <button type="submit" class="btn btn-primary btn-md px-3 mt-2 me-sm-3 replyAddBtn" id="replyAddBtn">작성</button>

              <table id="reply" class="table mt-3">
                <c:forEach var="reply" items="${reply}">
                  <tr>
                    <td class="replyInfo">
                    <div class="fw-bold pb-0">${reply.getName()}</div>
                    <div class="small fst-italic"><fmt:formatDate value="${reply.getRepDate()}" pattern="yyyy-MM-dd"/></div></td>
                    </td>
                    </tr>
                    <tr>
                    <td>
                      <input class="reply-contents form-control newModifyComm" id="newModifyComm" name="comm" value="${reply.getComm()}" readonly>
                      <input class="form-control" type="hidden" id="newReplyRno" name="rno" value="${reply.getRno()}">

                      <c:choose>
                        <c:when test="${reply.uno eq login.uno}">
                          <button type="submit" id="fakeReplyModifyBtn" class="fakeReplyModifyBtn btn-primary">수정하기</button>
                          <button type="submit" id="replyModifyBtn" class="replyModifyBtn btn-primary" hidden>수정하기</button>
                          <button type="submit" id="replyDeleteBtn" class="replyDeleteBtn btn-danger">삭제하기</button>
                        </c:when>
                      </c:choose>

                    </td>
                  </tr>
                </c:forEach>
              </table>

            </div>
          </div>

          <div class="read-btn-area mt-4 text-center">
            <c:choose>
              <c:when test="${board.uno eq login.uno}">
                <input type="button" value="목록보기" class="btn btn-primary btn-lg px-4 me-sm-3"
                       onclick="location.href='/board/list'"/>
                <input type="button" value="수정하기" class="btn btn-primary btn-lg px-4 me-sm-3"
                       onclick="location.href='/modify?bid=${board.getBid()}'"/>
                <input type="button" value="삭제하기" class="btn btn-danger btn-lg px-4 me-sm-3"
                       onclick="location.href='/delete?bid=${board.getBid()}&uno=${login.uno}'"/>
              </c:when>
              <c:otherwise>
                <input type="button" value="목록보기" class="btn btn-primary btn-lg px-4 me-sm-3"
                       onclick="location.href='/board/list'"/>
              </c:otherwise>
            </c:choose>
          </div>

        </div>
      </div>
    </div>
  </div>


</section>


<!— 댓글작성 —>
<script type="text/javascript">
  $(function () {
    $("#replyAddBtn").on("click", function () {
        console.log("dfs")
      let repBid = "${board.getBid()}";
      let repUno = "${login.getUno()}";

      let replytextObj = $("#newReplyComm");
      let replytext = replytextObj.val();

      let replyNameObj = $("#newReplyName");
      let replyName = replyNameObj.val();

      $.ajax({
        type: 'post',
        url: '/replyWrite/',
        headers: {
          "Content-Type": "application/json",
          "X-HTTP-Method-Override": "POST"
        },
        data: JSON.stringify({
          "bid": repBid,
          "uno": repUno,
          "comm": replytext,
          "name": replyName
        }),
        success: function (result) {
          console.log("result: " + result);
          if (result == 'SUCCESS') {
                location.reload();
         }
        },
        error: function () {
          console.log("ajax 통신 실패");
        }
      });
    });
  });

</script>

<!— 댓글수정 —>
<script type="text/javascript">
$(document).ready(function(){
    $("#replyModifyBtn").on("click", function () {

      let repRno = $("#newReplyRno").val();

      let modifytextObj = $("#newModifyComm");
      let modifytext = modifytextObj.val();

      $.ajax({
        type: 'post',
        url: '/replyModify',
        headers: {
          "Content-Type": "application/json",
          "X-HTTP-Method-Override": "POST"
        },
        data: JSON.stringify({

          "rno": repRno,

          "comm": modifytext,

        }),
        success: function (result) {
          alert("댓글 수정 성공");
          console.log("result: " + result);
          if (result == 'SUCCESS') {
            location.reload();
          }
        },
        error: function () {
          console.log("댓글 수정 실패");
        }
      });
    });
  });

</script>


<!— 댓글삭제 —>
<script type="text/javascript">
  $(function () {
    $("#replyDeleteBtn").on("click", function () {
      alert("댓글을 삭제합니다.");

      let repRno = $("#newReplyRno").val();

      /* let replytextObj = $("#newReplyComm");
       let replytext = replytextObj.val();*/


      $.ajax({
        type: 'post',
        url: '/replyDelete/',
        headers: {
          "Content-Type": "application/json",
          "X-HTTP-Method-Override": "POST"
        },
        data: JSON.stringify({

          "rno": $("#newReplyRno").val()


        }),
        success: function (result) {
          console.log("result: " + result);
          if (result == 'SUCCESS') {
            location.reload();
            alert("댓글 삭제 성공");
          }
        },
        error: function () {
          console.log("댓글 삭제 실패");
        }
      });
    });
  });
</script>

<!-- 댓글 수정하기 버튼 속성추가 -->
<script type="text/javascript">
$(document).ready(function(){
    $("#fakeReplyModifyBtn").on("click", function () {
        $("#newModifyComm").attr('readonly', false);
        $("#replyModifyBtn").attr('hidden', false);
        $("#fakeReplyModifyBtn").attr('hidden', true);
    });
  });
</script>

<%@ include file="../include/footer.jspf" %>