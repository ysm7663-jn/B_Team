package com.koreait.baraON.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.command.BaraONCommand;
import com.koreait.baraON.dao.MemberDao;

public class FindIdCommand implements BaraONCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String name = request.getParameter("name");
		String email = request.getParameter("email") + "@" + request.getParameter("domain");
		String grade = request.getParameter("grade");
		
		/*String domain = request.getParameter("domain");*/
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		String id = null;
		if(grade.equals("member")) { // 멤버일때
			id = memberDao.findMemberId(name, email);
		} else {  // 호스트일때
			id = memberDao.findSellerId(name, email);
		}
		
		model.addAttribute("id", id);
	
	}

}
