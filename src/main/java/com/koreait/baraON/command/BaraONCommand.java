package com.koreait.baraON.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;


public interface BaraONCommand {
	
	// Rest 방식
	// public Map<String, Object> execute(SqlSession sqlSession, Model model);
	
	// 일반 방식
	public void execute(SqlSession sqlSession, Model model);
		
}
