package com.koreait.baraON.command.place;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.dao.PlaceDao;
import com.koreait.baraON.dao.PlaceOptionDao;
import com.koreait.baraON.dto.PlaceDto;
import com.koreait.baraON.dto.PlaceOptionDto;

public class PlaceUpdateCommand implements PlaceCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)model.asMap().get("multipartRequest");
		RedirectAttributes rttr = (RedirectAttributes)model.asMap().get("rttr");
		
		PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
		PlaceOptionDao placeOptionDao = sqlSession.getMapper(PlaceOptionDao.class);
		
		
		int p_no=Integer.parseInt(multipartRequest.getParameter("p_no"));
		String p_title=multipartRequest.getParameter("p_title");
		String p_desc=multipartRequest.getParameter("p_desc");
		String p_content=multipartRequest.getParameter("p_content");
		String[] p_infoList=multipartRequest.getParameterValues("p_info");
		String[] p_remarkList=multipartRequest.getParameterValues("p_remark");
		String p_url=multipartRequest.getParameter("p_url");
		String p_addr=multipartRequest.getParameter("p_addr");
		String p_bname=multipartRequest.getParameter("p_bname");
		String p_addrdetail=multipartRequest.getParameter("p_addrdetail");
		String[] deletedImg = multipartRequest.getParameterValues("deleted_img"); 
		
		
		PlaceDto placeDto = placeDao.getPlaceDto(p_no);
		String p_img = placeDto.getP_img().replace("[", "").replace("]", "").replace("\"", "");
		// 기존이미지에서 삭제한 이미지 삭제
		if(deletedImg!=null) {
			for(int i = 0; i<deletedImg.length;i++) {
				String realPath = multipartRequest.getServletContext().getRealPath("resources/images/PlaceImages");
				File file = new File(realPath, deletedImg[i]);
				p_img = p_img.replace(deletedImg[i], "");
				if(file.exists()) {
					file.delete();
				}
				
			}
		}
		StringBuffer sb = new StringBuffer();
		sb.trimToSize();
		sb.append("[");
		for(int i = 0; i<p_infoList.length;i++) {
			if(i!=(p_infoList.length-1)) {
				sb.append("\""+p_infoList[i]+"\", ");
			} else {
				sb.append("\""+p_infoList[i]+"\"]");
			}
		}
		placeDto.setP_info(sb.toString());
		
		sb.setLength(0);
		sb.append("[");
		for(int i = 0; i<p_remarkList.length;i++) {
			if(i!=(p_remarkList.length-1)) {
				sb.append("\""+p_remarkList[i]+"\", ");
			} else {
				sb.append("\""+p_remarkList[i]+"\"]");
			}
		}
		placeDto.setP_remark(sb.toString());
		
		placeDto.setP_title(p_title);
		placeDto.setP_desc(p_desc);
		placeDto.setP_content(p_content);
		placeDto.setP_url(p_url);
		placeDto.setP_addr(p_addr);
		placeDto.setP_bname(p_bname);
		placeDto.setP_addrdetail(p_addrdetail);
		
		List<MultipartFile> files = multipartRequest.getFiles("p_img");
		int size = files.size();
		List<String> extensionList = new ArrayList<>();
		extensionList.add("jpg");
		extensionList.add("jpeg");
		extensionList.add("png");
		
		sb.setLength(0);
		
		// 지원하는 이미지파일 확장자는 jpg, jpeg, png로 한다.
		for (MultipartFile file : files) {
			if (file != null && !file.isEmpty()) {
				String originalFilename = file.getOriginalFilename();
				String extension = originalFilename.substring( originalFilename.lastIndexOf(".")+1);
				
				String realPath = multipartRequest.getServletContext().getRealPath("resources/images/PlaceImages");
				
				if(!extensionList.contains(extension)) {
					// 이 때 이 전에 업로드 받았던 파일들은 다 삭제해야한다.
					// 업로드 된 파일들은 sb에 목록으로 저장되어있다.
					String fileList = sb.toString().replace("\"", "").replace("[", "").replace("]", "");
					StringTokenizer st = new StringTokenizer(fileList, ", ");
					
					while(st.hasMoreTokens()) {
						File uploadedFile = new File(realPath, st.nextToken());
						if (uploadedFile.exists()) {
							uploadedFile.delete();
						}
					}
					// 이미지파일이 아닐경우 -1
					// 파일형식이 맞지 않으므로 메소드를 끝낸다.
					rttr.addFlashAttribute("updateResult", -1);
					return;
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
					sb.append("\""+uploadFilename+"\", ");
				} else {
					sb.append("\""+uploadFilename+"\"]");
					sb.insert(0, "[");
				}
				StringTokenizer st = new StringTokenizer(p_img,", ");
				while(st.hasMoreTokens()) {
					sb.insert(sb.indexOf("[")+1 , "\""+st.nextToken()+"\", ");
				}
			} else {
				StringTokenizer st = new StringTokenizer(p_img,", ");
				while(st.hasMoreTokens()) {
					sb.append("\""+st.nextToken()+"\", ");
				}
				sb.deleteCharAt(sb.lastIndexOf(","));
				sb.insert(0, "[").append("]");
			}
		}
		// 기존 이미지 
	
		if ( !sb.toString().isEmpty() && sb.toString() != null) {
			placeDto.setP_img(sb.toString());
		}
		placeDao.placeUpdate(placeDto);
		
		String[] poNameList= multipartRequest.getParameterValues("po_name");
		String[] poDayPriceList = multipartRequest.getParameterValues("po_dayPrice");
		String[] poHolidayList = multipartRequest.getParameterValues("po_holiday");
		String[] poMinList = multipartRequest.getParameterValues("po_min");
		String[] poMaxList = multipartRequest.getParameterValues("po_max");
		String[] change = multipartRequest.getParameterValues("change");
		String[] poNoList = multipartRequest.getParameterValues("po_no");
		String[] facilityCount= multipartRequest.getParameterValues("facility-count");
		
		PlaceOptionDto placeOptionDto = new PlaceOptionDto();
		placeOptionDto.setP_no(p_no);
		
		int changeCount = 0;
		for(int i = 0; i<change.length;i++) {
			changeCount += Integer.parseInt(change[i]);
		}
		int prevCount = 0;
		int updateCount = 0;
		List<MultipartFile> optionImgList = multipartRequest.getFiles("po_img");
		String[] po_facilityList = multipartRequest.getParameterValues("po_facility");
		for(int i = 0; i<facilityCount.length;i++) {
			sb.setLength(0);
			int count = Integer.parseInt(facilityCount[i]);
			if (count == 0) {continue;}
			for(int j =0;j<count;j++) {
				if(j!=(count-1)){
					sb.append("\""+po_facilityList[j+prevCount]+"\", ");
				} else {
					sb.append("\""+po_facilityList[j+prevCount]+"\"]");
					sb.insert(0, "[");
				}
			}
			String po_facility = sb.toString();
			
			placeOptionDto.setPo_name(poNameList[i]);
			placeOptionDto.setPo_dayPrice(Integer.parseInt(poDayPriceList[i]));
			placeOptionDto.setPo_holiday(Integer.parseInt(poHolidayList[i]));
			placeOptionDto.setPo_min(Integer.parseInt(poMinList[i]));
			placeOptionDto.setPo_max(Integer.parseInt(poMaxList[i]));
			placeOptionDto.setPo_fxility(po_facility);
			if(i<change.length && Integer.parseInt(change[i])==1) {
				MultipartFile file = optionImgList.get(i);
				String originalFilename = file.getOriginalFilename();
				String extension = originalFilename.substring(originalFilename.lastIndexOf(".")+1);
				String realPath = multipartRequest.getServletContext().getRealPath("resources/images/PlaceOptionImages");
				
				if(!extensionList.contains(extension)) {
					continue;
				}
				String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
				String po_img = filename + "-" + System.currentTimeMillis() + "." + extension;
				
				File dir = new File(realPath);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				
				File uploadFile = new File(realPath, po_img);
				
				try {
					file.transferTo(uploadFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
				placeOptionDto.setPo_no(Integer.parseInt(poNoList[i]));
				placeOptionDto.setPo_img(po_img);
				updateCount += placeOptionDao.placeOptionUpdate(placeOptionDto);
			} else if(i<change.length && Integer.parseInt(change[i])==0){ // 이미 존재하는 option이고, 이미지 변경이 없을 경우
				placeOptionDto.setPo_no(Integer.parseInt(poNoList[i]));
				updateCount += placeOptionDao.placeOptionUpdate(placeOptionDto);
			} else { // 기존에 없던 option을 새로 작성한 경우
				updateCount += placeOptionDao.placeOptionInsert(placeOptionDto);
			}
			
			prevCount = count;
		}
		if(updateCount == poNameList.length) {
			rttr.addFlashAttribute("updateResult", 1);
		} else {
			rttr.addFlashAttribute("updateResult", -3);
		}
		
		rttr.addFlashAttribute("p_no", p_no);
		
	}

}
