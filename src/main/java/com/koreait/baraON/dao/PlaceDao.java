package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.PlaceCategoryDto;
import com.koreait.baraON.dto.PlaceDto;
import com.koreait.baraON.dto.PlaceListDto;
import com.koreait.baraON.dto.PlaceOptionDto;
import com.koreait.baraON.dto.ReviewListDto;
import com.koreait.baraON.dto.SellerDto;

public interface PlaceDao {

	public List<PlaceListDto> placeList();
	public List<PlaceCategoryDto> placeCategoryList();
	public List<PlaceListDto> getPlaceListDtoByCategory(int pc_no);
	public PlaceDto getPlaceDto(int p_no);
	public SellerDto getSellerDto(int s_no);
	public List<PlaceOptionDto> getPlaceOptionList(int p_no);
	public PlaceCategoryDto getPlaceCategoryByPCNo(int pc_no);
	public List<ReviewListDto> getReviewListOfViewPage(int p_no, int beginRecord, int endRecord);
	public int getTotalReviewCount(int p_no);
}
