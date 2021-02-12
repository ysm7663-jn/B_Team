package com.koreait.baraON.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.baraON.command.option.OptionDeleteCommand;

@Controller
public class PlaceOptionController {
	
	private SqlSession sqlSession;
	private OptionDeleteCommand optionDeleteCommand;
	
	@Autowired
	public void setCommands(SqlSession sqlSession,
							OptionDeleteCommand optionDeleteCommand) {
		this.sqlSession = sqlSession;
		this.optionDeleteCommand = optionDeleteCommand;
	}
	
	@RequestMapping(value="placeOptionDelete.place/{po_no}", method=RequestMethod.DELETE, produces="application/json; charset=utf-8")
	public Map<String, Object> optionDelete(@PathVariable int po_no, Model model){
		model.addAttribute("po_no", po_no);
		
		return optionDeleteCommand.execute(sqlSession, model);
	}
}
