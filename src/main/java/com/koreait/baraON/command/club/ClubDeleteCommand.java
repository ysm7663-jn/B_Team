package com.koreait.baraON.command.club;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.dao.ClubDao;

public class ClubDeleteCommand implements ClubCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		
		ClubDao clubDao = sqlSession.getMapper(ClubDao.class);

		int deleteResult = clubDao.clubDelete(c_no);
		
		String c_mainImg = request.getParameter("c_mainImg");
		String c_img1 = request.getParameter("c_img1");
		String c_img2 = request.getParameter("c_img2");
		String c_img3 = request.getParameter("c_img3");
		String realPath = request.getServletContext().getRealPath("resources/storage");
		File file = new File(realPath, c_mainImg);
		File file1 = new File(realPath, c_img1);
		File file2 = new File(realPath, c_img2);
		File file3 = new File(realPath, c_img3);
		if (file.exists() || file1.exists() || file2.exists() || file3.exists()) {
			file.delete();
			file1.delete();
			file2.delete();
			file3.delete();
		}

		rttr.addFlashAttribute("deleteResult", deleteResult);
		rttr.addFlashAttribute("afterDelete", true);
		
	}

}
