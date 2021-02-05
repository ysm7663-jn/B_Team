package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {

	@RequestMapping(value="profile.myPage", method=RequestMethod.GET)
	public String myPage(HttpServletRequest request) {
		return "myPage/profile";
	}
	
}
