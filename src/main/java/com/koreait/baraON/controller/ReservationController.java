package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.baraON.command.reservation.ReservationInsertCommand;
import com.koreait.baraON.command.reservation.ReservationPageCommand;

@Controller
public class ReservationController {

	private SqlSession sqlSession;
	private ReservationInsertCommand reservationInsertCommand;
	private ReservationPageCommand reservationPageCommand;
	
	@Autowired
	public void setCommand(SqlSession sqlSession,
							ReservationInsertCommand reservationInsertCommand,
							ReservationPageCommand reservationPageCommand) {
		this.sqlSession = sqlSession;
		this.reservationPageCommand = reservationPageCommand;
		this.reservationInsertCommand = reservationInsertCommand;
	}
	
	
	@RequestMapping(value="reservationPage.reservation")
	public String reservationPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		return "reservation/reservationPage";
	}
}
