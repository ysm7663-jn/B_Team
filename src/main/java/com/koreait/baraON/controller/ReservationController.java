package com.koreait.baraON.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {
	
	@RequestMapping(value="reservationPage.reservation")
	public String reservationPage() {
		return "reservation/reservationPage";
	}
}
