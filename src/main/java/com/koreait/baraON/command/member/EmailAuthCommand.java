package com.koreait.baraON.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

import com.koreait.baraON.dao.MemberDao;

public class EmailAuthCommand {
	
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		long authKey = (long)(Math.random()*10000000000L) + 1234567890;	

		try {
			
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest)map.get("request");
			JavaMailSender mailSender = (JavaMailSender)map.get("mailSender");
			
			MimeMessage message = mailSender.createMimeMessage();
			message.setHeader("Content-Type", "text/plain; charset=utf-8");
			message.setFrom(new InternetAddress("jaepppi@gmail.com","baraON"));
			
			InternetAddress to = new InternetAddress(request.getParameter("email"));
			InternetAddress[] toList = {to};
			
			message.setRecipient(Message.RecipientType.TO, to);
			message.setSubject("바라온 가입인증 요청 메일입니다");
			message.setText("인증코드: "+authKey);	
			
			mailSender.send(message); 	
			
			model.addAttribute("authKey", authKey);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("resultMap", authKey);
		
		return resultMap;
		
	}

}
