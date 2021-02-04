package com.koreait.baraON.command.myPage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.command.BaraONCommand;
import com.koreait.baraON.dao.MyPageDao;
import com.koreait.baraON.dto.MemberDto;
import com.koreait.baraON.dto.WishListDto;

public class WishListCommand implements BaraONCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		MyPageDao myPageDao = sqlSession.getMapper(MyPageDao.class);
		
		int no = 0;
		if(${loginDto ne null}) {
			if(${grade ne "member"}) {
				no = Integer.parseInt("${loginDto.m_no}");
			} else {
				no = Integer.parseInt("${loginDto.s_no}");
			}
		}
		
		List<WishListDto> list = myPageDao.wishList(no);
		model.addAttribute("list", list);
		
	}

}
