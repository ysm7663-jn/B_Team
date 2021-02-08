package com.koreait.baraON.command.seller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.PlaceDao2;
import com.koreait.baraON.dto.PlaceDto2;

public class AllPlaceSearchCommand implements SellerCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int s_no = (int)map.get("s_no");
		
		PlaceDao2 placeDao2 = sqlSession.getMapper(PlaceDao2.class);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		PlaceDto2 placeDto2 = placeDao2.allPlaceSearch(s_no);
		
		if(placeDto2 != null) {	
			resultMap.put("placeDto2", placeDto2);
			resultMap.put("result", true);
		}else {
			resultMap.put("result", false);
		}
		
		return resultMap;
		
	}

}
