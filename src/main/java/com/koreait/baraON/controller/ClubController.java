package com.koreait.baraON.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.command.club.ClubDeleteCommand;
import com.koreait.baraON.command.club.ClubInsertCommand;
import com.koreait.baraON.command.club.ClubListCommand;
import com.koreait.baraON.command.club.ClubUpdateCommand;
import com.koreait.baraON.command.club.ClubUpdateStatCommand;
import com.koreait.baraON.command.club.ClubViewCommand;
import com.koreait.baraON.command.member.MemberUpdateCommand;
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
	private ClubUpdateStatCommand clubUpdateStatCommand;
	
	@Autowired
	public void setCommand(ClubListCommand clubListCommand,
						   ClubInsertCommand clubInsertCommand,
						   ClubViewCommand clubViewCommand,
						   ClubDeleteCommand clubDeleteCommand,
						   ClubUpdateCommand clubUpdateCommand,
						   ClubUpdateStatCommand clubUpdateStatCommand) {
		this.clubListCommand = clubListCommand;
		this.clubInsertCommand = clubInsertCommand;
		this.clubViewCommand = clubViewCommand;
		this.clubDeleteCommand = clubDeleteCommand;
		this.clubUpdateCommand = clubUpdateCommand;
		this.clubUpdateStatCommand = clubUpdateStatCommand;
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
	
	@RequestMapping(value="clubDelete.club", method=RequestMethod.POST)
	public String clubDelete(HttpServletRequest request, RedirectAttributes rttr, Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		clubDeleteCommand.execute(sqlSession, model);
		
		return "redirect:clubListPage.club";
	}
	
	@RequestMapping(value="clubUpdatePage.club", method=RequestMethod.POST)
	public String clubUpdatePage(Model model) {
		
		return "club/clubUpdatePage";
	}
	
	@RequestMapping(value="clubUpdate.club", method=RequestMethod.POST)
	public String simpleUpdate(HttpServletRequest request,
			                   RedirectAttributes rttr,
			                   Model model) {

		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		
		clubUpdateCommand.execute(sqlSession, model);
		
		return "redirect:clubViewPage.club?c_no=" + request.getParameter("c_no");
		
	}
	
	@RequestMapping(value="updateStat.club",
            method=RequestMethod.PUT,
            produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberUpdate(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
	return clubUpdateStatCommand.execute(sqlSession, model);
}
	
	
}
