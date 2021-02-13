package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.AdminReplyDto;

public interface AdminReplyDao {
	public List<AdminReplyDto> adminReplyList();
	
	public int adminReplyDelete(int no);
}
