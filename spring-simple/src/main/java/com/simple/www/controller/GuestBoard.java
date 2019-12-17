package com.simple.www.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/guestBoard/")
public class GuestBoard {
	
	@RequestMapping("gboard.van")
	public ModelAndView gBorad(ModelAndView mv) {
		mv.setViewName("gBoard/guestBoard");
		return mv;
	}
}
