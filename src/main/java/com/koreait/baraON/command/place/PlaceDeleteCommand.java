package com.koreait.baraON.command.place;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.dao.PlaceDao;

public class PlaceDeleteCommand implements PlaceCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		RedirectAttributes rttr = (RedirectAttributes)model.asMap().get("rttr");
		PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
		
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		
		model.addAttribute("deleteResult", placeDao.placeDelete(p_no));
	}

}
