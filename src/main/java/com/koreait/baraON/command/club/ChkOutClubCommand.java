package com.koreait.baraON.command.club;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.ClubDao;

public class ChkOutClubCommand implements ClubMapCommand {

	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		int cl_no = 0;
		if(request.getParameter("cl_no") != null) {
			cl_no = Integer.parseInt(request.getParameter("cl_no"));
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		ClubDao clubDao = sqlSession.getMapper(ClubDao.class);
		
		resultMap.put("result", clubDao.chkOutClub(cl_no));
		
		String c_mainImg = request.getParameter("c_mainImg");
		String realPath = request.getServletContext().getRealPath("resources/images/club");
		
		File file = new File(realPath, c_mainImg);
		
		if (file.exists()) {
			file.delete();
		}

		return resultMap;
	}

}
