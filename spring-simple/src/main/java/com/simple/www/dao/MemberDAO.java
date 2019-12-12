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
	
	public List<MemberVO> getIdList(){
		return sqlSession.selectList("mSQL.idList");
	}
	
	public String getName(String mno) {
//		public String getName(int mno) {
		return sqlSession.selectOne("mSQL.selName", mno);
	}
}
