package com.gyemoim.service.member;

import com.gyemoim.dao.member.MemberDAO;
import com.gyemoim.domain.member.MemberVO;
import com.gyemoim.dto.member.LoginDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {
  @Inject
  private MemberDAO memberDAO;

  @Override
  public MemberVO login(LoginDTO dto) throws Exception {
    return memberDAO.login(dto);
  }

  // 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
  @Override
  public void keepLogin(Map<String, Object> map) throws Exception {
    System.out.println("service에서 dao keepLogin 수행.");
    memberDAO.keepLogin(map);
  }

  // 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
  @Override
  public MemberVO checkLoginBefore(String value) {
    return memberDAO.checkMemberWithSessionKey(value);
  }

  // Email 찾기
  @Override
  public MemberVO memberEmailSearch(MemberVO memberVO) {
    return memberDAO.memberEmailSearch(memberVO);
  }

  // Password 찾기
  public MemberVO memberPwdSearch(MemberVO memberVO) {
    return memberDAO.memberPwdSearch(memberVO);
  }

}
