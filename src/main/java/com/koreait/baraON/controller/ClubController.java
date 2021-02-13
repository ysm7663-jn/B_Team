package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.command.club.ClubDeleteCommand;
import com.koreait.baraON.command.club.ClubInsertCommand;
import com.koreait.baraON.command.club.ClubListCommand;
import com.koreait.baraON.command.club.ClubUpdateCommand;
import com.koreait.baraON.command.club.ClubViewCommand;
import com.koreait.baraON.dto.ClubDto;

@Controller
public class ClubController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private ClubListCommand clubListCommand;
	private ClubInsertCommand clubInsertCommand;
	private ClubViewCommand clubViewCommand;
	private ClubDeleteCommand clubDeleteCommand;
	private ClubUpdateCommand clubUpdateCommand;
	
	@Autowired
	public void setCommand(ClubListCommand clubListCommand,
						   ClubInsertCommand clubInsertCommand,
						   ClubViewCommand clubViewCommand,
						   ClubDeleteCommand clubDeleteCommand,
						   ClubUpdateCommand clubUpdateCommand
						  ) {
		this.clubListCommand = clubListCommand;
		this.clubInsertCommand = clubInsertCommand;
		this.clubViewCommand = clubViewCommand;
		this.clubDeleteCommand = clubDeleteCommand;
		this.clubUpdateCommand = clubUpdateCommand;
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
	
	@RequestMapping(value="clubInsert.club", method=RequestMethod.POST)
	public String clubInsert(MultipartHttpServletRequest multipartRequest, RedirectAttributes rttr, Model model) {
		
		model.addAttribute("multipartRequest", multipartRequest);
		model.addAttribute("rttr", rttr);
		clubInsertCommand.execute(sqlSession, model);
		return "redirect:clubListPage.club";
	}
	
	@RequestMapping(value="clubViewPage.club", method=RequestMethod.GET)
	public String clubView(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		clubViewCommand.execute(sqlSession, model);
		
		return "club/clubViewPage";
	}
	
	@RequestMapping(value="clubDelete.club", method=RequestMethod.POST)
	public String clubDelete(HttpServletRequest request, RedirectAttributes rttr, Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		clubDeleteCommand.execute(sqlSession, model);
		
		return "redirect:clubListPage.club";
	}
	
	@RequestMapping(value="clubUpdatePage.club", method=RequestMethod.POST)
	public String clubUpdatePage(ClubDto clubDto, Model model) {
		
		model.addAttribute("clubDto", clubDto);
		
		return "club/clubUpdatePage";
	}
	
	@RequestMapping(value="clubUpdate.club", method=RequestMethod.POST)
	public String simpleUpdate(HttpServletRequest request,
			                   RedirectAttributes rttr,
			                   Model model) {

		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		
		clubUpdateCommand.execute(sqlSession, model);
		
		return "redirect:clubViewPage.club?c_no=" + request.getParameter("c_no") + "&m_no=" + request.getParameter("m_no");
		
	}
	
}