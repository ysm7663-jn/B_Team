package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.RegularClubListDto;
import com.koreait.baraON.dto.WishListDto;

public interface MyPageDao {
	public List<WishListDto> wishList(int no);
	public int wishDelete(int wNo);
	public List<RegularClubListDto> regularClubList(int mNo, int cPart);
	public List<RegularClubListDto> regularLastClubList(int mNo, int cPart);
}
