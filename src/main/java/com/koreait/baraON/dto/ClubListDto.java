package com.koreait.baraON.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ClubListDto {
	private int cl_no;
	private String m_nick;
	private String c_title;		
	private String c_content;		
	private String c_mainimg;
	private Date c_startDate;
	private Date c_endDate;
	private int c_min;
	private int c_max;
	private int cl_card;
}
