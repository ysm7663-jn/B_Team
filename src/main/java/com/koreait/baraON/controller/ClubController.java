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

import com.koreait.baraON.command.club.ClubInsertCommand;
import com.koreait.baraON.command.club.ClubListCommand;
import com.koreait.baraON.dto.ClubDto;

@Controller
public class ClubController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private ClubListCommand clubListCommand;
	private ClubInsertCommand clubInsertCommand;
	
	@Autowired
	public void setCommand(ClubListCommand clubListCommand,
						   ClubInsertCommand clubInsertCommand) {
		this.clubListCommand = clubListCommand;
		this.clubInsertCommand = clubInsertCommand;
	}

	@RequestMapping(value="clubInsertPage1.club", method=RequestMethod.GET)
	public String clubInsertPage(ClubDto clubDto, Model model) {
		
		model.addAttribute("c_title", clubDto.getC_title());
		model.addAttribute("c_min", clubDto.getC_min());
		model.addAttribute("c_max", clubDto.getC_max());
		model.addAttribute("c_money", clubDto.getC_money());
		model.addAttribute("c_startDate", clubDto.getC_startDate());
		model.addAttribute("c_endDate", clubDto.getC_endDate());
		
		model.addAttribute("clubDto", clubDto);
		
		return "club/clubInsertPage1";
	}
	
  	@RequestMapping(value="clubInsertPage2.club", method=RequestMethod.GET)
	public String clubInsertPage2(Model model) {
		
  		
  		
		return "club/clubInsertPage2";
	}
	
	// method 이동
	@RequestMapping(value="clubListPage.club", method=RequestMethod.GET)
	public String clubListPage(HttpServletRequest request, Model model) {
		
		clubListCommand.execute(sqlSession, model);
		
		return "club/clubListPage";
	}
	
	@RequestMapping(value="clubInsert.club", method=RequestMethod.GET)
	public String clubInsert(MultipartHttpServletRequest multipartRequest, RedirectAttributes rttr, Model model) {
		
		model.addAttribute("multipartRequest", multipartRequest);
		model.addAttribute("rttr", rttr);
		
		clubInsertCommand.execute(sqlSession, model);
		
		return "redirect:clubListPage.club";
	}
	
}