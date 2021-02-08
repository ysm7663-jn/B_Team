package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.command.place.PlaceInsertCommand;
import com.koreait.baraON.command.place.PlaceListCommand;
import com.koreait.baraON.command.place.PlaceViewCommand;
import com.koreait.baraON.dao.PlaceDao;

@Controller
public class PlaceController {

	@Autowired
	private SqlSession sqlSession;
	
	private PlaceListCommand placeListCommand;
	private PlaceViewCommand placeViewCommand;
	private PlaceInsertCommand placeInsertCommand;
	
	@Autowired
	public void setCommand(PlaceListCommand placeListCommand,
							PlaceViewCommand placeViewCommand,
							PlaceInsertCommand placeInsertCommand) {
		this.placeListCommand = placeListCommand;
		this.placeViewCommand = placeViewCommand;
		this.placeInsertCommand = placeInsertCommand;
	}
	
	@RequestMapping(value="placeListPage.place", method=RequestMethod.GET)
	public String placeListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		placeListCommand.execute(sqlSession, model);
		return "place/placeListPage";
	}
	
	@RequestMapping(value="placeViewPage.place", method=RequestMethod.GET)
	public String placeViewPage(HttpServletRequest request, RedirectAttributes rttr, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		placeViewCommand.execute(sqlSession, model);
		return "place/placeViewPage";
	}
	
	@RequestMapping(value="placeInsertPage.place", method=RequestMethod.GET)
	public String placeInsertPage(Model model) {
		PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
		model.addAttribute("categoryList", placeDao.placeCategoryList());
		
		return "place/placeInsertPage";
	}
	
	@RequestMapping(value="placeInsert.place", method=RequestMethod.POST)
	public String placeInsert(MultipartHttpServletRequest multipartRequest, Model model) {
		model.addAttribute("multipartRequest", multipartRequest);
		
		placeInsertCommand.execute(sqlSession, model);
		
		return "redirect:placeViewPage.place?no="+(int)model.asMap().get("currPNo");
	}
}
