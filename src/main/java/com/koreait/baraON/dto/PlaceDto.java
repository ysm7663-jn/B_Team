package com.koreait.baraON.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PlaceDto {
	private int p_no;
	private int s_no;
	private int pc_no;
	private String p_title;
	private String p_desc;
	private String p_content;
	private String p_info;
	private String p_name;
	private String p_addr;
	private int p_star;
	private String p_img;
	private int p_confirm;
	private String p_url;
	private int p_delete;
}
