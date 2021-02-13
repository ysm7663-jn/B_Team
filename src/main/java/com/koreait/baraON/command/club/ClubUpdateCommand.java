package com.koreait.baraON.command.club;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.dao.ClubDao;

public class ClubUpdateCommand implements ClubCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		int c_min = Integer.parseInt(request.getParameter("c_min"));
		int c_max = Integer.parseInt(request.getParameter("c_max"));
		String c_title = request.getParameter("c_title");
		String c_content = request.getParameter("c_content");
		String c_startDate = request.getParameter("c_startDate");
		String c_endDate = request.getParameter("c_endDate");
		
		ClubDao clubDao = sqlSession.getMapper(ClubDao.class);
		int updateResult = clubDao.clubUpdate(c_title, c_min, c_max, c_content, c_startDate, c_endDate, c_no);
		
		rttr.addFlashAttribute("updateResult", updateResult);
		rttr.addFlashAttribute("afterUpdate", true);

	}

}
