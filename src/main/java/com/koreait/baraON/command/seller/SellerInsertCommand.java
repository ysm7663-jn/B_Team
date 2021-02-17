package com.koreait.baraON.command.seller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.SellerDao;
import com.koreait.baraON.dto.MemberDto;
import com.koreait.baraON.dto.SellerDto;

public class SellerInsertCommand{

	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		SellerDto sellerDto = (SellerDto)map.get("sellerDto");
		System.out.println(""+sellerDto);
		SellerDao sellerDao = sqlSession.getMapper(SellerDao.class);
		sellerDao.sellerInsert(sellerDto);
		
	}

}
