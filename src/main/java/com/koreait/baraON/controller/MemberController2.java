package com.koreait.baraON.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.baraON.command.member.MemberSearchCommand;
import com.koreait.baraON.dto.MemberDto;

@Controller
public class MemberController2 {

	@Autowired
	private SqlSession sqlSession;
	
	// private BaraONCommand baraONCommand;
	private MemberSearchCommand memberSearchCommand;
	@Autowired
	public void setCommand(MemberSearchCommand memberSearchCommand) {
		this.memberSearchCommand=memberSearchCommand;
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
	
	
	
	
	
	
	
	
	
	
}