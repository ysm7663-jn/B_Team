package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.baraON.command.club.ClubInsertCommand;
import com.koreait.baraON.command.club.ClubListCommand;
import com.koreait.baraON.command.club.ClubViewCommand;

@Controller
public class ClubController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private ClubListCommand clubListCommand;
	private ClubInsertCommand clubInsertCommand;
	private ClubViewCommand clubViewCommand;
	
	@Autowired
	public void setCommand(ClubListCommand clubListCommand,
						   ClubInsertCommand clubInsertCommand,
						   ClubViewCommand clubViewCommand) {
		this.clubListCommand = clubListCommand;
		this.clubInsertCommand = clubInsertCommand;
		this.clubViewCommand = clubViewCommand;
	}

	@RequestMapping(value="clubInsertPage.club", method=RequestMethod.GET)
	public String clubInsertPage() {
		return "club/clubInsertPage";
	}
	
	// method 이동
	@RequestMapping(value="clubListPage.club", method=RequestMethod.GET)
	public String clubListPage(Model model) {
		
		clubListCommand.execute(sqlSession, model);
		
		return "club/clubListPage";
	}
	
	@RequestMapping(value="clubInsert.club", method=RequestMethod.GET)
	public String clubInsert(MultipartHttpServletRequest multipartRequest, Model model) {
		
		model.addAttribute("multipartRequest", multipartRequest);
		
		clubInsertCommand.execute(sqlSession, model);
		
		return "redirect:clubListPage.club";
	}
	
	@RequestMapping(value="clubViewPage.club", method=RequestMethod.GET)
	public String clubView(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		clubViewCommand.execute(sqlSession, model);
		
		return "club/clubViewPage";
	}
	
}
