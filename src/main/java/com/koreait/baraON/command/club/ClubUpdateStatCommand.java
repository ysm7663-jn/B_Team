package com.koreait.baraON.command.club;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.ClubDao;

public class ClubUpdateStatCommand implements ClubMapController {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		String m_enjoy = request.getParameter("m_enjoy");
		
		ClubDao clubDao = sqlSession.getMapper(ClubDao.class);
		
		int updateResult = clubDao.updateStat(m_enjoy, m_no);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("updateResult", updateResult);
		
		return map1;
	}

}
