package com.koreait.baraON.command.myPage;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.command.BaraONCommand;
import com.koreait.baraON.dao.MyPageDao;
import com.koreait.baraON.dto.MemberDto;
import com.koreait.baraON.dto.RegularClubListDto;

public class RegularClubCommand implements BaraONCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		
		int state = 0;
		if(request.getParameter("state") != null) {
			state = Integer.parseInt(request.getParameter("state"));
		}
		MemberDto loginDto = (MemberDto)session.getAttribute("loginDto");
		int mNo = loginDto.getM_no();
		int cPart = 0; // 정기 모임
		
		List<RegularClubListDto> list = null;
		MyPageDao myPageDao = sqlSession.getMapper(MyPageDao.class);
		if(state == 0) {
			list = myPageDao.regularClubList(mNo, cPart);
		} else {
			list = myPageDao.regularLastClubList(mNo, cPart);
		}
		
		model.addAttribute("list", list);
	}

}
