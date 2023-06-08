package com.gyemoim.interceptor;

import com.gyemoim.domain.member.MemberVO;
import com.gyemoim.service.member.MemberService;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainInterceptor extends HandlerInterceptorAdapter {
    @Inject
    private MemberService service;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //세션 가져오고
        HttpSession session = request.getSession();
        //경로지정
        saveDest(request);
        //로그인쿠키 가져온다
        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        //로그인쿠키 가져왔으면 세션에 저장
        if (loginCookie != null) {
            MemberVO vo = service.checkLoginBefore(loginCookie.getValue());
            if (vo != null) session.setAttribute("login", vo);
        }
        return true;
    }

    private void saveDest(HttpServletRequest req) {
        String uri = req.getRequestURI();
        String query = req.getQueryString();
        if (query == null || query.equals("null")) {
            query = "";
        } else {
            query = "?" + query;
        }
        if (req.getMethod().equals("GET")) {
            req.getSession().setAttribute("dest", uri + query);
        }
    }
}
