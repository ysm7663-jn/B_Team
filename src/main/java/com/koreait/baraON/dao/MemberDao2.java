package com.koreait.baraON.dao;

import com.koreait.baraON.dto.MemberDto2;

public interface MemberDao2 {

	public int memberSearch(String m_id);
	
	public int memberNickSearch(String m_nick);
	
	public int memberInsert(MemberDto2 memberDto2);
	
	public MemberDto2 memberView(int m_no);
}


	
