package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.ClubListDto;
import com.koreait.baraON.dto.WishListDto;

public interface MyPageDao {
	public List<WishListDto> wishList(int no);
	public int wishDelete(int wNo);
	public List<ClubListDto> clubList(int mNo, int cPart);
	public List<ClubListDto> lastClubList(int mNo, int cPart);
	public int clubListDelete(int clNo);
	public int canMemberDelete1(int no);
	public int canMemberDelete2(int no);
	public int infoMemberDelete1(int no);
	public int infoMemberDelete2(int no);
	public int infoSellerDelete(int no);
}
