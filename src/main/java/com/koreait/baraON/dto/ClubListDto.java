package com.koreait.baraON.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ClubListDto {
	private String m_nick;
	private int cl_no;
	private String c_title;		
	private String c_content;		
	private Date c_startDate;
	private Date c_endDate;
	private int c_min;
	private int c_max;
	private String c_mainimg;
	private int cl_card;
}
