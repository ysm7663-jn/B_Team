package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.PlaceDto;
import com.koreait.baraON.dto.PlaceListDto;
import com.koreait.baraON.dto.ReviewCheckDto;

public interface PlaceDao2 {

	public List<PlaceListDto> allPlaceSearch(PlaceDto placeDto);
	
	public List<PlaceListDto> placeCaSearch(PlaceDto placeDto);
	
	public List<PlaceListDto> allPlaceSearch2(PlaceDto placeDto);

	public List<PlaceListDto> placeCaSearch2(PlaceDto placeDto);
	
	// seller에서 가져다 쓰는 중
	public List<PlaceDto> placeList(int beginRecord, int endRecord);
	
	public int placeCount();
}
