package com.koreait.baraON.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class EventDto {
	private	int e_no;
	private String e_title;
	private String e_content;
	private String e_filename;
	private Date e_postDate;
}
