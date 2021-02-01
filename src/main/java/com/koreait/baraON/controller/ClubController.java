package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.baraON.command.club.ClubListCommand;

@Controller
public class ClubController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private ClubListCommand clubListCommand;
	
	@Autowired
	public void setCommand(ClubListCommand clubListCommand) {
		this.clubListCommand = clubListCommand;
	}

	// 단순이동
	@RequestMapping(value="clubInsertPage1.club", method=RequestMethod.GET)
	public String clubInsertPage() {
		
		return "club/clubInsertPage1";
	}
	
	// method 이동
	@RequestMapping(value="clubListPage.club", method=RequestMethod.GET)
	public String clubListPage(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		clubListCommand.execute(sqlSession, model);
		
		return "club/clubListPage";
	}
	
	@RequestMapping(value="clubInsertPage2.club", method=RequestMethod.GET)
	public String clubInsertPage2() {
		
		
		
		return "club/clubInsertPage2";
	}
}
