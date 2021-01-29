package com.koreait.baraON.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewDto {
	private int rv_no;
	private int m_no;
	private int p_no;
	private int rv_delete;
	private int rv_star;
	private int rv_img;
}
