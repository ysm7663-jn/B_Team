package com.koreait.baraON.command.place;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.PlaceDao;
import com.koreait.baraON.dao.PlaceOptionDao;
import com.koreait.baraON.dto.PlaceCategoryDto;

public class PlaceUpdatePageCommand implements PlaceCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
		PlaceOptionDao placeOptionDao = sqlSession.getMapper(PlaceOptionDao.class);
		List<PlaceCategoryDto> categoryList = placeDao.placeCategoryList();
		
		int p_no = (int)model.asMap().get("p_no");
		
		
		model.addAttribute("placeDto", placeDao.getPlaceDto(p_no));
		model.addAttribute("placeOptionDto", placeOptionDao.getPlaceOptionByPNo(p_no));
		model.addAttribute("categoryList", categoryList);
	}

}
