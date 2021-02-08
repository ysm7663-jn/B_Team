package com.koreait.baraON.command.seller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.PlaceDao2;
import com.koreait.baraON.dto.PlaceDto2;

public class PlaceCaSearch2Command implements SellerCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		
		PlaceDto2 placeDto2 = (PlaceDto2)map.get("placeDto2");
		
		int s_no = placeDto2.getS_no();
		int pc_no = placeDto2.getPc_no();
		
		PlaceDao2 placeDao2 = sqlSession.getMapper(PlaceDao2.class);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		
		map2.put("s_no", s_no);
		map2.put("pc_no", pc_no);
		
		placeDto2 = placeDao2.placeCaSearch2(map2);
		
		if(placeDto2 != null) {	
			resultMap.put("placeDto2", placeDto2);
			resultMap.put("result", true);
		}else {
			resultMap.put("result", false);
		}
		
		return resultMap;
	}

}
