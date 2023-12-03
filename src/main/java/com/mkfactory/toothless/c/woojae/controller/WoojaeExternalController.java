package com.mkfactory.toothless.c.woojae.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksCompanyCategoryDto;
import com.mkfactory.toothless.c.woojae.service.WoojaeExternalServiceImpl;

@Controller
@RequestMapping("/tl_c/woojae/*")
public class WoojaeExternalController {
	
	@Autowired
	private WoojaeExternalServiceImpl woojaeExternalService;
	
	@RequestMapping("ajdksStaffMainPage")
	public String ajdksStaffMainPage() {
		
		return"tl_c/woojae/ajdksStaffMainPage";
	}
	
	@RequestMapping("ajdksRegisterComapanyPage")
	public String ajdksRegisterComapanyPage(Model model) {
		
		List<AjdksCompanyCategoryDto> list = woojaeExternalService.companyCategoryList();
		model.addAttribute("list", list);
		
		return"tl_c/woojae/ajdksRegisterComapanyPage";
	}
	
}
