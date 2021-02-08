package com.koreait.baraON.command.reservation;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.MemberDao;
import com.koreait.baraON.dao.PlaceOptionDao;

public class ReservationInsertCommand implements ReservationCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		
		
		int po_min = Integer.parseInt(request.getParameter("res_people"));
		
		
		
	}

}
