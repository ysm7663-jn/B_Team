package com.koreait.baraON.command.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.AdminReviewDao;
import com.koreait.baraON.dto.AdminReviewDto;

public class AdminReviewListCommand implements AdminMemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		AdminReviewDao adminReviewDao = sqlSession.getMapper(AdminReviewDao.class);
		List<AdminReviewDto> list = adminReviewDao.adminReviewList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		if (list.size() > 0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		
		return map;
	}

}
