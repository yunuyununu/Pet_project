package com.example.Shopping.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.Shopping.admin.model.dao.AdminDAO;
import com.example.Shopping.admin.model.dto.AdminDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("admin/*")
public class AdminController {
	
	@Autowired
	AdminDAO adminDao;
	
	//관리자 로그인화면
	@GetMapping("login.do")
	public String login(){
		return "admin/admin_login";
	}
	
	@PostMapping("adlogin.do")
	public ModelAndView login(AdminDTO dto, HttpSession session, ModelAndView mav) {
		String a_name = adminDao.login(dto);
		if (a_name != null) { //로그인 성공시
			session.setAttribute("a_id", dto.getA_id());
			session.setAttribute("a_name", a_name);
			mav.setViewName("admin/admain"); //관리자 홈화면으로
		//로그인 실패시 알람창
		} else {
			mav.setViewName("admin/admin_login"); //관리자 로그인페이지로
			mav.addObject("message", "failure");
		}
		return mav;
	}
	
	//로그아웃
	@GetMapping("adlogout.do")
	public String logout(HttpSession session){
		session.invalidate(); // 세션 무효화
		return "redirect:/admin/login.do";
	}
	
	//기능추가시 ==> 로그인체크 기능
	//인터셉터 사용
//	
//	@GetMapping("main")
//	public ModelAndView main(ModelAndView mav) {
//		mav.setViewName("admin/admin_main");
//		return mav;
//	}
	
}
