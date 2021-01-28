package com.koreait.baraON.command.place;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.PlaceDao;

public class PlaceListCommand implements PlaceCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
		
		try {
			model.addAttribute("list", placeDao.placeList());
		} catch(NullPointerException e) {
			model.addAttribute("list", null);
		}
	}

}
