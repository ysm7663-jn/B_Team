package com.koreait.baraON.dao;

import com.koreait.baraON.dto.PlaceOptionDto;

public interface PlaceOptionDao {
	public int placeOptionInsert(PlaceOptionDto placeOptionDto);
	public PlaceOptionDto getPlaceOptionDto(int po_no);
}
