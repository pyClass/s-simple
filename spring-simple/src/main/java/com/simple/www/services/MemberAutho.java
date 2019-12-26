package com.simple.www.services;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.simple.www.vo.*;
/*
	용어 정리 ]
		
		@Component
			- 이 어노테이션이 붙으면 이 클래스는 스프링 빈으로 등록된 클래스라는 의미
			   빈처리를 하겠다는 어노테이션...
			   
		@Aspect
			- 공통기능을 제공하는 Aspect 클래스의 의미의 어노테이션
			
		@PointCut
			- 부가기능을 담고있는 객체를 적용할 타겟의 메서드를 선별하는 정규표현식을 담는다.
			   어떤 함수가 실행될때 작동할 것인지를 지정하는 어노테이션...
			   
		@Before
			- 포인트컷 함수가 실행되기 전에 실행하겠다는 어노테이션...
		
		JoinPoint 
			- 컨트롤러의 매개변수리스트를 저장해서 관리하는 클래스
 */
@Component("membAutho")
@Aspect
public class MemberAutho {
	
	@Pointcut("execution(* com.simple.www.controller.ReBoard.writeForm(..))")
	public void authoProc() {
		System.out.println("**** MemberAutho authoProc *****");
	}
	
	@Before("authoProc()")
	public void checkAutho(JoinPoint join) {
		System.out.println("**** MemberAutho checkAutho *****");
		loginCk(join);
	}
	
	@Pointcut("execution(* com.simple.www.controller.Member.showName(..))")
	public void membInit() { }
	
	@Before("membInit()")
	public void inCk(JoinPoint join) {
		System.out.println("**** MemberInfo AOP Before *****");
		loginCk(join);
	}
	
	public void loginCk(JoinPoint join) {
		// JoinPoint : 컨트롤러가 가지고있는 매개변수를 담아서 관리하는 클래스
		//				매개변수들은 Object[] 으로 저장된다.
		Object[] obj = join.getArgs();
		/*
		ModelAndView mv = (ModelAndView) obj[0];
		RedirectView rv = (RedirectView) obj[1];
		HttpSession session = (HttpSession)obj[2];
		*/
		ModelAndView mv = null;
		RedirectView rv = null;
		HttpSession session = null;
		LoginVO vo = null;
//		ArrayList<String> list = new ArrayList<String>();
		for(Object o : obj) {
			if(o instanceof ModelAndView) {
				mv = (ModelAndView) o;
			} else if(o instanceof RedirectView) {
				rv = (RedirectView) o;
			} else if(o instanceof HttpSession) {
				session = (HttpSession) o;
//			} else if(o instanceof ArrayList) {
//				list = (ArrayList<String>) o;
			} else if(o instanceof LoginVO) {
				vo = (LoginVO) o;
			}
		}
		String sid = (String) session.getAttribute("SID");
		if(sid == null || sid.length() == 0) {
			// 이 경우는 로그인이 안되어있는 상태이므로 로그인페이지로 이동
//			list.add("true");
//			vo.setNotLogin("true");
			session.setAttribute("NOTLOGIN", "true");
			rv.setUrl("/www/member/login.van");
			mv.setView(rv);
		} else {
//			list.add("false");
//			vo.setNotLogin("false");
			session.setAttribute("NOTLOGIN", "false");
		}
	}
}
