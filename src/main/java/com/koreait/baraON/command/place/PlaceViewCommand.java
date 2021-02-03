package com.koreait.baraON.command.place;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.PlaceDao;
import com.koreait.baraON.dto.PlaceCategoryDto;
import com.koreait.baraON.dto.PlaceDto;
import com.koreait.baraON.dto.PlaceOptionDto;
import com.koreait.baraON.dto.ReviewListDto;
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
		
		PlaceCategoryDto placeCategoryDto = placeDao.getPlaceCategoryByPCNo(pc_no);
		
		// OptionList의 facility 데이터를 받아와서 배열로 만들기
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
		
		// Review
		// 가장 최초에는 삭제되지 않은 리뷰중에 가장 최근의 리뷰부터 3개를 가져옴
		List<ReviewListDto> reviewList = placeDao.getReviewListOfViewPage(p_no, 1, 3);
		
		model.addAttribute("placeDto", placeDto);
		model.addAttribute("sellerDto", sellerDto);
		model.addAttribute("categoryName", placeCategoryDto.getPc_name());
		model.addAttribute("optionList", placeOptionList);
		model.addAttribute("facilityList",sb.toString());
		model.addAttribute("reviewList", reviewList);
	}

}
