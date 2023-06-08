<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jspf" %>

<link href="<c:url value="/resources/dist/css/board/list.css"/>" rel="stylesheet"/>

<section class="py-5">
  <div class="container px-5">
    <div class="row justify-content-center">
      <div class="col-11 ">
        <div class="title">
          <h1>커뮤니티</h1>
          <p>계모임의 소식을 전합니다</p>
        </div>

        <!-- 검색 시작 -->
        <div class="search-container row justify-content-center ">
          <%-- 제목/내용/작성자 기준으로 게시글 검색하는 코드 --%>
          <form class="col-8 search-box" name="search_form" action="/board/getSearchList">
            <select name="type" class="search-item">
              <option selected value="title">제목</option>
              <option value="content">내용</option>
              <option value="name">작성자</option>
            </select>
            <input class="form-control search-item" type="text" id="search-input" name="keyword" placeholder="검색어를 입력하세요." />
            <button id="search-button" onclick="formSubmit()" class="btn btn-primary search-item">검색</button>
          </form>
        </div>
        <!-- 검색 끝 -->

        <table class="table table-hover">
          <colgroup>
            <col width="10%"/>
            <col width="40%"/>
            <col width="15%"/>
            <col width="25%"/>
            <col width="10%"/>
          </colgroup>
          <thead>
          <th class="text-center">글번호</th>
          <th>제목</th>
          <th class="text-center">작성자</th>
          <th class="text-center">작성일</th>
          <th class="text-center">조회수</th>
          </thead>
          <c:forEach var="list" varStatus="status" items="${listAll}">
            <tr>
              <td class="text-center">${(paging.total - status.index) - ((paging.nowPage - 1) * 10)}</td>

              <c:choose>
                <c:when test="${list.secret eq 'S'}">
                  <c:choose>
                    <c:when test="${list.uno eq login.uno}">
                      <td>
                        <a href="read?bid=${list.getBid()}">${list.getTitle()}
                        </a>
                      </td>
                    </c:when>
                    <c:otherwise>
                      <td>
                        <p onclick="secret()">비밀글 입니다.</p>
                      </td>
                    </c:otherwise>
                  </c:choose>
                </c:when>

                <c:otherwise>
                  <td><a href="read?bid=${list.getBid()}">${list.getTitle()}</a></td>
                </c:otherwise>
              </c:choose>

              <td class="text-center">${list.getName()}</td>
              <td class="text-center"><fmt:formatDate value="${list.getWriteDate()}" pattern="yyyy-MM-dd"/></td>
              <td class="text-center">${list.getViews()}</td>
            </tr>
          </c:forEach>
        </table>
        <div class="list-btn-area">
          <c:choose>
            <c:when test="${login!=null}">
              <input type="button" value="글쓰기" class="btn btn-primary btn-lg px-4 me-sm-3"
                     onclick="location.href='/write'"/>
            </c:when>
            <c:when test="${login==null}">
              <input type="button" value="글쓰기" class="btn btn-primary btn-lg px-4 me-sm-3"
                     onclick="alert('로그인을 해주세요');"/>
            </c:when>
          </c:choose>
        </div>
        <ul class="page-list">
          <c:if test="${paging.startPage != 1}">
            <a href="/board/getSearchList?keyword=${spv.getKeyword()}&type=${spv.getType()}&nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
          </c:if>
          <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
            <c:choose>
              <c:when test="${p == paging.nowPage}">
                <li>${p}</li>
              </c:when>
              <c:when test="${p != paging.nowPage}">
                <li><a href="/board/getSearchList?keyword=${spv.getKeyword()}&type=${spv.getType()}&nowPage=${p}&cntPerPage=${paging.cntPerPage}&start=${paging.nowPage}&end=${paging.nowPage * 10}">${p}</a></li>
              </c:when>
            </c:choose>
          </c:forEach>
          <c:if test="${paging.endPage != paging.lastPage}">
            <a href="/board/getSearchList?keyword=${spv.getKeyword()}&type=${spv.getType()}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
          </c:if>
        </ul>
      </div>
    </div>
  </div>
</section>

<%--<script>
  function formSubmit() {
    if(document.getElementById("search-input").value === '' ) {
      alert('검색어를 입력해주세요.');
      return false;
    }
    document.getElementById('search-button').submit();
  }

  function secret() {
    alert("다른 사람의 비밀글은 볼 수 없습니다.");
  }

</script>--%>

<%@ include file="../include/footer.jspf" %>
