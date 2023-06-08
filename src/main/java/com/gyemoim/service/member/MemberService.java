package com.gyemoim.service.member;

import com.gyemoim.domain.member.MemberVO;
import com.gyemoim.dto.member.LoginDTO;

import java.util.Map;

public interface MemberService {

    MemberVO login(LoginDTO dto) throws Exception;

    void keepLogin( Map<String, Object> paramMap) throws Exception;

    public MemberVO checkLoginBefore(String value);
    // Email 찾기
    MemberVO memberEmailSearch(MemberVO memberVO);
    // Password 찾기
    MemberVO memberPwdSearch(MemberVO memberVO);
}
