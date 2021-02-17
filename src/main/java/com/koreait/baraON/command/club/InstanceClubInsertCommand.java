package com.koreait.baraON.command.club;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.dao.ClubDao;

public class InstanceClubInsertCommand implements ClubCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) map.get("multipartRequest");
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		
		ClubDao clubDao = sqlSession.getMapper(ClubDao.class);
		
		int m_no = Integer.parseInt(multipartRequest.getParameter("m_no"));
		
		String c_title = multipartRequest.getParameter("c_title");
		String c_desc = multipartRequest.getParameter("c_desc");
		String c_content = multipartRequest.getParameter("c_content");
		int c_min = Integer.parseInt(multipartRequest.getParameter("c_min"));
		int c_max = Integer.parseInt(multipartRequest.getParameter("c_max"));
		/*String c_subContent1 = multipartRequest.getParameter("c_subContent1");
		String c_subContent2 = multipartRequest.getParameter("c_subContent2");
		String c_subContent3 = multipartRequest.getParameter("c_subContent3");*/
		
		String c_startDate = multipartRequest.getParameter("c_startDate");
		String c_endDate = multipartRequest.getParameter("c_endDate");
		
		/*MultipartFile[] file = new MultipartFile[3];
		
		for (int i = 1; i <= file.length; i++) {
			if (file[i] != null && !file[i].isEmpty()) {
				file[i] = multipartRequest.getFile("c_img[i]");
				String originalFilename[i] = file[i].getOriginalFilename();
				String extension[i] = originalFilename[i].substring( originalFilename[i].lastIndexOf(".")+1);
				
				String filename[i] = originalFilename.substring(0, originalFilename.lastIndexOf("."));
						
				String uploadFilename[i] = filename + "-" + System.currentTimeMillis() + "." + extension;
				
				String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
				
				File dir = new File(realPath);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				
				File uploadFile = new File(realPath, uploadFilename);
			}
		}*/
			MultipartFile file = multipartRequest.getFile("c_mainImg");
		
			if (file != null && !file.isEmpty()) {
		
				String originalFilename = file.getOriginalFilename();
				String extension = originalFilename.substring( originalFilename.lastIndexOf(".")+1);
				
				String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
						
				String uploadFilename = filename + "-" + System.currentTimeMillis() + "." + extension;
				
				String realPath = multipartRequest.getServletContext().getRealPath("resources/images/club");
				
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
				
				int insertResult2 = clubDao.instanceclubInsert(m_no, c_title, c_desc, c_min, c_max, c_startDate, c_endDate, c_content, uploadFilename);
				
				boolean afterInsert2 = false;
				if(insertResult2 > 0) { 
					afterInsert2 = true;
				}
				
				rttr.addFlashAttribute("insertResult2", insertResult2);
				rttr.addFlashAttribute("afterInsert2", afterInsert2);
		} 
		
	}

}