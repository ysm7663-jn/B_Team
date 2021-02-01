package com.koreait.baraON.dao;

import java.util.List;

import com.koreait.baraON.dto.NoticeDto;

public interface NoticeDao {
	public List<NoticeDto> noticeList(int beginRecord, int endRecord);
	
	public int totalRecord();
	
	public NoticeDto noticeView(int no);
}
