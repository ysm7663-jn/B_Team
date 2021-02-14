package com.koreait.baraON.command.seller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.PlaceCategoryDao2;
import com.koreait.baraON.dto.PlaceCategoryDto2;

public class SpaceViewPageCommand {

	public void execute(SqlSession sqlSession, Model model) {
		
		PlaceCategoryDao2 placeCategoryDao2 = sqlSession.getMapper(PlaceCategoryDao2.class);
		model.addAttribute("list",placeCategoryDao2.pcList()); 
		
	}

}
