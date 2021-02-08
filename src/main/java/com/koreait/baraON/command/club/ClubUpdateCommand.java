package com.koreait.baraON.command.club;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.ClubDao;

public class ClubUpdateCommand implements ClubCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		
		ClubDao clubDao = sqlSession.getMapper(ClubDao.class);
		model.addAttribute("memberDto", clubDao.clubView2(m_no));
		model.addAttribute("clubDto", clubDao.clubView(c_no));

	}

}
