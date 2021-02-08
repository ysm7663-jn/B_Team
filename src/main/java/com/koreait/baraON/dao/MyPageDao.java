package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.WishListDto;

public interface MyPageDao {
	public List<WishListDto> wishList(int no);
	public int wishDelete(int wNo);
}
