package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.FAQDto;

public interface FAQDao {

	public List<FAQDto> faqList(int beginRecord, int endRecord, int f_category);
	
	public int totalRecord();
	
	public FAQDto faqView(int no);
	
	public int faqInsert(String title, String content , int f_category);
	
	public int faqDelete(int no);
	
	public int faqUpdate(String title, String content ,int no);
}
