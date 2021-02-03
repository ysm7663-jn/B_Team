package com.koreait.baraON.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ClubDto {

	private int c_no;			
	private String c_title;		
	private String c_content;	
	private Date c_postDate;	
	private String c_startDate;	
	private String c_endDate;  	
	private int c_min;			
	private int c_max;			
	private int c_count;		
	private int c_totalClass;	
	private String c_mainThumnail;
	private String c_subThumbnail1;
	private String c_subThumbnail2;
	private String c_subThumbnail3;
	private int c_money;		
	
}
