package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.PlaceDto;
import com.koreait.baraON.dto.PlaceListDto;
import com.koreait.baraON.dto.PlaceOptionDto;
import com.koreait.baraON.dto.ReviewDto;
import com.koreait.baraON.dto.SellerDto;

public interface PlaceDao {

	public List<PlaceListDto> placeList();
	public PlaceDto getPlaceDto(int no);
	public SellerDto getSellerDto(int no);
	public List<ReviewDto> getReviewList(int no);
	public List<PlaceOptionDto> getPlaceOptionDto(int no);
	public List<PlaceListDto> getPlaceDtoList(int no);
}
