package com.koreait.baraON.dao;

import com.koreait.baraON.dto.ReviewDto;

public interface ReviewDao {

	public int reviewUpdate(ReviewDto reviewDto);
	public int reviewDelete(int pv_no);
	public int reviewInsert(int m_no, int p_no, int rv_star, String rv_img, String rv_content);
}
