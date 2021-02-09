package com.koreait.baraON.command.club;

import java.io.File;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.baraON.dao.ClubDao;

public class ClubInsertCommand implements ClubCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) model.asMap().get("multipartRequest");

		int m_no = Integer.parseInt(multipartRequest.getParameter("m_no"));
		String c_title = multipartRequest.getParameter("c_title");
		String c_content = multipartRequest.getParameter("c_content");
		int c_min = Integer.parseInt(multipartRequest.getParameter("c_min"));
		int c_max = Integer.parseInt(multipartRequest.getParameter("c_max"));
		
		ClubDao clubDao = sqlSession.getMapper(ClubDao.class);
		
		MultipartFile file = multipartRequest.getFile("c_mainImg");
		
		if (file != null && !file.isEmpty()) {
			
				String originalFilename = file.getOriginalFilename();
				String extension = originalFilename.substring( originalFilename.lastIndexOf(".")+1);
				
				String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
						
				String uploadFilename = filename + "-" + System.currentTimeMillis() + "." + extension;
				
				String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
				
				File dir = new File(realPath);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				
				File uploadFile = new File(realPath, uploadFilename);

				try {
					file.transferTo(uploadFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				//model.addAttribute("insertResult", clubDao.clubInsert(m_no, c_title, c_content, c_min, c_max, uploadFilename));
				clubDao.clubInsert(m_no, c_title, c_content, c_min, c_max, uploadFilename);
				
		} else {
			//model.addAttribute("insertResult", clubDao.clubInsert(m_no, c_title, c_content, c_min, c_max, "첨부파일 없음"));
			clubDao.clubInsert(m_no, c_title, c_content, c_min, c_max, "첨부파일 없음");
		}
		
	}

}
