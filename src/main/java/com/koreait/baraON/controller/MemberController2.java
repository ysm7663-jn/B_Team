package com.koreait.baraON.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.baraON.command.member.EmailAuthCommand;
import com.koreait.baraON.command.member.MemberNickSearchCommand;
import com.koreait.baraON.command.member.MemberSearchCommand;

@Controller
public class MemberController2 {

	@Autowired
	private SqlSession sqlSession;
	private JavaMailSender mailSender;
	
	// private BaraONCommand baraONCommand;
	private MemberSearchCommand memberSearchCommand;
	private MemberNickSearchCommand memberNickSearchCommand;
	private EmailAuthCommand emailAuthCommand;
	
	@Autowired
	public void setCommand(MemberSearchCommand memberSearchCommand,
							MemberNickSearchCommand memberNickSearchCommand,
							EmailAuthCommand emailAuthCommand) {
		
		this.memberSearchCommand=memberSearchCommand;
		this.memberNickSearchCommand=memberNickSearchCommand;
		this.emailAuthCommand=emailAuthCommand;
	
	}
	
	@RequestMapping(value="/")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="memberJoin.member" ,method=RequestMethod.GET)
	public String memberJoin() {
		return "member/memberJoin";
	}
	
	@RequestMapping(value="memberJoin2.member" ,method=RequestMethod.GET)
	public String memberJoin2() {
		return "member/memberJoin2";
	}
	
	@RequestMapping(value="memberSearch.member", 
					 method=RequestMethod.POST,
					 produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberSearch(@RequestParam("m_id") String m_id,
											  Model model) {
		model.addAttribute("m_id",m_id);
		return memberSearchCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="memberNickSearch.member", 
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberNickSearch(@RequestParam("m_nick") String m_nick,
												Model model) {
		model.addAttribute("m_nick",m_nick);
		return memberNickSearchCommand.execute(sqlSession, model);
	}
	
	
	@RequestMapping(value="emailAuth.member", 
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> emailAuth(HttpServletRequest request,
											Model model) {
		model.addAttribute("request",request);
		model.addAttribute("mailSender", mailSender);
		return emailAuthCommand.execute(sqlSession, model);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}