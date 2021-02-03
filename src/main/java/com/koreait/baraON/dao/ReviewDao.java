package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.ReviewDto;
import com.koreait.baraON.dto.ReviewListDto;

public interface ReviewDao {

	public int reviewUpdate(ReviewDto reviewDto);
	public int reviewDelete(int pv_no);
	public int reviewInsert(int m_no, int p_no, int rv_star, String rv_img, String rv_content);
	public List<ReviewListDto> reviewListAppend(int p_no, int begin, int end);
}
