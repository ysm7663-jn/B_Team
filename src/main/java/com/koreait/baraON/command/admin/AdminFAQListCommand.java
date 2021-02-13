package com.koreait.baraON.command.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.command.board.NoticeCommand;
import com.koreait.baraON.command.board.Paging;
import com.koreait.baraON.dao.FAQDao;
import com.koreait.baraON.dto.FAQDto;


public class AdminFAQListCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		FAQDao faqDao = sqlSession.getMapper(FAQDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int category = 1;
		if(request.getParameter("category") != null) {
			category = Integer.parseInt(request.getParameter("category"));
		}
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int totalRecord = faqDao.totalRecord();
		
		int recordPerPage = 10; 
		
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord < totalRecord ? endRecord : totalRecord;
	
		List<FAQDto> list = faqDao.faqList(beginRecord , endRecord , category);
		
		String paging = Paging.getPaging("adminFaqListPage.faq", totalRecord, recordPerPage, page);
	
		model.addAttribute("list" , list);
		model.addAttribute("totalRecord" , totalRecord);
		model.addAttribute("page" , page);
		model.addAttribute("paging" , paging);
		model.addAttribute("recordPerPage" , recordPerPage);
	}

}
