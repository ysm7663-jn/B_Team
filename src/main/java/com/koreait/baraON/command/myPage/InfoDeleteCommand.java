package com.koreait.baraON.command.myPage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.command.BaraONCommand;
import com.koreait.baraON.dao.MyPageDao;
import com.koreait.baraON.dto.MemberDto;
import com.koreait.baraON.dto.SellerDto;

public class InfoDeleteCommand implements BaraONCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = (HttpSession)request.getSession();
		
		String grade = (String)session.getAttribute("grade");
		MyPageDao myPageDao = sqlSession.getMapper(MyPageDao.class);
		int no = 0;
		if(grade.equals("member")) { // member이면
			MemberDto memberDto = (MemberDto)session.getAttribute("loginDto");
			no = memberDto.getM_no();
			myPageDao.infoMemberDelete(no);
		} else { // seller이면
			SellerDto sellerDto = (SellerDto)session.getAttribute("sellerDto");
			no = sellerDto.getS_no();
			myPageDao.infoSellerDelete(no);
		}
		
	}

}
