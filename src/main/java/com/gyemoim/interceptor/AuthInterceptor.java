package com.gyemoim.interceptor;

import com.gyemoim.domain.member.MemberVO;
import com.gyemoim.service.member.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 로그인처리를 담당하는 인터셉터
public class AuthInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

    @Inject
    private MemberService service;

    @Override
    // preHandle() : 컨트롤러보다 먼저 수행되는 메서드
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // session 객체를 가져옴
        HttpSession session = request.getSession();

        if (session.getAttribute("login") == null) {    // 로그인된 세션이 없는 경우
            logger.info("current user is not logined");
            saveDest(request);
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");    // 쿠키를 꺼내온다.
            System.out.println("쿠키가 살아있니?" + loginCookie);
            if (loginCookie != null) {  // 쿠기가 존재하는 경우
                MemberVO vo = service.checkLoginBefore(loginCookie.getValue()); // auth 실행, 저장한 세선 ID 꺼내옴
                // 세션Id를 checkMemberWithSessionKey에 전달해 이전에 로그인한적이 있는지 체크하는 메서드를 거쳐서
                // 유효시간이 > now() 인 즉 아직 유효시간이 지나지 않으면서 해당 sessionId 정보를 가지고 있는 사용자 정보를 반환한다.

                logger.info("MemberVO: " + vo);
                System.out.println("로그인쿠키가 널이 아니고 auth인터셉터 실행함!! ->" + vo.toString());
                if (vo != null) {   // 위와 같은 사용자 정보가 있다면 세션 생성한다.
                    session.setAttribute("login", vo);
                    return true;
                }
            }
            response.sendRedirect("/member/login");
            return false;   // 로그인 x, 쿠키x -> 로그인 폼 돌려보냄
        }
        return true;
    }

    private void saveDest(HttpServletRequest req) { // 로그인 페이지 이동 전, 현재 페이지를 Session에 저장
        // 로그인 안했을 때 로그인 화면으로
        String uri = req.getRequestURI();
        String query = req.getQueryString();

        // 기존 URI에 parameter가 있을 경우, 이를 포함
        if (query == null || query.equals("null")) {
            query = "";
        } else {
            query = "?" + query;
        }

        if (req.getMethod().equals("GET")) {
            logger.info("dest: " + (uri + query));
            req.getSession().setAttribute("dest", uri + query);
        }
    }
}