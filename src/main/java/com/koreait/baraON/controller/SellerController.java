package com.koreait.baraON.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.baraON.command.seller.AllPlaceSearchCommand;
import com.koreait.baraON.command.seller.PlaceCaSearch2Command;
import com.koreait.baraON.command.seller.PlaceCaSearchCommand;
import com.koreait.baraON.command.seller.SpaceViewPageCommand;
import com.koreait.baraON.dto.PlaceDto2;

@Controller
public class SellerController {

	@Autowired
	private SqlSession sqlSession;
	
	private SpaceViewPageCommand spaceViewPageCommand;
	private AllPlaceSearchCommand allPlaceSearchCommand;
	private PlaceCaSearchCommand placeCaSearchCommand;
	private PlaceCaSearch2Command placeCaSearch2Command;
	
	@Autowired
	public void setCommand(SpaceViewPageCommand spaceViewPageCommand,
							AllPlaceSearchCommand allPlaceSearchCommand,
							PlaceCaSearchCommand placeCaSearchCommand,
							PlaceCaSearch2Command placeCaSearch2Command) {
		this.spaceViewPageCommand=spaceViewPageCommand;
		this.allPlaceSearchCommand=allPlaceSearchCommand;
		this.placeCaSearchCommand=placeCaSearchCommand;
		this.placeCaSearch2Command=placeCaSearch2Command;
	}
	
	@RequestMapping(value="spaceViewPage.seller")
	public String spaceViewPage(Model model) {
		spaceViewPageCommand.execute(sqlSession, model);
		return "seller/spaceViewPage";
	}
	
	@RequestMapping(value="allPlaceSearch.seller", 
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> allPlaceSearch(@RequestParam("s_no") int s_no,
			Model model){
		model.addAttribute("s_no", s_no);
		return allPlaceSearchCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="placeCaSearch.seller", 
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> placeCaSearch(@RequestBody PlaceDto2 placeDto2,
												Model model){
		if(placeDto2 != null) {
		model.addAttribute("placeDto2", placeDto2);
		}
		return placeCaSearchCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="placeCaSearch2.seller", 
			method=RequestMethod.POST,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> placeCaSearch2(@RequestBody PlaceDto2 placeDto2,
			Model model){
		if(placeDto2 != null) {
			model.addAttribute("placeDto2", placeDto2);
		}
		return placeCaSearch2Command.execute(sqlSession, model);
	}
	
	
	
	
}
