package com.koreait.baraON.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.baraON.command.board.FAQDeleteCommand;
import com.koreait.baraON.command.board.FAQInsertCommand;
import com.koreait.baraON.command.board.FAQListCommand;
import com.koreait.baraON.command.board.FAQUpdateCommand;
import com.koreait.baraON.command.board.FAQViewCommand;
import com.koreait.baraON.command.board.NoticeCommand;
import com.koreait.baraON.command.board.NoticeDeleteCommand;
import com.koreait.baraON.command.board.NoticeInsertCommand;
import com.koreait.baraON.command.board.NoticeListCommand;
import com.koreait.baraON.command.board.NoticeUpdateCommand;
import com.koreait.baraON.command.board.NoticeViewCommand;

@Controller
public class AdminBoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private NoticeCommand noticeCommand;
	
	// BOARD 관련
	
	// 단순이동
	@RequestMapping(value="admin", method=RequestMethod.GET)
		public String adminPage() {
			return "admin/adminPage";
	}
	@RequestMapping(value="admin/noticeInsertPage.admin", method=RequestMethod.GET)
		public String noticeInsertPage() {
			return "admin/AdminNoticeInsertPage";
	}
	@RequestMapping(value="admin/faqInsertPage.admin", method=RequestMethod.GET)
		public String faqInsertPage() {
		return "admin/AdminFaqInsertPage";
	}
	@RequestMapping(value="admin/noticeUpdatePage.admin", method=RequestMethod.GET)
		public String noticeUpdatePage() {
		return "admin/AdminNoticeUpdatePage";
	}
	@RequestMapping(value="admin/faqUpdatePage.admin", method=RequestMethod.GET)
		public String faqUpdatePage() {
		return "admin/AdminFaqUpdatePage";
	}
	
	
	
	@RequestMapping(value="admin/noticeListPage.admin",method=RequestMethod.GET)
		public String noticeListPage(HttpServletRequest request, Model model){
			model.addAttribute("request" , request);
			noticeCommand = new NoticeListCommand();
			noticeCommand.execute(sqlSession, model);
			return "admin/AdminNoticeListPage";
	}
	@RequestMapping(value="admin/noticeViewPage.admin",method=RequestMethod.GET)
		public String noticeViewPage(HttpServletRequest request, Model model) {
			model.addAttribute("request" , request);
			noticeCommand = new NoticeViewCommand();
			noticeCommand.execute(sqlSession, model);
			return "admin/AdminNoticeViewPage";
	}
	@RequestMapping(value="admin/noticeInsert.admin" , method=RequestMethod.GET)
		public String noticeInsert(HttpServletRequest request,
										RedirectAttributes rttr, 
										Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		noticeCommand = new NoticeInsertCommand();
		noticeCommand.execute(sqlSession, model);
		return "redirect:noticeListPage.admin";
	}
	@RequestMapping(value="admin/noticeDelete.admin" , method=RequestMethod.GET)
		public String noticeDelete(HttpServletRequest request,
                					RedirectAttributes rttr,
                					Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		
		noticeCommand = new NoticeDeleteCommand();
		noticeCommand.execute(sqlSession, model);
		
		return "redirect:noticeListPage.admin";
	}
	@RequestMapping(value="admin/noticeUpdate.admin", method=RequestMethod.GET)
		public String noticeUpdate(HttpServletRequest request,
			                   RedirectAttributes rttr,
			                   Model model) {

		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		noticeCommand = new NoticeUpdateCommand();
		noticeCommand.execute(sqlSession, model);
		
		return "redirect:noticeViewPage.admin?no=" + request.getParameter("no");
	}
	@RequestMapping(value="admin/faqListPage.admin" , method=RequestMethod.GET)
		public String FAQListPage(HttpServletRequest request, Model model) {
			model.addAttribute("request" , request);
			noticeCommand = new FAQListCommand();
			noticeCommand.execute(sqlSession, model);
			return "admin/AdminFaqListPage";
	}
	@RequestMapping(value="admin/faqViewPage.admin", method=RequestMethod.GET)
		public String faqViewPage(HttpServletRequest request, Model model) {
			model.addAttribute("request" , request);
			noticeCommand = new FAQViewCommand();
			noticeCommand.execute(sqlSession, model);
			return "admin/AdminFaqViewPage";
	}
	@RequestMapping(value="admin/faqInsert.admin" , method=RequestMethod.GET)
		public String faqInsert(HttpServletRequest request,
									RedirectAttributes rttr, 
									Model model) {
			
			model.addAttribute("request", request);
			model.addAttribute("rttr", rttr);
			noticeCommand = new FAQInsertCommand();
			noticeCommand.execute(sqlSession, model);
			return "redirect:faqListPage.admin";
	}
	@RequestMapping(value="admin/faqDelete.admin" , method=RequestMethod.GET)
		public String faqDelete(HttpServletRequest request,
            					RedirectAttributes rttr,
            					Model model) {
			
			model.addAttribute("request", request);
			model.addAttribute("rttr", rttr);
			noticeCommand = new FAQDeleteCommand();
			noticeCommand.execute(sqlSession, model);
			return "redirect:faqListPage.admin";
	}
	@RequestMapping(value="admin/faqUpdate.admin", method=RequestMethod.GET)
		public String faqUpdate(HttpServletRequest request,
		                   		RedirectAttributes rttr,
		                   		Model model) {

			model.addAttribute("request", request);
			model.addAttribute("rttr", rttr);
			noticeCommand = new FAQUpdateCommand();
			noticeCommand.execute(sqlSession, model);
			return "redirect:faqViewPage.admin?no=" + request.getParameter("no");
	}		
	
}
