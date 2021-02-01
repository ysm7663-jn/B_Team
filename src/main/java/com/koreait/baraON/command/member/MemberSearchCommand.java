package com.koreait.baraON.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.MemberDao2;

public class MemberSearchCommand implements MemberCommand{

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		String mId = (String)map.get("mId");

		MemberDao2 memberDao = sqlSession.getMapper(MemberDao2.class);
		
		int count = 0;
		count = memberDao.memberSearch(mId);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("result", count);
		
		return resultMap;
	}
}
