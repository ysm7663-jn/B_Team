package com.koreait.baraON.command.place;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.PlaceDao;
import com.koreait.baraON.dto.PlaceDto;
import com.koreait.baraON.dto.PlaceOptionDto;
import com.koreait.baraON.dto.SellerDto;

public class PlaceViewCommand implements PlaceCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		PlaceDto placeDto = placeDao.getPlaceDto(no);
		int p_no = placeDto.getP_no();
		int s_no = placeDto.getS_no();
		int pc_no = placeDto.getPc_no();
		
		SellerDto sellerDto = placeDao.getSellerDto(s_no);
		
		List<PlaceOptionDto> placeOptionList = placeDao.getPlaceOptionList(p_no);
		StringBuffer sb = new StringBuffer();
		sb.trimToSize();
		sb.append("[");
		for(int i = 0, size=placeOptionList.size();i<size;i++) {
			if (i==size-1) {
				sb.append(placeOptionList.get(i).getPo_fxility());
			} else {
				sb.append(placeOptionList.get(i).getPo_fxility()+", ");
			}
		}
		sb.append("]");
		
		model.addAttribute("placeDto", placeDto);
		model.addAttribute("sellerDto", sellerDto);
		model.addAttribute("optionList", placeOptionList);
		model.addAttribute("facilityList",sb.toString());
	}

}
