package com.koreait.baraON.command.member;

import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

import com.koreait.baraON.command.BaraONCommand;

public class EmailAuthCommmand implements BaraONCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		try {
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest)map.get("request");
			JavaMailSender mailSender = (JavaMailSender)map.get("mailSender");
			
			MimeMessage message = mailSender.createMimeMessage();
			message.setHeader("Content-Type", "text/plain; charset=utf-8");
			message.setFrom(new InternetAddress("dpwls6787@gmail.com", "바라온"));
			
			InternetAddress to = new InternetAddress(request.getParameter("email"));
			
			message.setRecipient(RecipientType.TO, to);
			message.setSubject("인증 요청 메일입니다.");
			
			long authKey = (long)(Math.random() * 100000000L) + 1234567890;
			
			message.setText("인증코드: " + authKey);
			mailSender.send(message);
			
			model.addAttribute("authKey", authKey);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
