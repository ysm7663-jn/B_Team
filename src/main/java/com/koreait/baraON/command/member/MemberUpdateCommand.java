package com.koreait.baraON.command.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.MemberDao2;
import com.koreait.baraON.dto.MemberDto2;

public class MemberUpdateCommand {

	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		
		MemberDto2 memberDto2  = (MemberDto2)map.get("memberDto2");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MemberDao2 memberDao2 = sqlSession.getMapper(MemberDao2.class);
		
		resultMap.put("result", memberDao2.memberUpdate(memberDto2));
		
	}

}
