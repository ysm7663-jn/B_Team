package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.ClubDto;

public interface ClubDao {
	
	public List<ClubDto> clubList();
	
	public int clubInsert(int m_no, String c_mainImg, String c_title, String c_startDate, String c_endDate, String c_content);

}
