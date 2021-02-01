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
	private Date c_startDate;	
	private Date c_endDate;  	
	private int c_min;			
	private int c_max;			
	private int c_count;		
	private int c_totalClass;	
	private String mainThumnail;
	private String subThumbnail1;
	private String subThumbnail2;
	private String subThumbnail3;
	private int c_money;		
	
}
