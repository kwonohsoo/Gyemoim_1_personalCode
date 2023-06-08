<%--
 Created by IntelliJ IDEA.
 User: minjaehong
 Date: 2023/02/20
 Time: 8:37 PM
 To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/resources/dist/css/main.css" rel="stylesheet"/>
<%@ include file="../include/header.jspf" %>


<!-- Header-->
<section class="main-banner">
  <div class="container m-0 p-0">
    <div class="row gx-5 align-items-center justify-content-center banner-detail">
      <div class="col-lg-8 col-xl-7 col-xxl-6 banner-text-area">
        <div class="text-center text-xl-start">
          <h1 class="display-5 fw-bolder text-white mb-2">나만의 목돈마련 솔루션,<br>계모임</h1>
          <p class="lead fw-normal text-white-50 mb-4">필요할 때 언제나 간편하게<br>나의 목돈 마련은 계모임에서 시작하세요!</p>
          <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
            <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">스테이지</a>
            <a class="btn btn-outline-light btn-lg px-4" href="#!">이벤트</a>
          </div>
        </div>
      </div>
      <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"></div>
    </div>
  </div>
</section>


<!-- stage section-->
<section class="py-5">
  <div class="container px-5 my-5">
    <div class="row gx-5 justify-content-center">
      <div class="col-lg-8 col-xl-6">
        <div class="text-center">

         <c:choose>
            <c:when test="${login!=null}">
              <h2 class="fw-bolder"><span class="text-primary">${login.name}</span>님을 위한 스테이지</h2>
              <p class="lead fw-normal text-muted mb-5">계이득의 다양한 스테이지를 만나보세요.</p>
            </c:when>
            <c:when test="${login==null}">
              <h2 class="fw-bolder">스테이지</h2>
              <p class="lead fw-normal text-muted mb-5">계이득의 다양한 스테이지를 만나보세요.</p>
            </c:when>
          </c:choose>
        </div>
      </div>
    </div>
    <div class="row gx-5">


      <!-- card -->
      <div class="col-lg-4 mb-5">
        <div class="card shadow border-0">
          <div class="stage px-3 pt-4 text-center">
            <div class="badge bg-danger bg-gradient rounded-pill mb-2">HOT!</div>
            <h3 class="pb-3">소소하게 함께 모아요</h3>
            <div class="stage_char text-center">
            <img src="/resources/dist/img/gyemoim_character.png" alt="계이득">
            </div>
            <ul class="stage_num py-2 px-0">
                <li>1</li>
                <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
                <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
                <li>4</li>
                <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
                <li>6</li>
                <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
            </ul>
          </div><!-- stage -->
          <div class="card-body p-4">
            <div class="pay_count_info">
              <p class="px-1">이율(세후) <strong>9.81%</strong></p>
              <div class="bd-l"></div>
              <p class="px-1">약정금 <strong>1170만원</strong></p>
            </div>
          </div>
          <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-around">
              <div class="d-flex align-items-center">
                <div class="pay-count-total pay-count-total bg-primary bg-gradient rounded-pill mb-2">총
                  적립 포인트 <span>10,300P</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> <!-- card -->


      <!-- card -->
      <div class="col-lg-4 mb-5">
        <div class="card shadow border-0">
          <div class="stage px-3 pt-4 text-center">
            <div class="badge bg-warning bg-gradient rounded-pill mb-2 all_attend">전원 참여 완료!</div>
            <h3 class="pb-3">함께 목돈 만들어요</h3>
            <div class="stage_char text-center">
              <img src="/resources/dist/img/gyemoim_character.png" alt="계이득">
            </div>
            <ul class="stage_num py-2 px-0">
            <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
            <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
            <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
            <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
            <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
            <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
            <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
            </ul>
          </div><!-- stage -->
          <div class="card-body p-4">
            <div class="pay_count_info">
              <p class="px-1">이율(세후) <strong>9.81%</strong></p>
              <div class="bd-l"></div>
              <p class="px-1">약정금 <strong>1170만원</strong></p>
            </div>
          </div>
          <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-around">
              <div class="d-flex align-items-center">
                <div class="pay-count-total pay-count-total bg-primary bg-gradient rounded-pill mb-2">총
                  적립 포인트 <span>10,300P</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> <!-- card -->


      <!-- card -->
      <div class="col-lg-4 mb-5">
        <div class="card shadow border-0">
          <div class="stage px-3 pt-4 text-center">
            <div class="badge bg-success bg-gradient rounded-pill mb-2">NEW!</div>
            <h3 class="pb-3">계이득 합시다</h3>
            <div class="stage_char text-center">
            <img src="/resources/dist/img/gyemoim_character.png" alt="계이득">
            </div>
            <ul class="stage_num py-2 px-0">
              <li>1</li>
              <li>2</li>
              <li>3</li>
              <li>4</li>
              <li>5</li>
              <li>6</li>
              <li>7</li>
            </ul>
          </div><!-- stage -->
          <div class="card-body p-4">
            <div class="pay_count_info">
              <p class="px-1">이율(세후) <strong>9.81%</strong></p>
              <div class="bd-l"></div>
              <p class="px-1">약정금 <strong>1170만원</strong></p>
            </div>
          </div>
          <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-around">
              <div class="d-flex align-items-center">
                <div class="pay-count-total pay-count-total bg-primary bg-gradient rounded-pill mb-2">총
                  적립 포인트 <span>10,300P</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> <!-- card -->


      <!-- card -->
      <div class="col-lg-4 mb-5">
        <div class="card shadow border-0">
          <div class="stage px-3 pt-4 text-center">
            <div class="badge bg-danger bg-gradient rounded-pill mb-2">HOT!</div>
            <h3 class="pb-3">부자되세요~</h3>
            <div class="stage_char text-center">
            <img src="/resources/dist/img/gyemoim_character.png" alt="계이득">
            </div>
            <ul class="stage_num py-2 px-0">
            <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
            <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
              <li>3</li>
              <li>4</li>
              <li>5</li>
              <li>6</li>
            <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
            </ul>
          </div><!-- stage -->
          <div class="card-body p-4">
            <div class="pay_count_info">
              <p class="px-1">이율(세후) <strong>9.81%</strong></p>
              <div class="bd-l"></div>
              <p class="px-1">약정금 <strong>1170만원</strong></p>
            </div>
          </div>
          <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-around">
              <div class="d-flex align-items-center">
                <div class="pay-count-total pay-count-total bg-primary bg-gradient rounded-pill mb-2">총
                  적립 포인트 <span>10,300P</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> <!-- card -->


      <!-- card -->
      <div class="col-lg-4 mb-5">
        <div class="card shadow border-0">
          <div class="stage px-3 pt-4 text-center">
            <div class="badge bg-danger bg-gradient rounded-pill mb-2">HOT!</div>
            <h3 class="pb-3">연체없이 목돈마련!!</h3>
            <div class="stage_char text-center">
            <img src="/resources/dist/img/gyemoim_character.png" alt="계이득">
            </div>
            <ul class="stage_num py-2 px-0">
              <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
              <li>2</li>
              <li>3</li>
              <li>4</li>
              <li>5</li>
              <li>6</li>
              <li>7</li>
            </ul>
          </div><!-- stage -->
          <div class="card-body p-4">
            <div class="pay_count_info">
              <p class="px-1">이율(세후) <strong>9.81%</strong></p>
              <div class="bd-l"></div>
              <p class="px-1">약정금 <strong>1170만원</strong></p>
            </div>
          </div>
          <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-around">
              <div class="d-flex align-items-center">
                <div class="pay-count-total pay-count-total bg-primary bg-gradient rounded-pill mb-2">총
                  적립 포인트 <span>10,300P</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> <!-- card -->


      <!-- card -->
      <div class="col-lg-4 mb-5">
        <div class="card shadow border-0">
          <div class="stage px-3 pt-4 text-center">
            <div class="badge bg-danger bg-gradient rounded-pill mb-2">HOT!</div>
            <h3 class="pb-3">여행자금 만들기</h3>
            <div class="stage_char text-center">
            <img src="/resources/dist/img/gyemoim_character.png" alt="계이득">
            </div>
            <ul class="stage_num py-2 px-0">
                <li>1</li>
                <li>2</li>
                <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
                <li>4</li>
                <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
                <li>6</li>
                <li class="egg"><img src="/resources/dist/img/egg002.png"></li>
            </ul>
          </div><!-- stage -->
          <div class="card-body p-4">
            <div class="pay_count_info">
              <p class="px-1">이율(세후) <strong>9.81%</strong></p>
              <div class="bd-l"></div>
              <p class="px-1">약정금 <strong>1170만원</strong></p>
            </div>
          </div>
          <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-around">
              <div class="d-flex align-items-center">
                <div class="pay-count-total pay-count-total bg-primary bg-gradient rounded-pill mb-2">총
                  적립 포인트 <span>10,300P</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> <!-- card -->
      <div class="stage-btn"><a class="btn btn-primary btn-lg px-4 me-sm-3" href="#">스테이지 모두보기</a></div>
    </div>
  </div>
