package com.koreait.baraON.command.place;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.baraON.dao.PlaceDao;
import com.koreait.baraON.dto.PlaceDto;

public class PlaceInsertCommand implements PlaceCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)model.asMap().get("multipartRequest");
		
		PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
		
		PlaceDto placeDto = new PlaceDto();
		// 먼저 place에 대한 데이터를 insert한다
		int s_no=Integer.parseInt(multipartRequest.getParameter("s_no"));
		int pc_no=Integer.parseInt(multipartRequest.getParameter("pc_no"));
		String p_title=multipartRequest.getParameter("p_title");
		String p_name=multipartRequest.getParameter("p_name");
		String p_desc=multipartRequest.getParameter("p_desc");
		String p_content=multipartRequest.getParameter("p_content");
		String p_info=multipartRequest.getParameterValues("p_info").toString();
		String p_remark=multipartRequest.getParameter("p_remark").toString();
		String p_url=multipartRequest.getParameter("p_url");
		String p_addr=multipartRequest.getParameter("p_addr");
		String p_bname=multipartRequest.getParameter("p_bname");
		String p_addrdetail=multipartRequest.getParameter("p_addrdetail");
		
		placeDto.setS_no(s_no);
		placeDto.setPc_no(pc_no);
		placeDto.setP_title(p_title);
		placeDto.setP_name(p_name);
		placeDto.setP_desc(p_desc);
		placeDto.setP_content(p_content);
		placeDto.setP_info(p_info);
		placeDto.setP_remark(p_remark);
		placeDto.setP_url(p_url);
		placeDto.setP_addr(p_addr);
		placeDto.setP_bname(p_bname);
		placeDto.setP_addrdetail(p_addrdetail);
		
		String p_img = null;
		List<MultipartFile> files = multipartRequest.getFiles("p_img");
		int size = files.size();
		List<String> extensionList = new ArrayList<>();
		extensionList.add("jpg");
		extensionList.add("jpeg");
		extensionList.add("png");
		
		StringBuffer sbP_img = new StringBuffer();
		sbP_img.trimToSize();
		
		// 지원하는 이미지파일 확장자는 jpg, jpeg, png로 한다.
		for (MultipartFile file : files) {
			if (file != null && !file.isEmpty()) {
				String originalFilename = file.getOriginalFilename();
				String extension = originalFilename.substring( originalFilename.lastIndexOf(".")+1);
				
				String realPath = multipartRequest.getServletContext().getRealPath("resources/images/PlaceImages");
				
				if(!extensionList.contains(extension)) {
					// 이 때 이 전에 업로드 받았던 파일들은 다 삭제해야한다.
					// 업로드 된 파일들은 sb에 목록으로 저장되어있다.
					String fileList = sbP_img.toString().replace("\"", "").replace("[", "").replace("]", "");
					StringTokenizer st = new StringTokenizer(fileList, ", ");
					
					while(st.hasMoreTokens()) {
						File uploadedFile = new File(realPath, st.nextToken());
						if (uploadedFile.exists()) {
							uploadedFile.delete();
						}
					}
					// 이미지파일이 아닐경우 -1
					model.addAttribute("insertResult", -1);
				}
				
				String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
				String uploadFilename = filename + "-" + System.currentTimeMillis() + "." + extension;
				
				
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
				
				if(files.get(size-1) != file) {
					sbP_img.append("\""+uploadFilename+"\", ");
				} else {
					sbP_img.append("\""+uploadFilename+"\"]");
					sbP_img.insert(0,"[");
				}
			} else {
				// 이미지파일을 첨부하지 않은경우 -2
				model.addAttribute("insertResult", -2);
				return;
			}
			if ( !sbP_img.toString().isEmpty() && sbP_img.toString() != null) {
				placeDto.setP_img(sbP_img.toString());
			}
			model.addAttribute("insertResult", placeDao.placeInsert(placeDto));
		}
		// 그 후 placeOption에 대한 데이터를 insert한다.
		// placeOption은 썸네일이 하나이므로 바로 업로드 한다.
		MultipartFile optionImg = multipartRequest.getFile("po_img");
		String originalFilename = optionImg.getOriginalFilename();
		String extension = originalFilename.substring(originalFilename.lastIndexOf(".")+1);
		String realPath = multipartRequest.getServletContext().getRealPath("resources/images/PlaceOptionImages");
		String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
		String po_img = filename + "-" + System.currentTimeMillis() + "." + extension;
		
		File dir = new File(realPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		File uploadFile = new File(realPath, po_img);
		
		try {
			optionImg.transferTo(uploadFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String po_title = multipartRequest.getParameter("po_title");
		int po_dayPrice = Integer.parseInt(multipartRequest.getParameter("po_dayPrice"));
		int po_holiday = Integer.parseInt(multipartRequest.getParameter("po_holiday"));
		int po_min = Integer.parseInt(multipartRequest.getParameter("po_min"));
		int po_max = Integer.parseInt(multipartRequest.getParameter("po_max"));
		
		
	}

}
