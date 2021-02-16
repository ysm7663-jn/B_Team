package com.koreait.baraON.command.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.MyPageDao;
import com.koreait.baraON.dto.ClubListDto;

public class MemberReloadCommand {
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		int cNo = (int)map.get("cNo");
		
		MyPageDao myPageDao = sqlSession.getMapper(MyPageDao.class);
		int memberCount = myPageDao.clubCount(cNo);
		List<ClubListDto> clubList = null;
		clubList = myPageDao.memberInfo(cNo);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("memberCount", memberCount);
		resultMap.put("clubList", clubList);
		
		return resultMap;
	}
}
