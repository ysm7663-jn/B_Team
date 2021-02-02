package com.koreait.baraON.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.command.BaraONCommand;
import com.koreait.baraON.dao.MemberDao;

public class ChangePwCommand implements BaraONCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String chagePassword = request.getParameter("chagePassword");
		String id = request.getParameter("id");
		String grade = request.getParameter("grade");
		
		MemberDao memberdao = sqlSession.getMapper(MemberDao.class);
		int changePwResult = 0;
		if(grade.equals("member")) {  // 멤버일때
			changePwResult = memberdao.changeMemberPw(chagePassword, id);
		} else {  // 호스트일때
			changePwResult = memberdao.changeSellerPw(chagePassword, id);
		}
		model.addAttribute("changePwResult", changePwResult);
	}

}
