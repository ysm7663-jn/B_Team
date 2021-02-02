package com.koreait.baraON.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.koreait.baraON.dto.ClubDto;

public interface ClubDao {
	
	public List<ClubDto> clubList();
	
	public int clubInsert1(MultipartFile file, String c_title, int c_min, int c_max, int c_money, String c_startDate, String c_endDate);

	public int clubInsert1(String file, String c_title, int c_min, int c_max, int c_money, String c_startDate, String c_endDate);

}
