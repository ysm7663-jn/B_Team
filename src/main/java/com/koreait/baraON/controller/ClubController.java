package com.koreait.baraON.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.baraON.command.BaraONCommand;

@Controller
public class ClubController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private BaraONCommand baraONCommand;

	// 단순이동
	@RequestMapping(value="clubInsertPage.club", method=RequestMethod.GET)
	public String clubInsertPage() {
		return "club/clubInsertPage";
	}
	
	
	// method 이동
	@RequestMapping(value="clubListPage.club", method=RequestMethod.GET)
	public String clubListPage() {
		
		
		
		return "club/clubListPage";
	
	}
}
