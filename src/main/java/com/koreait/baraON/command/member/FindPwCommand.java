package com.koreait.baraON.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.command.BaraONCommand;
import com.koreait.baraON.dao.MemberDao;
import com.koreait.baraON.dto.MemberDto;
import com.koreait.baraON.dto.SellerDto;

public class FindPwCommand implements BaraONCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email") + "@" + request.getParameter("domains");
		String grade = request.getParameter("grade");
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		if(grade.equals("member")) {  // 멤버일때
			int m_no = memberDao.findMemberPw(id, name, email);
			if(m_no != 0) {
				model.addAttribute("no", m_no);
			}
		} else {  // 호스트일때
			int s_no = memberDao.findSellerPw(id, name, email);
			if(s_no != 0) {
				model.addAttribute("no", s_no);
			}
		}
			
		model.addAttribute("findPwResult", true);
		
		HttpSession session = request.getSession();
		if(id != null) {
			session.setAttribute("id", id);
		}
		if(grade != null) {
			session.setAttribute("grade", grade);
		}
		if(email != null) {
			session.setAttribute("email", email);
		}

	}

}
