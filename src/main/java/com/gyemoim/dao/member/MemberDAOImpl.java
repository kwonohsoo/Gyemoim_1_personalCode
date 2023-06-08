package com.gyemoim.dao.member;

import com.gyemoim.domain.member.MemberVO;
import com.gyemoim.dto.member.LoginDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.Map;

@Repository
public class MemberDAOImpl implements MemberDAO {

  @Inject
  private SqlSession sqlSession;

  private String namespace = "resources.mappers.memberMapper";

  @Override
  public MemberVO login(LoginDTO dto) throws Exception {
    return sqlSession.selectOne(namespace + ".login", dto);
  }

  @Override
  // 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
  public void keepLogin(Map<String, Object> map) {

    System.out.println("세션 아이디 : " + map.get("sessionId"));

    // Mapper.xml로 데이터를 전달할 때 한 객체밖에 전달 못함으로 map으로 묶어서 보내줌
    // Mapper.xml 안에서 #{} 이 안에 지정한 이름이랑 같아야함.. 자동으로 매핑될 수 있도록
    // 아래가 수행되면서, 사용자 테이블에 세션id와 유효시간이 저장됨
    sqlSession.update(namespace + ".keepLogin", map);

  }

  @Override
  // 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
  public MemberVO checkMemberWithSessionKey(String value) {
    // 유효시간이 남아있고(>now()) 전달받은 세션 id와 일치하는 사용자 정보를 꺼낸다.
    return sqlSession.selectOne(namespace + ".checkMemberWithSessionKey", value);
  }

  // Email 찾기
  public MemberVO memberEmailSearch(MemberVO vo) {
    System.out.println("==> findEmail() 기능 처리");
    return sqlSession.selectOne(namespace + ".memberEmailSearch", vo);
  }

  // Password 찾기
  public MemberVO memberPwdSearch(MemberVO vo) {
    System.out.println("==> findEmail() 기능 처리");
    return sqlSession.selectOne(namespace + ".memberPwdSearch", vo);
  }
}
