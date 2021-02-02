package com.koreait.baraON.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.baraON.command.member.ChangePwCommand;
import com.koreait.baraON.command.member.ChkIdCommand;
import com.koreait.baraON.command.member.EmailAuthCommmand;
import com.koreait.baraON.command.member.FindIdCommand;
import com.koreait.baraON.command.member.FindPwCommand;
import com.koreait.baraON.command.member.LoginCommand;
import com.koreait.baraON.command.member.LogoutCommand;

@Controller
public class MemberController {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private KaKaoAPI kakaoAPI;
	
	//private BaraONCommand baraONCommand;
	private LoginCommand loginCommand;
	private LogoutCommand logoutCommand;
	private ChkIdCommand chkIdCommand;
	private FindIdCommand findIdCommand;
	private FindPwCommand findPwCommand;
	private EmailAuthCommmand emailAuthCommmand;
	private ChangePwCommand changePwCommand;
	
	@Autowired
	public void setCommand(LoginCommand loginCommand,
							 LogoutCommand logoutCommand,
							 ChkIdCommand chkIdCommand,
							 FindIdCommand findIdCommand,
							 FindPwCommand findPwCommand,
							 EmailAuthCommmand emailAuthCommmand,
							 ChangePwCommand changePwCommand) {
		this.loginCommand = loginCommand;
		this.logoutCommand = logoutCommand;
		this.chkIdCommand = chkIdCommand;
		this.findIdCommand = findIdCommand;
		this.findPwCommand = findPwCommand;
		this.emailAuthCommmand = emailAuthCommmand;
		this.changePwCommand = changePwCommand;
	}
	
	//단순이동
	@RequestMapping(value="loginPage.member", method=RequestMethod.GET)
	public String loginPage() {
		return "member/loginPage";
	}
	
	@RequestMapping(value="login.member", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Model model, HttpServletResponse response) {
		model.addAttribute("request", request);

		// 아이디 기억하기
		chkIdCommand.execute(response, model);
		
		// 로그인
		loginCommand.execute(sqlSession, model);
		if(request.getParameter("grade").equals("member")) { // member일때
			return "member/loginResult";
		} else {  // seller일때
			return "member/loginResult2";
		}
	}
	
	@RequestMapping(value="loginKakao.member")
	public String kakaoLogin(@RequestParam(value="code", required=false) String code, HttpSession session) throws Exception {
		String access_Token = kakaoAPI.getAccessToken(code);
		HashMap<String, Object> userInfo = kakaoAPI.getUserInfo(access_Token);
		
		System.out.println("login Controller: " + userInfo);
		System.out.println("access_Token : " + access_Token);
		System.out.println("userInfo : " + userInfo.get("email"));
		System.out.println("nickname : " + userInfo.get("nickname"));
		System.out.println("profile_image : " + userInfo.get("profile_image"));
		/*if(userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
		}*/
		
		return "member/loginPage";
	}
	
	@RequestMapping(value="logout.member", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		logoutCommand.execute(sqlSession, model);
		return "index";
	}
	
	// 단순이동
	@RequestMapping(value="findPage.member", method=RequestMethod.GET)
	public String findPage(HttpServletRequest request) {
		return "member/findPage";
	}
	
	@RequestMapping(value="findId.member", method=RequestMethod.POST)
	public String findId(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		findIdCommand.execute(sqlSession, model);
		return "member/findPage";
	}
	
	@RequestMapping(value="findIdPage.member", method=RequestMethod.GET)
	public String findIdPage(HttpServletRequest request) {
		return "member/findIdPage";
	}
	
	@RequestMapping(value="findPw.member", method=RequestMethod.POST)
	public String findPw(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		findPwCommand.execute(sqlSession, model);
		return "member/findPage";
	}

	@Autowired
	private JavaMailSender mailSender;
	//post?
	@RequestMapping(value="findPwPage.member", method=RequestMethod.GET)
	public String findPwPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("mailSender", mailSender);
		emailAuthCommmand.execute(sqlSession, model);
		return "member/findPwPage";
	}
	
	@RequestMapping(value="findPwPage2.member", method=RequestMethod.GET)
	public String findPwPage2(HttpServletRequest request) {
		return "member/findPwPage2";
	}
	
	@RequestMapping(value="changePw.member", method=RequestMethod.POST)
	public String changePw(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		changePwCommand.execute(sqlSession, model);
		return "member/findPwPage3";
	}
}
