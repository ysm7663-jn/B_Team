package com.koreait.baraON.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReservationDto {
	private int resNo;
	private int mNo;
	private int poNo;
	private Date resDate;
	private int resPeople;
	private int resState;
}
