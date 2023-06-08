package com.gyemoim.dao.member;

import com.gyemoim.domain.member.MemberVO;
import com.gyemoim.dto.member.LoginDTO;

import java.util.Map;


public interface MemberDAO {
    MemberVO login(LoginDTO dto) throws Exception;

    // 세션 유지 // 로그인된 경우 해당 세션id와 유효시간을 사용자 테이블에 세팅한다.
    public void keepLogin( Map<String, Object> paramMap);
    // 세션 키 // 유효기간이 남아 있으면서 해당 sessionId를 가지는 사용자 정보를 꺼내오는 부분
    MemberVO checkMemberWithSessionKey(String value);
    // email 찾기
    public MemberVO memberEmailSearch(MemberVO vo);
    // password 찾기
    public MemberVO memberPwdSearch(MemberVO vo);
}
