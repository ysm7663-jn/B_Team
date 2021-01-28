package com.koreait.baraON.dao;

import com.koreait.baraON.dto.MemberDto;
import com.koreait.baraON.dto.SellerDto;

public interface MemberDao {
	public MemberDto memberLogin(String id, String pw);
	public SellerDto sellerLogin(String id, String pw);
	
}
