package com.gyemoim.controller.member;

import com.gyemoim.domain.member.MemberVO;
import com.gyemoim.dto.member.LoginDTO;
import com.gyemoim.service.member.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Inject
  public MemberService service;


  // 로그인 폼
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public void login(@ModelAttribute("dto") LoginDTO dto) {
  }


  // 로그인 처리
  @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
  public void loginPost(LoginDTO dto, HttpSession session, Model model) throws Exception {

    MemberVO vo = service.login(dto);

    if (vo == null) return; // 로그인 실패
    model.addAttribute("memberVO", vo);

    System.out.println(vo.toString());
    System.out.println("쿠키 사용 중이니? = " + dto.isUseCookie());

//    세션 추가 되는 부분   //
    if (dto.isUseCookie()) {  // dto 클래스 안에 useCookie 항목에 폼에서 넘어온 쿠키사용 여부(true/ false)가 들어있다. // 체크가 되어 있다면
      int amount = 60 * 60 * 24 * 7;  // 단위 (초) : (60초 * 60초) = 3600초 (1시간) * 24 = 24시간 * 7 = [7일]
      Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // currentTimeMills()가 1/1000초 단위임으로 1000곱해서 더해야함

      System.out.println("loginPost에서 service의 keepLogin수행.");

      // 현재 세션 email, id, 유효시간을 MAP에 저장한다.
      Map<String, Object> paramMap = new HashMap<>();
      paramMap.put("email", vo.getEmail());
      paramMap.put("sessionId", session.getId());
      paramMap.put("next", sessionLimit);
      service.keepLogin(paramMap);

      System.out.println("서비스 파라맵 되니? = " + vo.getEmail());
      System.out.println("서비스 파라맵 되니? = " + session.getId());
      System.out.println("서비스 파라맵 되니? = " + sessionLimit.toString());
      System.out.println(paramMap);
    }
  }


  // 로그아웃
  @RequestMapping(value = "/logout", method = RequestMethod.GET)
  public String logout(HttpServletRequest request,
                       HttpServletResponse response, HttpSession session) throws Exception {

    Object obj = session.getAttribute("login");

    System.out.println("로그아웃 완료");

    if (obj != null) {
      MemberVO vo = (MemberVO) obj;

      session.removeAttribute("login"); // 세션 지움
      session.invalidate(); // 세션 지움

      System.out.println("로그아웃 *세션* 지움");

      Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");  // WebUtils 클래스 : Session에 담겨 있는 객체들을 짧은 코드로 넣고 빼고 할 수 있고
                                                                              // 세션이나 쿠키 객체를 받아올 수 있다.

      //사용자가 자동로그인을 선택했었다면, LoginInterceptor 인터셉터에서 설정했던 loginCookie값을 초기화한다.
      if (loginCookie != null) {
        loginCookie.setPath("/");
        loginCookie.setMaxAge(0);
        response.addCookie(loginCookie);
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("email", vo.getEmail());
        paramMap.put("sessionId", session.getId());
        paramMap.put("next", new Date());
        service.keepLogin(paramMap);
      }
    }
    return "member/logout";
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // email 찾기
  @RequestMapping(value = "/findEmail", method = RequestMethod.GET)
  public String findEmail(HttpServletRequest request, Model model,
                          MemberVO memberVO) {


    return "/member/findEmail";
  }

  // email 찾기 실행
  @RequestMapping(value = "/findResultEmail")
  public String findResultEmail(HttpServletRequest request, Model model,
                                @RequestParam(required = true, value = "name") String name, // 이름
                                @RequestParam(required = true, value = "phone") String phone, // 핸드폰 번호
                                @RequestParam(required = true, value = "ssn") String ssn, // 주민등록번호
                                MemberVO memberVO) {

    try {
      memberVO.setName(name);
      memberVO.setPhone(phone);
      memberVO.setSsn(ssn);
      MemberVO memberSearch = service.memberEmailSearch(memberVO);
      model.addAttribute("memberVO", memberSearch);

    } catch (Exception e) {
      System.out.println(e.toString());
      model.addAttribute("msg", "오류가 발생되었습니다.");
    }
    return "/member/findResultEmail";
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // password 찾기
  @RequestMapping(value = "/findPwd", method = RequestMethod.GET)
  public String findPwd(HttpServletRequest request, Model model, MemberVO vo) {

    return "/member/findPwd";
  }

  // Password 찾기 실행
  @RequestMapping(value = "/findResultPwd")
  public String findResultPwd(HttpServletRequest request, Model model,
                              @RequestParam(required = true, value = "name") String name,
                              @RequestParam(required = true, value = "phone") String phone,
                              @RequestParam(required = true, value = "ssn") String ssn,
                              MemberVO memberVO) {

    try {
      memberVO.setName(name);
      memberVO.setPhone(phone);
      memberVO.setSsn(ssn);
      MemberVO memberSearch = service.memberPwdSearch(memberVO);
      model.addAttribute("memberVO", memberSearch);

    } catch (Exception e) {
      System.out.println(e.toString());
      model.addAttribute("msg", "오류가 발생되었습니다.");
    }
    return "/member/findResultPwd";
  }
}
