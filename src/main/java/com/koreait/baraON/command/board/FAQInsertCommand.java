package com.koreait.baraON.command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.dao.FAQDao;

public class FAQInsertCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		FAQDao faqDao = sqlSession.getMapper(FAQDao.class);
		
		int insertResult = faqDao.faqInsert(title, content);
		
		rttr.addAttribute("a", insertResult).addFlashAttribute("insertResult", insertResult);
		
		rttr.addFlashAttribute("afterInsert", true);
		
		
	}

}
