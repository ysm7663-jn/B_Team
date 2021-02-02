package com.koreait.baraON.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReservationDto {
	private int res_no;
	private int m_no;
	private int po_no;
	private Date res_date;
	private int res_people;
	private int res_state;
}
