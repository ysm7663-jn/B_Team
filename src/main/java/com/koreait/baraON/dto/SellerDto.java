package com.koreait.baraON.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class SellerDto {
	private int sNo;
	private String sId;
	private String sPw;
	private String sPhone;
	private String sName;
	private String sBirth;
	private String sEmail;
	private Date sRegDate;
	private int sAuth;
	private int sAgreement;
	private String sCompanyNo;
}
