package com.koreait.baraON.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto2 {

	private int mNo;
	private String mId;
	private String mPw;
	private String mPhone;
	private String mName;
	private String mBirth;
	private String mNick;
	private String mEmail;
	private Date mregDate;
	private String mAuth;
	private int mAgreement;
	
}
