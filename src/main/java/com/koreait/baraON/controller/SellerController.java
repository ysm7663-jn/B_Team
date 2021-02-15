package com.koreait.baraON.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.baraON.command.reservation.StateChangeCommand;
import com.koreait.baraON.command.seller.AllPlaceSearch2Command;
import com.koreait.baraON.command.seller.AllPlaceSearchCommand;
import com.koreait.baraON.command.seller.PlaceCaSearch2Command;
import com.koreait.baraON.command.seller.PlaceCaSearchCommand;
import com.koreait.baraON.command.seller.PlaceList2Command;
import com.koreait.baraON.command.seller.ReservationListCommand;
import com.koreait.baraON.command.seller.SellerEmailAuthCommand;
import com.koreait.baraON.command.seller.SellerPwSearchCommand;
import com.koreait.baraON.command.seller.SellerPwUpdateCommand;
import com.koreait.baraON.command.seller.SellerSearchCommand;
import com.koreait.baraON.command.seller.SellerUpdateCommand;
import com.koreait.baraON.command.seller.SpaceViewPageCommand;
import com.koreait.baraON.dto.PageVo;
import com.koreait.baraON.dto.PlaceDto;
import com.koreait.baraON.dto.ReservationDto;
import com.koreait.baraON.dto.SellerDto;

@Controller
public class SellerController {

	@Autowired
	private SqlSession sqlSession;
	
	private JavaMailSender javaMailSender;
	
	private SpaceViewPageCommand spaceViewPageCommand;
	private AllPlaceSearchCommand allPlaceSearchCommand;
	private AllPlaceSearch2Command allPlaceSearch2Command;
	private PlaceCaSearchCommand placeCaSearchCommand;
	private PlaceCaSearch2Command placeCaSearch2Command;
	private SellerPwSearchCommand sellerPwSearchCommand;
	private SellerPwUpdateCommand sellerPwUpdateCommand;
	private SellerUpdateCommand sellerUpdateCommand;
	private PlaceList2Command placeList2Command;
	private ReservationListCommand reservationListCommand;
	private SellerSearchCommand sellerSearchCommand;
	private SellerEmailAuthCommand sellerEmailAuthCommand;
	private StateChangeCommand stateChangeCommand;
	
	@Autowired
	public void setCommand(SpaceViewPageCommand spaceViewPageCommand,
							AllPlaceSearchCommand allPlaceSearchCommand,
							AllPlaceSearch2Command allPlaceSearch2Command,
							PlaceCaSearchCommand placeCaSearchCommand,
							PlaceCaSearch2Command placeCaSearch2Command,
							SellerPwSearchCommand sellerPwSearchCommand,
							SellerPwUpdateCommand sellerPwUpdateCommand,
							SellerUpdateCommand sellerUpdateCommand,
							PlaceList2Command placeList2Command,
							ReservationListCommand reservationListCommand,
							SellerSearchCommand sellerSearchCommand,
							JavaMailSender javaMailSender,
							SellerEmailAuthCommand sellerEmailAuthCommand,
							StateChangeCommand stateChangeCommand) {
		this.spaceViewPageCommand=spaceViewPageCommand;
		this.allPlaceSearchCommand=allPlaceSearchCommand;
		this.allPlaceSearch2Command=allPlaceSearch2Command;
		this.placeCaSearchCommand=placeCaSearchCommand;
		this.placeCaSearch2Command=placeCaSearch2Command;
		this.sellerPwSearchCommand=sellerPwSearchCommand;
		this.sellerPwUpdateCommand=sellerPwUpdateCommand;
		this.sellerUpdateCommand=sellerUpdateCommand;
		this.placeList2Command=placeList2Command;
		this.reservationListCommand=reservationListCommand;
		this.sellerSearchCommand=sellerSearchCommand;
		this.javaMailSender=javaMailSender;
		this.sellerEmailAuthCommand=sellerEmailAuthCommand;
		this.stateChangeCommand=stateChangeCommand;
	}
	
	@RequestMapping(value="sellerJoin.seller")
	public String sellerJoin() {
		return "seller/sellerJoin";
	}
	
	@RequestMapping(value="sellerJoin2.seller")
	public String sellerJoin2() {
		return "seller/sellerJoin2";
	}
	
	@RequestMapping(value="pwCheck2.seller")
	public String spaceViewPage() {
		return "seller/pwCheck2";
	}
	
	@RequestMapping(value="sellerView.seller")
	public String sellerView() {
		return "seller/sellerView";
	}
	
	@RequestMapping(value="sellerSearch.seller", 
			 method=RequestMethod.POST,
			 produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sellerSearch(@RequestParam("s_id") String s_id,
										  Model model) {
	model.addAttribute("s_id",s_id);
	return sellerSearchCommand.execute(sqlSession, model);
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
	
	@RequestMapping(value="emailAuth.seller", 
			method=RequestMethod.POST,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> emailAuth(@RequestBody SellerDto sellerDto,
										Model model) {
	model.addAttribute("s_email", sellerDto.getS_email());
	model.addAttribute("javaMailSender", javaMailSender);
	return sellerEmailAuthCommand.execute(sqlSession, model);
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
			model.addAttribute("sellerDto", sellerDto);
		}
	return sellerUpdateCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="allPlaceSearch.seller", 
			method=RequestMethod.POST,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> allPlaceSearch(@RequestBody PlaceDto placeDto,
											Model model){
	if (placeDto != null) {
	model.addAttribute("placeDto", placeDto);
	}
	return allPlaceSearchCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="placeCaSearch.seller", 
					method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> placeCaSearch(@RequestBody PlaceDto placeDto,
												Model model){
		if(placeDto != null) {
		model.addAttribute("placeDto", placeDto);
		}
		return placeCaSearchCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="allPlaceSearch2.seller", 
			method=RequestMethod.POST,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> allPlaceSearch2(@RequestBody PlaceDto placeDto,
											Model model){
	if (placeDto != null) {
	model.addAttribute("placeDto", placeDto);
	}
	return allPlaceSearch2Command.execute(sqlSession, model);
	}
	
	@RequestMapping(value="placeCaSearch2.seller", 
			method=RequestMethod.POST,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> placeCaSearch2(@RequestBody PlaceDto placeDto,
			Model model){
		if(placeDto != null) {
			model.addAttribute("placeDto", placeDto);
		}
		return placeCaSearch2Command.execute(sqlSession, model);
	}
	
	@RequestMapping(value="reviewPage.seller")
	public String reviiewPage() {
		return "seller/reviewPage";
	}
	
	@RequestMapping(value="placeList.seller",
	        method=RequestMethod.POST,
	        produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> placeList(@RequestBody PageVo pageVo, Model model) {
	model.addAttribute("page", pageVo.getPage());
	return placeList2Command.execute(sqlSession, model);
	}
	
	@RequestMapping(value="reservation.seller")
	public String reservation() {
		return "seller/reservation";
	}
	
	@RequestMapping(value="reservationList.seller",
				     method=RequestMethod.POST,
				     produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> reservationList(@RequestBody PageVo pageVo, Model model) {
	model.addAttribute("page", pageVo.getPage());
	return reservationListCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="reservation/{res_no}",	// 경로에 포함된 
			method=RequestMethod.GET,
			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> stateChange(@RequestBody ReservationDto reservationDto, Model model) {
		model.addAttribute("reservationDto", reservationDto);
		return stateChangeCommand.execute(sqlSession, model);
	}
	
	
}
