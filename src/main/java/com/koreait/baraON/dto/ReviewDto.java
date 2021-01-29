package com.koreait.baraON.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewDto {
	private int rvNo;
	private int mNo;
	private int pNo;
	private int rvDelete;
	private int rvStar;
	private int rvImg;
}
