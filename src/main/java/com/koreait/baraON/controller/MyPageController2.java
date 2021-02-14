package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController2 {
	@Autowired
	private SqlSession sqlSession;
	
	
	@Autowired
	public void setCommand() {
	}
	
	@RequestMapping(value="pwCheck.myPage", method=RequestMethod.GET)
	public String myPage(HttpServletRequest request) {
		return "myPage/pwCheck";
	}
	
}
