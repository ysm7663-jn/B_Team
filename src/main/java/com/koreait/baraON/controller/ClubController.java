package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.command.club.ChkOutClubCommand;
import com.koreait.baraON.command.club.ClubDeleteCommand;
import com.koreait.baraON.command.club.ClubInsertCommand;
import com.koreait.baraON.command.club.ClubListCommand;
import com.koreait.baraON.command.club.ClubUpdateCommand;
import com.koreait.baraON.command.club.ClubViewCommand;
import com.koreait.baraON.command.club.JoinClubCommand;
import com.koreait.baraON.command.club.LikeClubCommand;
import com.koreait.baraON.command.club.UnLikeClubCommand;
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
	private JoinClubCommand joinClubCommand;
	private LikeClubCommand likeClubCommand;
	private UnLikeClubCommand unLikeClubCommand;
	private ChkOutClubCommand chkOutClubCommand;
	
	@Autowired
	public void setCommand(ClubListCommand clubListCommand,
						   ClubInsertCommand clubInsertCommand,
						   ClubViewCommand clubViewCommand,
						   ClubDeleteCommand clubDeleteCommand,
						   ClubUpdateCommand clubUpdateCommand,
						   JoinClubCommand joinClubCommand,
						   ChkOutClubCommand chkOutClubCommand,
						   LikeClubCommand likeClubCommand,
						   UnLikeClubCommand unLikeClubCommand
						  ) {
		this.clubListCommand = clubListCommand;
		this.clubInsertCommand = clubInsertCommand;
		this.clubViewCommand = clubViewCommand;
		this.clubDeleteCommand = clubDeleteCommand;
		this.clubUpdateCommand = clubUpdateCommand;
		this.joinClubCommand = joinClubCommand;
		this.likeClubCommand = likeClubCommand;
		this.unLikeClubCommand = unLikeClubCommand;
		this.chkOutClubCommand = chkOutClubCommand;
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
	public String clubDelete(HttpServletRequest request, @RequestParam(value="isDetailPage", required=false, defaultValue="false") boolean isDetailPage , RedirectAttributes rttr, Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		clubDeleteCommand.execute(sqlSession, model);
		
		if(isDetailPage) {
			return "redirect:clubManagePage.myPage?state=0";
		} else {
			return "redirect:clubListPage.club";
		}
	}
	
	@RequestMapping(value="clubUpdatePage.club", method=RequestMethod.POST)
	public String clubUpdatePage(ClubDto clubDto, Model model) {
		
		model.addAttribute("clubDto", clubDto);
		
		return "club/clubUpdatePage";
	}
	
	@RequestMapping(value="clubUpdate.club", method=RequestMethod.POST)
	public String simpleUpdate(MultipartHttpServletRequest multipartRequest, RedirectAttributes rttr, Model model) {

		model.addAttribute("multipartRequest", multipartRequest);
		model.addAttribute("rttr", rttr);
		
		clubUpdateCommand.execute(sqlSession, model);
		
		return "redirect:clubViewPage.club?c_no=" + multipartRequest.getParameter("c_no") + "&m_no=" + multipartRequest.getParameter("m_no");
	}
	
	@RequestMapping(value="joinClub.club", method=RequestMethod.POST)
	public String joinClub(HttpServletRequest request, RedirectAttributes rttr, Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		joinClubCommand.execute(sqlSession, model);
		return "redirect:clubViewPage.club?c_no=" + request.getParameter("c_no");
	}
	
	@RequestMapping(value="chkOutClub.club", method=RequestMethod.POST)
	public String chkOutClub(HttpServletRequest request, RedirectAttributes rttr, Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		chkOutClubCommand.execute(sqlSession, model);
		
		return "redirect:clubListPage.club";
	}
	
	@RequestMapping(value="likeClub.club", method=RequestMethod.POST)
	public String joinClub(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		likeClubCommand.execute(sqlSession, model);
		return "redirect:clubViewPage.club?c_no=" + request.getParameter("c_no");
	}
	
	@RequestMapping(value="unLikeClub.club", method=RequestMethod.POST)
	public String chkOutClub(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		unLikeClubCommand.execute(sqlSession, model);
		return "redirect:clubListPage.club";
	}
	
}