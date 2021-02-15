package com.koreait.baraON.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.EventDao;
import com.koreait.baraON.dao.FAQDao;
import com.koreait.baraON.dao.NoticeDao;

public class IndexCommand implements BaraONCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		EventDao eventDao = sqlSession.getMapper(EventDao.class);
		FAQDao faqDao = sqlSession.getMapper(FAQDao.class);
		NoticeDao noticeDao = sqlSession.getMapper(NoticeDao.class);
		
		model.addAttribute("eventList", eventDao.eventList(1, 6));
		model.addAttribute("faqList",faqDao.indexFaq(1, 3));
		model.addAttribute("noticeList", noticeDao.noticeList(1, 3));
		
	}

}
