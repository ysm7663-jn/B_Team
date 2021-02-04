package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.baraON.command.myPage.WishListCommand;

@Controller
public class MyPageController {
	@Autowired
	private SqlSession sqlSession;
	
	private WishListCommand wishListCommand;
	
	@Autowired
	public void setCommand(WishListCommand wishListCommand) {
		this.wishListCommand = wishListCommand;
	}
	
	@RequestMapping(value="profile.myPage", method=RequestMethod.GET)
	public String myPage(HttpServletRequest request) {
		return "myPage/profile";
	}
	
	@RequestMapping(value="wishList.myPage", method=RequestMethod.GET)
	public String wishList(HttpServletRequest request, Model model) {
		wishListCommand.execute(sqlSession, model);
		
		return "myPage/wishList";
	}
}
