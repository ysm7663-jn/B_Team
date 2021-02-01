package com.koreait.baraON.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.baraON.command.member.MemberDropCommand;
import com.koreait.baraON.command.member.MemberSearchCommand;

@Controller
public class MemberController2 {

	@Autowired
	private SqlSession sqlSession;
	
	// private BaraONCommand baraONCommand;
	private MemberSearchCommand memberSearchCommand;
	private MemberDropCommand memberDropCommand;
	
	@Autowired
	public void setCommand(MemberSearchCommand memberSearchCommand,
							MemberDropCommand memberDropCommand) {
		this.memberSearchCommand=memberSearchCommand;
		this.memberDropCommand=memberDropCommand;
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
					 method=RequestMethod.GET,
					 produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberSearch(@RequestParam("mId") String mId,
												Model model) {
		model.addAttribute("mId",mId);
		return memberSearchCommand.execute(sqlSession, model);
	}
	@RequestMapping(value="memberDrop.member",method=RequestMethod.POST)
	public String memberDrop(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memberDropCommand.execute(sqlSession, model);
		return "index";
	}
	
}