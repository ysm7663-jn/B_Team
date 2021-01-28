package com.koreait.baraON.controller.member;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.baraON.command.BaraONCommand;
import com.koreait.baraON.command.LoginCommand;

@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//private BaraONCommand baraONCommand;
	private LoginCommand loginCommand;
	
	@Autowired
	public void setCommand(LoginCommand loginCommand) {
		this.loginCommand = loginCommand;
	}
	
	//단순이동
	@RequestMapping(value="loginPage.member", method=RequestMethod.GET)
	public String loginPage() {
		return "member/loginPage";
	}
	
	@RequestMapping(value="login.member", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		loginCommand.execute(sqlSession, model);
		
		return "member/loginResult";
	}
	
}
