package com.example.Shopping;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.Shopping.user.model.dao.MainDAO;
import com.example.Shopping.user.model.dto.MainDTO;

@Controller
//@RequestMapping("user/")
public class MainController {

	@Autowired
	MainDAO dao;
	
//	@GetMapping("/")
//    public List<MainDTO> home(Model model) {
//		List<MainDTO> dto = dao.main();
//        model.addAttribute("message", "Hello, Spring Boot!");
//        model.addAttribute("userid", dto.getUserid());
//        model.addAttribute("passwd", dto.getPasswd());
//        model.addAttribute("name", dto.getName());
//        model.addAttribute("email", dto.getEmail());
//        model.addAttribute("join_date", dto.getJoin_date());
//        System.out.println(model);
//        return "main";
//    }
	
	//홈페이지 메인화면
	@GetMapping("/")
    public ModelAndView home() {
		MainDTO dto = dao.main("kim");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admain");
		Map<String,Object> map = new HashMap<>();
		map.put("dto", dto);
		mav.addObject("map", map);
        mav.addObject("message", "Hello, Spring Boot!");
        //System.out.println("디티오="+dto);
        return mav;
    }
}
