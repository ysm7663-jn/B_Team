package com.koreait.baraON.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.baraON.command.member.EmailAuthCommand2;
import com.koreait.baraON.command.member.MemberInsertCommand;
import com.koreait.baraON.command.member.MemberJoin2Command;
import com.koreait.baraON.command.member.MemberNickSearchCommand;
import com.koreait.baraON.command.member.MemberNickUpdateCommand;
import com.koreait.baraON.command.member.MemberPwSearchCommand;
import com.koreait.baraON.command.member.MemberPwUpdateCommand;
import com.koreait.baraON.command.member.MemberSearchCommand;
import com.koreait.baraON.command.member.MemberUpdateCommand;
import com.koreait.baraON.command.member.MemberViewCommand;
import com.koreait.baraON.dto.MemberDto2;

@Controller
public class MemberController2 {

	@Autowired
	private SqlSession sqlSession;
	
	// JavaMailSender mailSender
	private JavaMailSender javaMailSender;
	
	// private BaraONCommand baraONCommand;
	private MemberJoin2Command memberJoin2Command;
	private MemberSearchCommand memberSearchCommand;
	private MemberNickSearchCommand memberNickSearchCommand;
	private EmailAuthCommand2 emailAuthCommand2;
	private MemberPwSearchCommand memberPwSearchCommand;
	private MemberInsertCommand memberInsertCommand;
	private MemberPwUpdateCommand memberPwUpdateCommand;
	private MemberNickUpdateCommand memberNickUpdateCommand;
	private MemberUpdateCommand memberUpdateCommand;

	
	@Autowired
	public void setCommand(MemberJoin2Command memberJoin2Command,
							MemberSearchCommand memberSearchCommand,
							MemberNickSearchCommand memberNickSearchCommand,
							EmailAuthCommand2 emailAuthCommand2,
							JavaMailSender javaMailSender,
							MemberPwSearchCommand memberPwSearchCommand,
							MemberInsertCommand memberInsertCommand,
							MemberPwUpdateCommand memberPwUpdateCommand,
							MemberNickUpdateCommand memberNickUpdateCommand,
							MemberUpdateCommand memberUpdateCommand) {
		
		this.memberJoin2Command=memberJoin2Command;
		this.memberSearchCommand=memberSearchCommand;
		this.memberNickSearchCommand=memberNickSearchCommand;
		this.emailAuthCommand2=emailAuthCommand2;
		this.javaMailSender = javaMailSender;
		this.memberPwSearchCommand =memberPwSearchCommand;
		this.memberInsertCommand=memberInsertCommand;
		this.memberPwUpdateCommand=memberPwUpdateCommand;
		this.memberNickUpdateCommand=memberNickUpdateCommand;
		this.memberUpdateCommand=memberUpdateCommand;
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
	
	@RequestMapping(value="memberPwSearch.member", 
			method=RequestMethod.POST,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberPwSearch(@RequestBody MemberDto2 memberDto2,
												Model model) {
		model.addAttribute("m_id",memberDto2.getM_id());
		return memberPwSearchCommand.execute(sqlSession, model);
	}
	
	
	@RequestMapping(value="emailAuth.member", 
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> emailAuth(@RequestBody MemberDto2 memberDto2,
											Model model) {
		model.addAttribute("m_email", memberDto2.getM_email());
		model.addAttribute("javaMailSender", javaMailSender);
		return emailAuthCommand2.execute(sqlSession, model);
	}
	
	@RequestMapping(value="memberInsert.member",
					method=RequestMethod.POST)
	public Map<String, Object> memberInsert(MemberDto2 memberDto2,
											Model model){
		model.addAttribute("memberDto2", memberDto2);
		return memberInsertCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="memberView.member",
					method=RequestMethod.GET)
	public String memberView(){
		return "myPage/memberView";
	}
	
	@RequestMapping(value="memberPwUpdate.member",
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberPwUpdate(@RequestBody MemberDto2 memberDto2,
											Model model){
		if (memberDto2 != null) {
			model.addAttribute("memberDto2", memberDto2);
		}
		return memberPwUpdateCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="memberNickUpdate.member",
			method=RequestMethod.POST,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberNickUpdate(@RequestBody MemberDto2 memberDto2,
													Model model){
		if (memberDto2 != null) {
			model.addAttribute("memberDto2", memberDto2);
		}
		return memberNickUpdateCommand.execute(sqlSession, model);
	}
	
	
	
	@RequestMapping(value="memberUpdate.member",
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberUpdate(@RequestBody MemberDto2 memberDto2,
												Model model){
		if (memberDto2 != null) {
			model.addAttribute("memberDto2", memberDto2);
		}
		return memberUpdateCommand.execute(sqlSession, model);
	}
	
	
	
}