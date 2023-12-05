package com.mkfactory.toothless.e.registercounselor.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.mkfactory.toothless.e.dto.LicenseImageDto;
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
			@RequestParam(name="profile_Image") MultipartFile profile_Image,
			ExternalInfoDto externalInfoDto,
			CounselorDto counselorDto,
			@RequestParam(name="type_category_id") int[] counselorTypeList,
			MultipartFile[] license
			) {
		
		System.out.println("[ RegisterCounselorController] => [ registerProcess ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		if(profile_Image.isEmpty() == true) {
			return "./imgRequired";
		}
		else {
			String originalFilename = profile_Image.getOriginalFilename();
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
				profile_Image.transferTo(new File(rootPath + todayPath + fileName));
			}catch(Exception e) {
				e.printStackTrace();
			}			
			
			counselorDto.setProfileImage(todayPath + fileName);
		}
		
		
		List<LicenseImageDto> licenseImageList = new ArrayList<LicenseImageDto>();
		
		if(license != null) {
			for(MultipartFile multipartFile : license) {
				if(multipartFile.isEmpty() == true) {
					continue;
				}
				
				String originalFilename = multipartFile.getOriginalFilename();
				System.out.println("originalFilename : " + originalFilename);			
				
				String rootPath = "c:/Workspace/GitWorkspace/toothless/src/main/webapp/resources/img/counselorImage/license/";
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
					multipartFile.transferTo(new File(rootPath + todayPath + fileName));
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				LicenseImageDto licenseImageDto = new LicenseImageDto();
				licenseImageDto.setLicense(todayPath + fileName);
				licenseImageList.add(licenseImageDto);
			}
		}
		
		registerCounselorService.registerCounselor(externalInfoDto, counselorDto, counselorTypeList, licenseImageList);
		
		return "./tl_e/registerCounselor/registerSuccess";
	}
	
	@RequestMapping("counselorInfo")
	public String counselorInfo(Model model) {
		System.out.println("[ RegisterCounselorController] => [ counselorInfo ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		List<Map<String, Object>> counselorList = registerCounselorService.getAllCounselorList();
		
		model.addAttribute("counselorList", counselorList);
		
		return "./tl_e/registerCounselor/counselorInfo";
	}
	
	@RequestMapping("counselorDetail")
	public String counselorDetail(int id, Model model) {
		System.out.println("[ RegisterCounselorController] => [ counselorDetail ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		CounselorDto counselorDto = registerCounselorService.getCounselorInfo(id);
		
		List<Map<String, Object>> counselorTypeList = registerCounselorService.getCounselorTypeByCounselorId(id);
		
		List<LicenseImageDto> licenseList = registerCounselorService.getLicenseImgByCounselorId(id);
		
		model.addAttribute("counselorDto", counselorDto);
		model.addAttribute("counselorTypeList", counselorTypeList);		
		model.addAttribute("licenseList", licenseList);
		
		return "./tl_e/registerCounselor/counselorDetail";
	}
	
}
