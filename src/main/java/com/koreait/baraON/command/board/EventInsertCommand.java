package com.koreait.baraON.command.board;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.koreait.baraON.dao.EventDao;

public class EventInsertCommand implements NoticeCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
			
			Map<String, Object> map = model.asMap();
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)map.get("multipartRequest");
			
			String title = multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content");
			
			EventDao eventDao = sqlSession.getMapper(EventDao.class);
			
			List<MultipartFile> files = multipartRequest.getFiles("files");
			
			for (MultipartFile file : files) {
				if (file != null && !file.isEmpty()) {
					
					String originalFilename = file.getOriginalFilename();
					
					String extension = originalFilename.substring( originalFilename.lastIndexOf(".") + 1 );

					String filename = originalFilename.substring( 0, originalFilename.lastIndexOf(".") );
					
					String uploadFilename = filename +
							                "_" +
							                System.currentTimeMillis() +
							                "." +
							                extension;
					
					String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
					
					File dir = new File(realPath);
					if ( !dir.exists() ) {
						dir.mkdirs();
					}
					File uploadFile = new File(realPath, uploadFilename);
					
					try {
						file.transferTo(uploadFile);
					} catch (Exception e) {
						e.printStackTrace();
					}
					eventDao.eventInsert(title, content, uploadFilename);  
				} else {
					eventDao.eventInsert(title, content, "첨부없음");  
					
				}
				
			}  
			
		}

	}