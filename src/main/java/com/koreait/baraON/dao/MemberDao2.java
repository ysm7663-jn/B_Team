package com.koreait.baraON.dao;

import com.koreait.baraON.dto.MemberDto2;

public interface MemberDao2 {

	public int memberSearch(String m_id);
	
	public int memberNickSearch(String m_nick);
	
	public int memberInsert(MemberDto2 memberDto2);
	
	public MemberDto2 memberView(int m_no);
	
	public String memberPwSearch(int m_no);
	
	public int memberPwUpdate(MemberDto2 memberDto2);
	
	public int memberNickUpdate(MemberDto2 memberDto2);
	
	public int memberUpdate(MemberDto2 memberDto2);
}


	
