package com.koreait.baraON.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.command.admin.AdminEventListCommand;
import com.koreait.baraON.command.admin.AdminEventViewCommand;
import com.koreait.baraON.command.admin.AdminMemberCommand;
import com.koreait.baraON.command.admin.AdminMemberDeleteCommand;
import com.koreait.baraON.command.admin.AdminMemberListCommand;
import com.koreait.baraON.command.admin.AdminMemberUpdateCommand;
import com.koreait.baraON.command.admin.AdminMemberViewCommand;
import com.koreait.baraON.command.admin.AdminNoticeListCommand;
import com.koreait.baraON.command.admin.AdminNoticeViewCommand;
import com.koreait.baraON.command.admin.AdminReplyDeleteCommand;
import com.koreait.baraON.command.admin.AdminReplyListCommand;
import com.koreait.baraON.command.admin.AdminReviewDeleteCommand;
import com.koreait.baraON.command.admin.AdminReviewListCommand;
import com.koreait.baraON.command.admin.AdminSellerDeleteCommand;
import com.koreait.baraON.command.admin.AdminSellerListCommand;
import com.koreait.baraON.command.admin.AdminSellerUpdateCommand;
import com.koreait.baraON.command.admin.AdminSellerViewCommand;
import com.koreait.baraON.command.board.EventDeleteCommand;
import com.koreait.baraON.command.board.EventInsertCommand;
import com.koreait.baraON.command.board.EventUpdateCommand;
import com.koreait.baraON.command.board.FAQDeleteCommand;
import com.koreait.baraON.command.board.FAQInsertCommand;
import com.koreait.baraON.command.board.FAQListCommand;
import com.koreait.baraON.command.board.FAQUpdateCommand;
import com.koreait.baraON.command.board.FAQViewCommand;
import com.koreait.baraON.command.board.NoticeCommand;
import com.koreait.baraON.command.board.NoticeDeleteCommand;
import com.koreait.baraON.command.board.NoticeInsertCommand;
import com.koreait.baraON.command.board.NoticeUpdateCommand;
import com.koreait.baraON.dto.AdminMemberDto2;
import com.koreait.baraON.dto.AdminSellerDto2;
import com.koreait.baraON.dto.EventDto;
import com.koreait.baraON.dto.FAQDto;
import com.koreait.baraON.dto.NoticeDto;
import com.koreait.baraON.dto.PageVo;

