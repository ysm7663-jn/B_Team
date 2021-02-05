package com.koreait.baraON.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.MemberDao2;

public class MemberPwSearchCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		
		MemberDao2 memberDao = sqlSession.getMapper(MemberDao2.class);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("result", memberDao.memberPwSearch(m_no));
		
		return resultMap;
		
	}

}
