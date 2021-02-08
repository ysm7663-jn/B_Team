package com.koreait.baraON.command.reservation;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.MemberDao;
import com.koreait.baraON.dao.PlaceOptionDao;
import com.koreait.baraON.dto.PlaceOptionDto;

public class ReservationPageCommand implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		PlaceOptionDao placeOptionDao = sqlSession.getMapper(PlaceOptionDao.class);
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		
		int po_no = Integer.parseInt(request.getParameter("po_no"));
		PlaceOptionDto placeOptionDto = placeOptionDao.getPlaceOptionDto(po_no);
		
		model.addAttribute("sellerDto", memberDao.getSellerDto(placeOptionDto.getP_no()));
		
		
	}

}
