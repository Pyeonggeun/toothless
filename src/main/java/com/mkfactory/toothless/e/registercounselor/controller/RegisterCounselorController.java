package com.mkfactory.toothless.e.registercounselor.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
			@RequestParam(name="profileImage") MultipartFile profileImage,
			ExternalInfoDto externalInfoDto,
			CounselorDto counselorDto,
			@RequestParam(name="type_category_id") int[] counselorTypeList) {
		
		System.out.println("[ RegisterCounselorController] => [ registerProcess ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		if(profileImage.isEmpty() == true) {
			return "./imgRequired";
		}
		else {
			String originalFilename = profileImage.getOriginalFilename();
			System.out.println("originalFilename : " + originalFilename);			
			
			String rootPath = "c:/Workspace/GitWorkspace/toothless/src/main/webapp/resources/img/counselorImage/";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd/");
			String todayPath = sdf.format(new Date());			
			File todayFolderForCreate = new File(rootPath + todayPath);
			
			if(!todayFolderForCreate.exists()) {
				todayFolderForCreate.mkdirs();
			}
			
			String uuid = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			String fileName = uuid + "_" + currentTime;
			
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			fileName += ext;
			
			try {
				profileImage.transferTo(new File(rootPath + todayPath + fileName));
			}catch(Exception e) {
				e.printStackTrace();
			}			
			
			counselorDto.setProfileImage(todayPath + fileName);
		}	
		
		registerCounselorService.registerCounselor(externalInfoDto, counselorDto, counselorTypeList);
		
		return "./tl_e/registerCounselor/registerSuccess";
	}
	
	@RequestMapping("counselorDetail")
	public String counselorDetail(Model model) {
		System.out.println("[ RegisterCounselorController] => [ counselorDetail ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		List<Map<String, Object>> counselorList = registerCounselorService.getAllCounselorList();
		
		model.addAttribute("counselorList", counselorList);
		
		return "./tl_e/registerCounselor/counselorDetail";
	}
	
}
