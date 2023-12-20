package com.mkfactory.toothless.donot.touch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@Autowired
	StudentController studentController;
	
	
	@RequestMapping("/")
	public String mainPage() {
		
		return studentController.loginPage();
	}
}
