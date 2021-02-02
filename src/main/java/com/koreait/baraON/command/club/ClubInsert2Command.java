package com.koreait.baraON.command.club;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.dao.ClubDao;

public class ClubInsert2Command implements ClubCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) map.get("multipartRequest");
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");

		String c_title = multipartRequest.getParameter("c_title");
		int c_min = Integer.parseInt(multipartRequest.getParameter("c_title"));
		int c_max = Integer.parseInt(multipartRequest.getParameter("c_title"));
		int c_money = Integer.parseInt(multipartRequest.getParameter("c_title"));
		String c_startDate = multipartRequest.getParameter("c_title");
		String c_endDate = multipartRequest.getParameter("c_title");
		
		ClubDao clubDao = sqlSession.getMapper(ClubDao.class);
		
		MultipartFile file = multipartRequest.getFile("mainThumbnail");
		
		if (file != null && !file.isEmpty()) {
			
			if (file != null) {
				// MultipartFile mainThumbnail에서 첨부하는 파일명을 알아냅니다.
				String originalFilename = file.getOriginalFilename();
				
				// 업로드 할 파일명의 중복 방지 대책을 수립합니다.
				// 원래파일명_업로드시간.확장자
				// 확장자
				String extension = originalFilename.substring( originalFilename.lastIndexOf(".") + 1 );
				
				// 파일명
				String filename = originalFilename.substring( originalFilename.lastIndexOf(".") );
						
				String uploadFilename = filename + "." + extension;
				
				
				// 업로드 할 경로 구하기
				// 업로드는 resources/storage 디렉토리에 저장하기로 합니다.
				// 자바 코드로 storage 디렉토리를 만들기 때문에 미리 만들어 둘 필요가 없습니다.
				String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
				
				// 업로드 할 경로가 없으면 storage 디렉토리를 만듭니다.
				File dir = new File(realPath);
				if ( !dir.exists() ) {
					dir.mkdir();
				}
				
				// 이제 업로드 할 파일명(uploadFilename)과 경로(realPath)를 모두 알고 있습니다.
				File uploadFile = new File(realPath, uploadFilename);

				// 첨부한 파일(MultipartFile file) -> 업로드 (uploadFile) 합니다.
				try {
					file.transferTo(uploadFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				// 테이블에 데이터를 저장합니다.
				
				int insertResult = clubDao.clubInsert1(file, c_title, c_min, c_max, c_money, c_startDate, c_endDate);
				
				rttr.addFlashAttribute("insertResult", insertResult);
				rttr.addFlashAttribute("afterInsert", true);
			}
			
		} else {
			int insertResult = clubDao.clubInsert1("", c_title, c_min, c_max, c_money, c_startDate, c_endDate);
			rttr.addFlashAttribute("insertResult", insertResult);
			rttr.addFlashAttribute("afterInsert", true);
			
		}
		
	}

}
