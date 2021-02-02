package com.koreait.baraON.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.baraON.command.review.ReviewDeleteCommand;
import com.koreait.baraON.command.review.ReviewInsertCommand;
import com.koreait.baraON.command.review.ReviewUpdateCommand;
import com.koreait.baraON.dto.ReviewDto;

@Controller
public class ReviewController {

	private SqlSession sqlSession;
	private ReviewUpdateCommand reviewUpdateCommand;
	private ReviewDeleteCommand reviewDeleteCommand;
	private ReviewInsertCommand reviewInsertCommand;
	
	@Autowired
	public void setSessionAndCommands(SqlSession sqlSession,
										  ReviewUpdateCommand reviewUpdateCommand,
										  ReviewDeleteCommand reviewDeleteCommand,
										  ReviewInsertCommand reviewInsertCommand) {
		this.sqlSession = sqlSession;
		this.reviewUpdateCommand = reviewUpdateCommand;
		this.reviewDeleteCommand = reviewDeleteCommand;
		this.reviewInsertCommand = reviewInsertCommand;
	}
	
	
	
	@RequestMapping(value="reviewUpdate.review", method=RequestMethod.PUT, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> reviewUpdate(@RequestBody ReviewDto reviewDto , Model model) {
		model.addAttribute("reviewDto",reviewDto);
		
		return reviewUpdateCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="reviewDelete,review", method=RequestMethod.PUT, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> reviewDelete(@RequestBody int pv_no , Model model) {
		model.addAttribute("pv_no", pv_no);
		return reviewDeleteCommand.execute(sqlSession, model);
	}
	
	@RequestMapping(value="reviewInsert.review", method=RequestMethod.POST)
	public String reviewInsert(MultipartHttpServletRequest multipartRequest, Model model) {
		model.addAttribute("multipartRequest", multipartRequest);
		
		reviewInsertCommand.execute(sqlSession, model);
		return "redirect:placeViewPage.place?no="+multipartRequest.getParameter("p_no");
	}
}
