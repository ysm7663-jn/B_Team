package com.koreait.baraON.command.seller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.PlaceDao2;
import com.koreait.baraON.dto.PlaceDto2;

public class AllPlaceSearchCommand implements SellerCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		
		PlaceDto2 placeDto2 = (PlaceDto2) map.get("placeDto2");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		PlaceDao2 placeDao2 = sqlSession.getMapper(PlaceDao2.class);
		
		List<PlaceDto2> list = placeDao2.allPlaceSearch(placeDto2);
	
		resultMap.put("list", list);
		
		if(list.size() > 0) {	
			resultMap.put("result", true);
		}else {
			resultMap.put("result", false);
		}
		
		return resultMap;
		
	}

}
