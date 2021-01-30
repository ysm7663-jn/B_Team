package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.baraON.command.place.PlaceListCommand;
import com.koreait.baraON.command.place.PlaceViewCommand;

@Controller
public class PlaceController {

	@Autowired
	private SqlSession sqlSession;
	
	private PlaceListCommand placeListCommand;
	private PlaceViewCommand placeViewCommand;
	
	@Autowired
	public void setCommand(PlaceListCommand placeListCommand,
							PlaceViewCommand placeViewCommand) {
		this.placeListCommand = placeListCommand;
		this.placeViewCommand = placeViewCommand;
	}
	
	@RequestMapping(value="placeListPage.place", method=RequestMethod.GET)
	public String placeListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		placeListCommand.execute(sqlSession, model);
		return "place/placeListPage";
	}
	
	@RequestMapping(value="placeViewPage.place", method=RequestMethod.GET)
	public String placeViewPage(HttpServletRequest request,  Model model) {
		model.addAttribute("request", request);
		placeViewCommand.execute(sqlSession, model);
		return "place/placeViewPage";
	}
	
}
