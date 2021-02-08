package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.baraON.command.reservation.ReservationInsertCommand;

@Controller
public class ReservationController {

	private SqlSession sqlSession;
	private ReservationInsertCommand reservationInsertCommand;
	
	@Autowired
	public void setCommand(SqlSession sqlSession,
							ReservationInsertCommand reservationInsertCommand) {
		this.sqlSession = sqlSession;
		this.reservationInsertCommand = reservationInsertCommand;
	}
	
	
	@RequestMapping(value="reservationPage.reservation")
	public String reservationPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		return "reservation/reservationPage";
	}
}
