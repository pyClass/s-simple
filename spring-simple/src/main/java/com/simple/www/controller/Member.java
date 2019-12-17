package com.simple.www.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.simple.www.dao.*;
import com.simple.www.vo.*;
import com.simple.www.services.*;

@Controller
@RequestMapping("/member/")
public class Member {
	@Autowired
	MemberDAO mDAO;
	@Autowired
	FileDAO fDAO;
	@Autowired
	FileService fileSrvc;
	
	@RequestMapping("login.van")
	public ModelAndView loginForm(ModelAndView mv) {
		
		mv.setViewName("member/login");
		
		return mv;
	}
	
	@RequestMapping("logout.van")
	public ModelAndView logout(ModelAndView mv, RedirectView rv, HttpSession session) {
		session.setAttribute("SID", "");
		rv.setUrl("/www/");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("loginProc.van")
	public ModelAndView loginProc(HttpSession session, 
									RedirectView rv, 
									ModelAndView mv, 
									MemberVO vo) {
		int cnt = mDAO.loginProc(vo);
		if(cnt == 1) {
			// 이 경우는 아이디와 비밀번호가 일치하는 회원이 한면 있다는 이야기이므로
			// 로그인 처리를 해주면 되는데
			// 로그인 처리는 세션에 아이디를 입력해주기로 하자.
			session.setAttribute("SID", vo.getId());
			rv.setUrl("/www/main.van");
			mv.setView(rv);
		} else {
			// 이 경우는 로그인에 실패한 경우이므로 다시 로그인 페이지로 이동한다.
			rv.setUrl("/www/member/login.van");
		}
		
		return mv;
	}
	
	@RequestMapping("join.van")
	public ModelAndView joinForm(ModelAndView mv) {
		mv.setViewName("member/join");
		
		return mv;
	}
	
	@RequestMapping("joinProc.van")
	public ModelAndView joinProc(ModelAndView mv, RedirectView rv, 
									HttpSession session, MemberVO mVO) {
		// 할일
		// 1. 회원정보 입력하고
		int cnt = mDAO.insertMemb(mVO);
		if(cnt != 1) {
			rv.setUrl("/www/member/join.van");
		} else {
			session.setAttribute("SID", mVO.getId());
			fileSrvc.setDAO(fDAO);
			fileSrvc.singleUpProc(session, mVO);
			rv.setUrl("/www/guestBoard/gboard.van");
		}
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("showId.van")
	public ModelAndView showId(ModelAndView mv) {
		List<MemberVO> list = mDAO.getIdList();
		
		mv.addObject("LIST", list);
		mv.setViewName("member/idList");
		return mv;
	}
	
	@RequestMapping("showName.van")
	public ModelAndView showName(String mno, String avt, ModelAndView mv) {
//		public ModelAndView showName(int mno, String avt, ModelAndView mv) {
		
		String name = mDAO.getName(mno);
		mv.addObject("avatar", avt);
		mv.addObject("name", name);
		mv.setViewName("member/showName");
		return mv;
	}
	
	@RequestMapping(value="idCheck.van")
	/*
	 * @RequestMapping(value="idCheck.van", produces="text/plain;charset=UTF-8")
	 */	
	@ResponseBody
	public int idCheck(@RequestParam String id) {
//	public MemberVO idCheck(String id) {
		int cnt = 0;
		cnt = mDAO.idCheck(id);
//		MemberVO vo = mDAO.idCheck(id);
		/*
			우리가 현재 필요한 데이터는 json 형식의 데이터다.
			데이터의 숫자가 적을 경우는 해당 json 형식의 데이터를 만들어 주는것이 문제 없지만
			여러개 라면 문제가 될 수 있다.
			코드의 길이가 늘어날 수 있고
			확인하는 작업이 불편해진다.
			
			만약 vo의 모든 변수에 대한 데이터를 json 형식으로 변환시켜야한다면 
			모든 변수의 키값을 만들고 데이터를 입력해 줘야 하겠다.
			
			다행이도 스프링에서는 json 문서를 쉽게 만들 수 있는 방법을 제공하고 있다.
			방법 ]
				실행함수의 반환값을 VO 타입으로 정하고
				함수에 
					@ResponseBody
				라는 어노테이션을 붙여주면 된다.
				VO 에 선언된 변수 이름을 키값으로 하고
				입력된 데이터를 벨류로 해서 
				json 문서를 알아서 만들어 준다.
		 */
		return cnt;
//		return vo;
	}
	
	@RequestMapping("membInfo.van")
	@ResponseBody
	public MemberVO membInfo(String id) {
		MemberVO vo = mDAO.membInfo(id);
		return vo;
	}
	
	@RequestMapping("infoEdit.van")
	public @ResponseBody MemberVO editInfo(MemberVO vo) {
		System.out.println(vo.getMno());
		vo.setCnt(mDAO.editInfo(vo));
		
		return vo;
	}
	
	@RequestMapping("fileUp.van")
	public void fileUp(HttpSession session, MemberVO mVO) {
		try{
			fileSrvc.singleUpProc(session, mVO);
		} catch(Exception e) {}
	}
}
