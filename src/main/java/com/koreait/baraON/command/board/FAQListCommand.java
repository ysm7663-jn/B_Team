package com.koreait.baraON.command.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.FAQDao;
import com.koreait.baraON.dto.FAQDto;

public class FAQListCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		FAQDao faqDao = sqlSession.getMapper(FAQDao.class);
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int f_category = 1;
		if(request.getParameter("f_category") != null && !request.getParameter("f_category").isEmpty()) {
			f_category = Integer.parseInt(request.getParameter("f_category"));
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
	
		List<FAQDto> list = faqDao.faqList(beginRecord , endRecord , f_category);
		
		String paging = Paging.getPaging("faqListPage.faq", totalRecord, recordPerPage, page);
	
		
		model.addAttribute("list" , list);
		model.addAttribute("totalRecord" , totalRecord);
		model.addAttribute("page" , page);
		model.addAttribute("recordPerPage" , recordPerPage);
	}

}
