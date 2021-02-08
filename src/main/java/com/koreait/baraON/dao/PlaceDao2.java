package com.koreait.baraON.dao;

import java.util.HashMap;
import java.util.List;

import com.koreait.baraON.dto.PlaceDto2;

public interface PlaceDao2 {

	public PlaceDto2 allPlaceSearch(int s_no);
	
	public PlaceDto2 placeCaSearch(HashMap<String, Object> map2);
	
	public PlaceDto2 placeCaSearch2(HashMap<String, Object> map2);
	
}
