package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.PlaceOptionDto;

public interface PlaceOptionDao {
	public int placeOptionInsert(PlaceOptionDto placeOptionDto);
	public PlaceOptionDto getPlaceOptionDto(int po_no);
	public List<PlaceOptionDto> getPlaceOptionByPNo(int p_no);
	
}
