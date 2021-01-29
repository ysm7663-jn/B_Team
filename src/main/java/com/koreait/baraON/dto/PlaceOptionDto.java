package com.koreait.baraON.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PlaceOptionDto {

	private int po_no;
	private int p_no;
	private int po_min;
	private int po_max;
	private int po_dayPrice;
	private int po_holiday;
	private int po_addPrice;
	private String po_img1;
	private String po_img2;
	private String po_img3;
	private String po_fxility;
}
