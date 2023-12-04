package com.mkfactory.toothless.e.registercounselor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;
import com.mkfactory.toothless.e.registercounselor.service.RegisterCounselorServiceImpl;

@Controller
@RequestMapping("/tl_e/registerCounselor")
public class RegisterCounselorController {
	
	@Autowired
	RegisterCounselorServiceImpl registerCounselorService;
	
	@RequestMapping("registerPage")
	public String registerPage(Model model) {
		System.out.println("[ RegisterCounselorController] => [ registerPage ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		List<TypeCategoryDto> typeCategoryList = registerCounselorService.getAllTypeCategoryList();
		
		model.addAttribute("typeCategoryList", typeCategoryList);
		
		return "./tl_e/registerCounselor/registerPage";
	}
	
	@RequestMapping("registerProcess")
	public String registerProcess(
			ExternalInfoDto externalInfoDto,
			CounselorDto counselorDto,
			@RequestParam(name="type_category_id") int[] counselorTypeList) {
		
		System.out.println("[ RegisterCounselorController] => [ registerProcess ] 실행됨");
		System.out.println("---------------------------------------------------------");
			
		for(int type_category_id : counselorTypeList) {			
			System.out.println(type_category_id);
		}
		
		registerCounselorService.registerCounselor(externalInfoDto, counselorDto, counselorTypeList);
		
		return "./tl_e/registerCounselor/registerSuccess";
	}
}
