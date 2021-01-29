package com.koreait.baraON.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PlaceOptionDto {

	private int poNo;
	private int pNo;
	private int poMin;
	private int poMax;
	private int poDayPrice;
	private int poHoliday;
	private int poAddPrice;
	private String poImg1;
	private String poImg2;
	private String poImg3;
	private String poFxility;
}
