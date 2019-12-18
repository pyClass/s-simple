package com.simple.www.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.simple.www.dao.*;
import com.simple.www.util.*;

@Controller
@RequestMapping("/board")
public class ReBoard {
	@Autowired
	ReBoardDAO rbDAO;
	
	@RequestMapping("/reBoardForm.van")
	public ModelAndView reBoardForm(ModelAndView mv, PageUtil pageUtil) {
		int nowPage = 1;
		// 할일
		// 1. 게시물 전체 갯수를 구하고
		int total = rbDAO.getTotalCnt();
		if(pageUtil.getNowPage() == 0) {
			nowPage = 1;
		} else {
			nowPage = pageUtil.getNowPage();
		}
		
		// 2. pageUtil 데이터 셋팅하고
		pageUtil.setVar(nowPage, total, 3, 3);
		
		// 3. 질의명령 보내고 결과 받고
		List list = rbDAO.getRbList(pageUtil);
		
		// 4. 데이터 전달하고
		mv.addObject("LIST", list);
		mv.addObject("PAGE", pageUtil);
		
		// 5. 뷰를 부른다.
		mv.setViewName("board/reboard");
		
		return mv;
	}
}
