package com.example.Shopping.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.Shopping.user.model.dao.MemberDAO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("user/member/*")
public class MemberController {
	
	@Autowired
	MemberDAO memberDao;
	
	@GetMapping("join")
	public String join() {
		return "user/member/join";
	}
	
	//회원가입
	@PostMapping("join.do")
	public ModelAndView join(HttpServletRequest request,ModelAndView mav) {
		return mav;
	}
	
	//아이디 중복 체크
	@PostMapping("id_check.do")
	@ResponseBody
	public int id_check(@RequestParam("m_id") String m_id) {
		int checkId = memberDao.id_check(m_id);
		return checkId;
	}
}
