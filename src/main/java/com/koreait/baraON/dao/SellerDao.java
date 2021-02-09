package com.koreait.baraON.dao;

import com.koreait.baraON.dto.SellerDto;

public interface SellerDao {

	public String sellerPwSearch(int s_no);
	
	public int sellerPwUpdate(SellerDto sellerDto);
	
	public int sellerUpdate(SellerDto sellerDto);
	
}
