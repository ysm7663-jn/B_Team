package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.AdminReviewDto;

public interface AdminReviewDao {
	
	public List<AdminReviewDto> adminReviewList();
	
	public int adminReviewDelete(int no);
}
