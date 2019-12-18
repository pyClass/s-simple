package com.simple.www.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.simple.www.vo.*;

public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int loginProc(MemberVO vo) {
		int cnt = sqlSession.selectOne("mSQL.Login", vo);
		return cnt;
	}
	
	public int idCheck(String id) {
//	public MemberVO idCheck(String id) {
		return sqlSession.selectOne("mSQL.idCount", id);
	}
	
	// 회원가입 처리 전담 처리함수
	public int insertMemb(MemberVO mVO) {
		return sqlSession.insert("mSQL.addMember", mVO);
	}
	
	public List<MemberVO> getIdList(){
		return sqlSession.selectList("mSQL.idList");
	}
	
	public String getName(String mno) {
//		public String getName(int mno) {
		return sqlSession.selectOne("mSQL.selName", mno);
	}
	
	public int editInfo(MemberVO vo) {
		return sqlSession.update("mSQL.editInfo", vo);
	}
	
	public MemberVO membInfo(String id) {
		return sqlSession.selectOne("mSQL.membInfo", id);
	}
	
	public ArrayList membTest01() {
		return (ArrayList) sqlSession.selectList("mSQL.test01");
	}
	
	public ArrayList membTest02(HashMap map) {
		return (ArrayList) sqlSession.selectList("mSQL.test02", map);
	}
}
