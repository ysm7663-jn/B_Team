package com.koreait.baraON.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PlaceDto {
	private int pNo;
	private int sNo;
	private int pcNo;
	private String pTitle;
	private String pDesc;
	private String pContent;
	private String pInfo;
	private String pName;
	private String pAddr;
	private int pStar;
	private String pImg;
	private int pConfirm;
	private String pUrl;
	private int pDelete;
}
