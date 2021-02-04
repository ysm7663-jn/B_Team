package com.koreait.baraON.command.club;

import java.io.File;
import java.util.Map;

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

		String c_mainImg = null;
		String c_title = multipartRequest.getParameter("c_title");
		int c_min = Integer.parseInt(multipartRequest.getParameter("c_min"));
		int c_max = Integer.parseInt(multipartRequest.getParameter("c_max"));
		String c_startDate = multipartRequest.getParameter("c_startDate");
		String c_endDate = multipartRequest.getParameter("c_endDate");
		String c_content = multipartRequest.getParameter("c_content");
		
		ClubDao clubDao = sqlSession.getMapper(ClubDao.class);
		
		MultipartFile file = multipartRequest.getFile("c_mainImg");
		
		// 첨부를 했는지 검사
		if (file != null && !file.isEmpty()) {
			// 첨부가 있는지 검사
			if (file != null) {
				// MultipartFile mainThumbnail에서 첨부하는 파일명을 알아냅니다.
				String originalFilename = file.getOriginalFilename();
				
				// 업로드 할 파일명의 중복 방지 대책을 수립합니다.
				// 원래파일명_업로드시간.확장자
				// 확장자
				String extension = originalFilename.substring( originalFilename.lastIndexOf(".") + 1 );
				
				// 파일명
				String filename = originalFilename.substring( originalFilename.lastIndexOf(".") );
						
				String uploadFilename = filename + "_" + System.currentTimeMillis() + "." + extension;
				
				// 업로드 할 경로 구하기
				// 업로드는 resources/storage 디렉토리에 저장하기로 합니다.
				// 자바 코드로 storage 디렉토리를 만들기 때문에 미리 만들어 둘 필요가 없습니다.
				String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
				
				// 업로드 할 경로가 없으면 storage 디렉토리를 만듭니다.
				File dir = new File(realPath);
				if ( !dir.exists() ) {
					dir.mkdir();
				}
				
				File uploadFile = new File(realPath, uploadFilename);

				try {
					file.transferTo(uploadFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				// 테이블에 데이터를 저장합니다.
				clubDao.clubInsert(m_no, uploadFilename, c_title, c_startDate, c_endDate, c_content);
				
			}
		} else {
			clubDao.clubInsert(m_no, "파일없음", c_title, c_startDate, c_endDate, c_content);
		}
		
	}

}
