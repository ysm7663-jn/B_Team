package com.koreait.baraON.dao;

import com.koreait.baraON.dto.ReviewDto;

public interface ReviewDao {

	public int reviewUpdate(ReviewDto reviewDto);
	public int reviewDelete(int pv_no);
}
