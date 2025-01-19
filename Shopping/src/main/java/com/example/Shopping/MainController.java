package com.example.Shopping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.Shopping.user.model.dao.MainDAO;

@Controller
public class MainController {

	@Autowired
	MainDAO dao;
	
	@GetMapping("/")
    public String home(Model model) {
        model.addAttribute("message", "Hello, Spring Boot!");
        return "main";
    }
}
