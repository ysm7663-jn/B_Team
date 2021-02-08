package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.ClubDto;
import com.koreait.baraON.dto.MemberDto;

public interface ClubDao {
	
	public List<ClubDto> clubList();
	
	public int clubInsert(int m_no, String c_title, String c_content, int c_min, int c_max, String c_mainImg);
	
	public ClubDto clubView(int c_no);
	
	public MemberDto clubView2(int m_no);
	
	public int clubDelete(int c_no);

}
