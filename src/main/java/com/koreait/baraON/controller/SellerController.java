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
import com.koreait.baraON.command.seller.SellerPwSearchCommand;
import com.koreait.baraON.command.seller.SellerPwUpdateCommand;
import com.koreait.baraON.command.seller.SellerUpdateCommand;
import com.koreait.baraON.command.seller.SpaceViewPageCommand;
import com.koreait.baraON.dto.PlaceDto2;
import com.koreait.baraON.dto.SellerDto;

@Controller
public class SellerController {

	@Autowired
	private SqlSession sqlSession;
	
	private SpaceViewPageCommand spaceViewPageCommand;
	private AllPlaceSearchCommand allPlaceSearchCommand;
	private PlaceCaSearchCommand placeCaSearchCommand;
	private PlaceCaSearch2Command placeCaSearch2Command;
	private SellerPwSearchCommand sellerPwSearchCommand;
	private SellerPwUpdateCommand sellerPwUpdateCommand;
	private SellerUpdateCommand sellerUpdateCommand;
	
	@Autowired
	public void setCommand(SpaceViewPageCommand spaceViewPageCommand,
							AllPlaceSearchCommand allPlaceSearchCommand,
							PlaceCaSearchCommand placeCaSearchCommand,
							PlaceCaSearch2Command placeCaSearch2Command,
							SellerPwSearchCommand sellerPwSearchCommand,
							SellerPwUpdateCommand sellerPwUpdateCommand,
							SellerUpdateCommand sellerUpdateCommand) {
		this.spaceViewPageCommand=spaceViewPageCommand;
		this.allPlaceSearchCommand=allPlaceSearchCommand;
		this.placeCaSearchCommand=placeCaSearchCommand;
		this.placeCaSearch2Command=placeCaSearch2Command;
		this.sellerPwSearchCommand=sellerPwSearchCommand;
		this.sellerPwUpdateCommand=sellerPwUpdateCommand;
		this.sellerUpdateCommand=sellerUpdateCommand;
	}
	
	@RequestMapping(value="pwCheck2.seller")
	public String spaceViewPage() {
		return "seller/pwCheck2";
	}
	
	@RequestMapping(value="sellerView.seller")
	public String sellerView() {
		return "seller/sellerView";
	}
	
	@RequestMapping(value="sellerPwSearch.seller", 
			method=RequestMethod.POST,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sellerPwSearch(@RequestBody SellerDto sellerDto,
												Model model) {
		model.addAttribute("s_no",sellerDto.getS_no());
		return sellerPwSearchCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="spaceViewPage.seller")
	public String spaceViewPage(Model model) {
		spaceViewPageCommand.execute(sqlSession, model);
		return "seller/spaceViewPage";
	}
	
	
	
	@RequestMapping(value="sellerPwUpdate.seller",
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sellerPwUpdate(@RequestBody SellerDto sellerDto,
										Model model){
	if (sellerDto != null) {
		model.addAttribute("sellerDto", sellerDto);
	}
		return sellerPwUpdateCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="sellerUpdate.seller",
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sellerUpdate(@RequestBody SellerDto sellerDto,
											Model model){
		if (sellerDto != null) {
			model.addAttribute("memberDto2", sellerDto);
		}
	return sellerUpdateCommand.execute(sqlSession, model);
	}
	
	
	
	@RequestMapping(value="allPlaceSearch.seller", 
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> allPlaceSearch(@RequestBody PlaceDto2 placeDto2,
												Model model){
		if (placeDto2 != null) {
		model.addAttribute("placeDto2", placeDto2);
		}
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
	public Map<String, Object> placeCaSearch2(@RequestBody SellerDto sellerDto,
			Model model){
		if(sellerDto != null) {
			model.addAttribute("sellerDto", sellerDto);
		}
		return placeCaSearch2Command.execute(sqlSession, model);
	}
	
	@RequestMapping(value="reviewPage.seller")
	public String reviiewPage() {
		return "seller/reviewPage";
	}
	
	@RequestMapping(value="reservation.seller")
	public String reseravation() {
		return "seller/reseravation";
	}
	
}
