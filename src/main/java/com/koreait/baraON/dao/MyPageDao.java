package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.RegularClubListDto;
import com.koreait.baraON.dto.WishListDto;

public interface MyPageDao {
	public List<WishListDto> wishList(int no);
	public int wishDelete(int wNo);
	public List<RegularClubListDto> clubList(int mNo, int cPart);
	public List<RegularClubListDto> lastClubList(int mNo, int cPart);
	public int clubListDelete(int clNo);
}
