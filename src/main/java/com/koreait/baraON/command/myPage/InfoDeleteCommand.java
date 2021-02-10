package com.koreait.baraON.command.myPage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		int result = 0;
		if(grade.equals("member")) { // member이면
			MemberDto memberDto = (MemberDto)session.getAttribute("loginDto");
			no = memberDto.getM_no();
			int canDelete1 = myPageDao.canMemberDelete1(no);
			int canDelete2 = myPageDao.canMemberDelete2(no);
			System.out.println(canDelete1 + ", " + canDelete2);
			if(canDelete1 == 0 && canDelete2 == 0) {
				result = myPageDao.infoMemberDelete1(no);
				myPageDao.infoMemberDelete2(no);
			} else if(canDelete1 != 0) { // 진행중인 모임이 있으면 
				model.addAttribute("canDelete", 0);
			} else if(canDelete2 != 0) { // 예약한 장소가 있으면
				model.addAttribute("canDelete", 1);
			}
		} else { // seller이면
			SellerDto sellerDto = (SellerDto)session.getAttribute("sellerDto");
			no = sellerDto.getS_no();
			myPageDao.infoSellerDelete(no);
		}
		
		if(result == 1) {
			session.invalidate();
		}
		model.addAttribute("result", result);
	}

}
