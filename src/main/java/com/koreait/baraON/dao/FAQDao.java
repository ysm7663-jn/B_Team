package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.FAQDto;

public interface FAQDao {

	public List<FAQDto> faqList(int beginRecord, int endRecord);
	
	public int totalRecord();
	
}
