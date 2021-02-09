package com.koreait.baraON.command.place;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.PlaceDao;
import com.koreait.baraON.dao.PlaceOptionDao;
import com.koreait.baraON.dto.PlaceCategoryDto;
import com.koreait.baraON.dto.PlaceOptionDto;

public class PlaceUpdatePageCommand implements PlaceCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
		PlaceOptionDao placeOptionDao = sqlSession.getMapper(PlaceOptionDao.class);
		int p_no = (int)model.asMap().get("p_no");
		List<PlaceCategoryDto> categoryList = placeDao.placeCategoryList();
		
		
		model.addAttribute("placeDto", placeDao.getPlaceDto(p_no));
		model.addAttribute("placeOptionList", placeOptionDao.getPlaceOptionByPNo(p_no));
		model.addAttribute("categoryList", categoryList);
	}

}
