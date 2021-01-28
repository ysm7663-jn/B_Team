package com.koreait.baraON.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PlaceListDto {
	
	private int pNo;
	private String pcName;
	private int poMinPrice;
	private int poMaxPeople;
	private int rvCount;
	private String pImg;
	private String pTitle;
	private String pAddr;
}
