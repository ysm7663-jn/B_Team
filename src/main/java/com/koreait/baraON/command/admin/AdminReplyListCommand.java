package com.koreait.baraON.command.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.AdminReplyDao;
import com.koreait.baraON.dto.AdminReplyDto;

public class AdminReplyListCommand implements AdminMemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		int page = (int)map.get("page");
		
		AdminReplyDao adminReplyDao = sqlSession.getMapper(AdminReplyDao.class);

		int totalRecord = adminReplyDao.replyCount();
		int recordPerPage = 10;
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = (endRecord < totalRecord) ? endRecord : totalRecord;
		int totalPage = totalRecord / recordPerPage;  // 전체 페이지의 개수
		if (totalRecord % recordPerPage != 0) {
			totalPage++;
		}
		totalPage = (totalPage >= page) ? totalPage : page;
		int pagePerBlock = 5;
		int beginPage = ((page - 1) / pagePerBlock) * pagePerBlock + 1;
		int endPage = beginPage + pagePerBlock - 1;
		endPage = endPage < totalPage ? endPage : totalPage;
		
		Map<String, Integer> paging = new HashMap<>();
		paging.put("totalRecord", totalRecord);
		paging.put("page", page);
		paging.put("totalPage", totalPage);
		paging.put("pagePerBlock", pagePerBlock);
		paging.put("beginPage", beginPage);
		paging.put("endPage", endPage);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("paging", paging);
		
		List<AdminReplyDto> list = adminReplyDao.adminReplyList(beginRecord, endRecord);
		result.put("list", list);

		if (list.size() > 0) {
			result.put("exist", true);
		} else {
			result.put("exist", false);
		}
		
		return result;
	}

}
