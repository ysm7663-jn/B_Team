package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.command.myPage.WishDeleteCommand;
import com.koreait.baraON.command.myPage.WishListCommand;

@Controller
public class MyPageController {
	@Autowired
	private SqlSession sqlSession;
	
	private WishListCommand wishListCommand;
	private WishDeleteCommand wishDeleteCommand;
	
	@Autowired
	public void setCommand(WishListCommand wishListCommand,
							 WishDeleteCommand wishDeleteCommand) {
		this.wishListCommand = wishListCommand;
		this.wishDeleteCommand = wishDeleteCommand;
	}
	
	@RequestMapping(value="profile.myPage", method=RequestMethod.GET)
	public String myPage(HttpServletRequest request) {
		return "myPage/profile";
	}
	
	@RequestMapping(value="wishList.myPage", method=RequestMethod.GET)
	public String wishList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		wishListCommand.execute(sqlSession, model);
		return "myPage/wishList";
	}
	
	@RequestMapping(value="wishDelete.myPage", method=RequestMethod.GET)
	public String wishDelete(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		wishDeleteCommand.execute(sqlSession, model);
		return "redirect:wishList.myPage";
	}
}
