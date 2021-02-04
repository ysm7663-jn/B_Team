package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.ClubDto;

public interface ClubDao {
	
	public List<ClubDto> clubList();
	
	public int clubInsert(int m_no, String c_title, String c_content, int c_min, int c_max, String c_mainImg);

}
