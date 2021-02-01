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

import com.koreait.baraON.command.review.ReviewUpdateCommand;
import com.koreait.baraON.dto.ReviewDto;

@Controller
public class ReviewController {

	private SqlSession sqlSession;
	private ReviewUpdateCommand reviewUpdateCommand;
	
	@Autowired
	public void setSessionAndCommands(SqlSession sqlSession,
										  ReviewUpdateCommand reviewUpdateCommand) {
		this.sqlSession = sqlSession;
		this.reviewUpdateCommand = reviewUpdateCommand;
	}
	
	
	
	@RequestMapping(value="reviewUpdate.review", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> reviewUpdate(@RequestBody ReviewDto reviewDto , Model model) {
		model.addAttribute("reviewDto",reviewDto);
		
		return reviewUpdateCommand.execute(sqlSession, model);
	}
}