@Controller
public class AdminController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private NoticeCommand noticeCommand;
	private AdminMemberCommand adminMemberCommand;
	
	
	// 단순이동
	@RequestMapping(value="admin", method=RequestMethod.GET)
		public String adminPage() {
			return "admin/adminPage";
	}
	@RequestMapping(value="noticeInsertPage.admin", method=RequestMethod.GET)
		public String noticeInsertPage() {
			return "admin/AdminNoticeInsertPage";
	}
	@RequestMapping(value="faqInsertPage.admin", method=RequestMethod.GET)
		public String faqInsertPage() {
		return "admin/AdminFaqInsertPage";
	}
	@RequestMapping(value="noticeUpdatePage.admin", method=RequestMethod.GET)
		public String noticeUpdatePage(NoticeDto noticeDto,
										Model model) {
		model.addAttribute("noticeDto", noticeDto);
		return "admin/AdminNoticeUpdatePage";
	}
	@RequestMapping(value="faqUpdatePage.admin", method=RequestMethod.GET)
		public String faqUpdatePage(FAQDto faqDto,
									Model model) {
		model.addAttribute("faqDto" , faqDto);
		return "admin/AdminFaqUpdatePage";
	}
	@RequestMapping(value="adminMemberPage.admin" , method=RequestMethod.GET)
		public String adminMemberListPage() {
		return "admin/AdminMemberListPage";
	}
	@RequestMapping(value="adminSellerPage.admin" , method=RequestMethod.GET)
	public String adminSellerList() {
	return "admin/AdminSellerPage";
	}
	@RequestMapping(value="adminReplyPage.admin" , method=RequestMethod.GET)
		public String adminReplyListPagege() {
		return "admin/AdminReplyPage";
	}
	@RequestMapping(value="adminReviewPage.admin" , method=RequestMethod.GET)
		public String adminReviewListPagege() {
		return "admin/AdminReviewPage";
	}
	@RequestMapping(value="eventInsertPage.admin", method=RequestMethod.GET)
	public String eventInsertPage() {
		return "admin/AdminEventInsertPage";
	}
	@RequestMapping(value="eventUpdatePage.admin", method=RequestMethod.GET)
	public String eventUpdatePage(EventDto eventDto,
									Model model) {
	model.addAttribute("eventDto", eventDto);
	return "admin/AdminEventUpdatePage";
	}
	
	//BOARD
	@RequestMapping(value="adminNoticeListPage.admin",method=RequestMethod.GET)
		public String noticeListPage(HttpServletRequest request, Model model){
			model.addAttribute("request" , request);
			noticeCommand = new AdminNoticeListCommand();
			noticeCommand.execute(sqlSession, model);
			return "admin/AdminNoticeListPage";
	}
	@RequestMapping(value="noticeViewPage.admin",method=RequestMethod.GET)
		public String noticeViewPage(HttpServletRequest request, Model model) {
			model.addAttribute("request" , request);
			noticeCommand = new AdminNoticeViewCommand();
			noticeCommand.execute(sqlSession, model);
			return "admin/AdminNoticeViewPage";
	}
	@RequestMapping(value="noticeInsert.admin" , method=RequestMethod.GET)
		public String noticeInsert(HttpServletRequest request,
										RedirectAttributes rttr, 
										Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		noticeCommand = new NoticeInsertCommand();
		noticeCommand.execute(sqlSession, model);
		return "redirect:adminNoticeListPage.admin";
	}
	@RequestMapping(value="noticeDelete.admin" , method=RequestMethod.GET)
		public String noticeDelete(HttpServletRequest request,
                					RedirectAttributes rttr,
                					Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		
		noticeCommand = new NoticeDeleteCommand();
		noticeCommand.execute(sqlSession, model);
		
		return "redirect:adminNoticeListPage.admin";
	}
	@RequestMapping(value="noticeUpdate.admin", method=RequestMethod.GET)
		public String noticeUpdate(HttpServletRequest request,
			                   RedirectAttributes rttr,
			                   Model model) {

		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		noticeCommand = new NoticeUpdateCommand();
		noticeCommand.execute(sqlSession, model);
		
		return "redirect:noticeViewPage.admin?no=" + request.getParameter("no");
	}
	@RequestMapping(value="adminFaqListPage.admin" , method=RequestMethod.GET)
		public String FAQListPage(HttpServletRequest request, Model model) {
			model.addAttribute("request" , request);
			noticeCommand = new FAQListCommand();
			noticeCommand.execute(sqlSession, model);
			return "admin/AdminFaqListPage";
	}
	@RequestMapping(value="faqViewPage.admin", method=RequestMethod.GET)
		public String faqViewPage(HttpServletRequest request, Model model) {
			model.addAttribute("request" , request);
			noticeCommand = new FAQViewCommand();
			noticeCommand.execute(sqlSession, model);
			return "admin/AdminFaqViewPage";
	}
	@RequestMapping(value="faqInsert.admin" , method=RequestMethod.GET)
		public String faqInsert(HttpServletRequest request,
									RedirectAttributes rttr, 
									Model model) {
			
			model.addAttribute("request", request);
			model.addAttribute("rttr", rttr);
			noticeCommand = new FAQInsertCommand();
			noticeCommand.execute(sqlSession, model);
			return "redirect:adminFaqListPage.admin";
	}
	@RequestMapping(value="faqDelete.admin" , method=RequestMethod.GET)
		public String faqDelete(HttpServletRequest request,
            					RedirectAttributes rttr,
            					Model model) {
			
			model.addAttribute("request", request);
			model.addAttribute("rttr", rttr);
			noticeCommand = new FAQDeleteCommand();
			noticeCommand.execute(sqlSession, model);
			return "redirect:adminFaqListPage.admin";
	}
	@RequestMapping(value="faqUpdate.admin", method=RequestMethod.GET)
		public String faqUpdate(HttpServletRequest request,
		                   		RedirectAttributes rttr,
		                   		Model model) {

			model.addAttribute("request", request);
			model.addAttribute("rttr", rttr);
			noticeCommand = new FAQUpdateCommand();
			noticeCommand.execute(sqlSession, model);
			return "redirect:faqViewPage.admin?no=" + request.getParameter("no");
	}
	@RequestMapping(value="adminEventListPage.admin",method=RequestMethod.GET)
	public String eventListPage(HttpServletRequest request, Model model){
		model.addAttribute("request" , request);
		noticeCommand = new AdminEventListCommand();
		noticeCommand.execute(sqlSession, model);
		return "admin/AdminEventListPage";
}
	@RequestMapping(value="eventViewPage.admin",method=RequestMethod.GET)
		public String eventViewPage(HttpServletRequest request, Model model) {
			model.addAttribute("request" , request);
			noticeCommand = new AdminEventViewCommand();
			noticeCommand.execute(sqlSession, model);
			return "admin/AdminEventViewPage";
	}
	@RequestMapping(value="eventInsert.admin" , method=RequestMethod.GET)
		public String eventInsert(HttpServletRequest request,
										RedirectAttributes rttr, 
										Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		noticeCommand = new EventInsertCommand();
		noticeCommand.execute(sqlSession, model);
		return "redirect:adminEventListPage.admin";
	}
	@RequestMapping(value="eventDelete.admin" , method=RequestMethod.GET)
		public String eventDelete(HttpServletRequest request,
	            					RedirectAttributes rttr,
	            					Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		
		noticeCommand = new EventDeleteCommand();
		noticeCommand.execute(sqlSession, model);
		
		return "redirect:adminEventListPage.admin";
	}
	@RequestMapping(value="eventUpdate.admin", method=RequestMethod.GET)
		public String eventUpdate(HttpServletRequest request,
			                   RedirectAttributes rttr,
			                   Model model) {
	
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		noticeCommand = new EventUpdateCommand();
		noticeCommand.execute(sqlSession, model);
		
		return "redirect:eventViewPage.admin?no=" + request.getParameter("no");
	}
	
	
	//MEMBER
	@RequestMapping(value="member", method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
		public Map<String, Object> memberList(@RequestBody PageVo pageVo, Model model) {
		model.addAttribute("page" , pageVo.getPage());
		adminMemberCommand = new AdminMemberListCommand();
		return adminMemberCommand.execute(sqlSession, model);
	}
	@RequestMapping(value="member/{no}", method=RequestMethod.GET,
	        		produces="application/json; charset=utf-8")
	@ResponseBody
		public Map<String, Object> memberView(@PathVariable("no") int no,
		                              			Model model) {
		model.addAttribute("no", no);
		adminMemberCommand = new AdminMemberViewCommand();
		return adminMemberCommand.execute(sqlSession, model);
	}
	@RequestMapping(value="member", method=RequestMethod.PUT,
	            	produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> memberUpdate(@RequestBody AdminMemberDto2 adminMemberDto2,
	                                     	Model model) {
	if (adminMemberDto2 != null) {
		model.addAttribute("adminMemberDto2", adminMemberDto2);
	}
		adminMemberCommand = new AdminMemberUpdateCommand();
		return adminMemberCommand.execute(sqlSession, model);
	}
	@RequestMapping(value="member/{no}",method=RequestMethod.DELETE,
            		produces="application/json; charset=utf-8")
	@ResponseBody
		public Map<String, Object> memberDelete(@PathVariable("no") int no,
												Model model) {
		model.addAttribute("no", no);
		adminMemberCommand = new AdminMemberDeleteCommand();
		return adminMemberCommand.execute(sqlSession, model);
	}
	// SELLER
	@RequestMapping(value="seller", method=RequestMethod.POST,
					produces="application/json; charset=utf-8")
	@ResponseBody
		public Map<String, Object> sellerList(@RequestBody PageVo pageVo, Model model) {
		model.addAttribute("page" , pageVo.getPage());
		adminMemberCommand = new AdminSellerListCommand();
		return adminMemberCommand.execute(sqlSession, model);
	}
	@RequestMapping(value="seller/{no}", method=RequestMethod.GET,
	    			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sellerView(@PathVariable("no") int no,
	                              			Model model) {
		model.addAttribute("no", no);
		adminMemberCommand = new AdminSellerViewCommand();
		return adminMemberCommand.execute(sqlSession, model);
	}
	@RequestMapping(value="seller", method=RequestMethod.PUT,
	        		produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sellerUpdate(@RequestBody AdminSellerDto2 adminSellerDto2,
	                                 	Model model) {
	if (adminSellerDto2 != null) {
	model.addAttribute("adminSellerDto2", adminSellerDto2);
	}
	adminMemberCommand = new AdminSellerUpdateCommand();
	return adminMemberCommand.execute(sqlSession, model);
	}
	@RequestMapping(value="seller/{no}",method=RequestMethod.DELETE,
	    			produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sellerDelete(@PathVariable("no") int no,
											Model model) {
		model.addAttribute("no", no);
		adminMemberCommand = new AdminSellerDeleteCommand();
		return adminMemberCommand.execute(sqlSession, model);
	}
	
	
	//REPLY
	@RequestMapping(value="reply", method=RequestMethod.GET,
			produces="application/json; charset=utf-8")
	@ResponseBody
		public Map<String, Object> replyList(Model model) {
		adminMemberCommand = new AdminReplyListCommand();
		return adminMemberCommand.execute(sqlSession, model);
	}
	@RequestMapping(value="reply/{no}",method=RequestMethod.DELETE,
    				produces="application/json; charset=utf-8")
	@ResponseBody
		public Map<String, Object> replyDelete(@PathVariable("no") int no,
												Model model) {
		model.addAttribute("no", no);
		adminMemberCommand = new AdminReplyDeleteCommand();
		return adminMemberCommand.execute(sqlSession, model);
	}
	
	
	//REVIEW
	@RequestMapping(value="review", method=RequestMethod.GET,
					produces="application/json; charset=utf-8")
	@ResponseBody
		public Map<String, Object> reviewList(Model model) {
		adminMemberCommand = new AdminReviewListCommand();
		return adminMemberCommand.execute(sqlSession, model);
	}
	@RequestMapping(value="review/{no}",method=RequestMethod.DELETE,
    				produces="application/json; charset=utf-8")
	@ResponseBody
		public Map<String, Object> reviewDelete(@PathVariable("no") int no,
												Model model) {
		model.addAttribute("no", no);
		adminMemberCommand = new AdminReviewDeleteCommand();
		return adminMemberCommand.execute(sqlSession, model);
	}
}