</section>


<!-- Testimonial section-->
<div class="py-5 bg-light">
  <div class="container px-5 my-5">
    <div class="row gx-5 justify-content-center">
      <div class="col-lg-10 col-xl-7">
        <div class="text-center">
          <div class="fs-4 mb-4 fst-italic">친구들끼리 여행 가려고 돈 모으기 시작했어요!<br>여행계나 여행적금으로 계이득 강추입니다!</div>
          <div class="d-flex align-items-center justify-content-center">
            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..."/>
            <div class="fw-bold">
              민재홍
              <span class="fw-bold text-primary mx-1">/</span>
              팀장, 계이득
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Features section-->
<section class="py-5" id="features">
  <div class="container px-5 my-5">
    <div class="row gx-5">
      <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">계모임 <span class="text-primary">TIP</span></h2>
        <h5 class="pt-3">더 편리하고 새로워진<br><strong>계모임</strong>을 이용해보세요!</h5>
      </div>
      <div class="col-lg-8">
        <div class="row gx-5 row-cols-1 row-cols-md-2">
          <div class="col mb-5 h-100">
            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i
                    class="bi bi-collection"></i></div>
            <h5>계모임 이율계산기</h5>
            <p class="mb-0">더 편리하고 새로워진<br><strong>계모임 앱</strong>을 이용해보세요!</p>
          </div>
          <div class="col mb-5 h-100">
            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i
                    class="bi bi-building"></i></div>
            <h5>계모임 이율계산기</h5>
            <p class="mb-0">더 편리하고 새로워진<br><strong>계모임 앱</strong>을 이용해보세요!</p>
          </div>
          <div class="col mb-5 mb-md-0 h-100">
            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i
                    class="bi bi-toggles2"></i></div>
            <h5>계모임 이율계산기</h5>
            <p class="mb-0">더 편리하고 새로워진<br><strong>계모 앱</strong>을 이용해보세요!</p>
          </div>
          <div class="col h-100">
            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i
                    class="bi bi-toggles2"></i></div>
            <h5>계모임 이율계산기</h5>
            <p class="mb-0">더 편리하고 새로워진<br><strong>계모임 앱</strong>을 이용해보세요!</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>



<!-- Call to action-->
<!--
<aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
<div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
<div class="mb-4 mb-xl-0">
<div class="fs-3 fw-bold text-white">New products, delivered to you.</div>
<div class="text-white-50">Sign up for our newsletter for the latest updates.</div>
</div>
<div class="ms-xl-4">
<div class="input-group mb-2">
<input class="form-control" type="text" placeholder="Email address..." aria-label="Email address..." aria-describedby="button-newsletter" />
<button class="btn btn-outline-light" id="button-newsletter" type="button">Sign up</button>
</div>
<div class="small text-white-50">We care about privacy, and will never share your data.</div>
</div>
</div>
</aside>
-->


</div>
</section>
<script>
  console.log(<%=request.getContextPath()%>);
</script>
<%@ include file="../include/footer.jspf" %>

