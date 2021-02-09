package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.PlaceDto2;

public interface PlaceDao2 {

	public List<PlaceDto2> allPlaceSearch(PlaceDto2 placeDto2);
	
	public List<PlaceDto2> placeCaSearch(PlaceDto2 placeDto2);
	
}
