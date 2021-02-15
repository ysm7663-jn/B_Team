package com.koreait.baraON.command.myPage;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface MyPageAjaxCommand {
	public Map<String, Object> execute(SqlSession sqlSession, Model model);
}