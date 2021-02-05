package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.PlaceDto2;

public interface PlaceDao2 {

	public PlaceDto2 allPlaceSearch(int s_no);
	
	public List<PlaceDto2> placeCaSearch(PlaceDto2 placeDto2);
	
}
