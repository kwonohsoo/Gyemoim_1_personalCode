package com.gyemoim.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {   // 로그인하지 않은 사용자가 글쓰기를 못하도록 돌려보내주는 역할

    private static final String LOGIN = "login";
    private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);


    @Override   // Controller가 실행되기 전 수행
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();

        if (session.getAttribute(LOGIN) != null) {
            logger.info("clear login data before");
            session.removeAttribute(LOGIN);
            System.out.println("preHandel 실행");
        }
        return true;
    }


    @Override   // Controller가 완료된 이후 수행
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {

        System.out.println("postHandel 실행");

        HttpSession session = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object memberVO = modelMap.get("memberVO");

        if (memberVO != null) {
            session.setAttribute(LOGIN, memberVO);

            logger.info("new login success 로그인 성공");

            if (request.getParameter("useCookie") != null) {
                logger.info("자동로그인 체크");
                Cookie loginCookie = new Cookie("loginCookie", session.getId());
                loginCookie.setPath("/");
                loginCookie.setMaxAge(60 * 60 * 24 * 7); // 7일
                response.addCookie(loginCookie);
            }
            Object dest = session.getAttribute("dest");

            response.sendRedirect(dest != null ? (String) dest : "/");
        }else{
            response.sendRedirect("/member/login");
        }
    }
}