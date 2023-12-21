package com.mkfactory.toothless.e.registercounselor.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.JinyongRestResponseDto;
import com.mkfactory.toothless.e.dto.LicenseImageDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;
import com.mkfactory.toothless.e.registercounselor.service.RegisterCounselorServiceImpl;

@RestController
@RequestMapping("/tl_e/registerCounselor")
public class RegisterCounselorRestController {
	
	@Autowired
	RegisterCounselorServiceImpl registerCounselorService; 
	
	@RequestMapping("restGetStaffInfo")
	public JinyongRestResponseDto restGetStaffInfo(HttpSession session) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
		
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(sessionStaffInfo);
		
		return jinyongRestResponseDto;
		
	}
	
	@RequestMapping("getStudentInfo")
	public JinyongRestResponseDto getStudentInfo(HttpSession session) {
		
		
		StudentInfoDto sessionStudentInfo = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(sessionStudentInfo);
		
		return jinyongRestResponseDto;
		
	}
	
	@RequestMapping("showCounselorInfoModal")
	public JinyongRestResponseDto showCounselorInfoModal(int counselorId) {
		
		Map<String, Object> counselorDetail = registerCounselorService.getCounselorDetailForAJAX(counselorId);
		
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(counselorDetail);
		
		return jinyongRestResponseDto;
		
	}
	
	@RequestMapping("restGetCounselorInfo")	
	public JinyongRestResponseDto restGetCounselorInfo(
			@RequestParam(name="searchCounselorName" ,defaultValue="default") String searchCounselorName,
			@RequestParam(name="searchCounselorType", required=false) int[] searchCounselorType,
			@RequestParam(name="searchGenderOption", defaultValue="default") String searchGenderOption,
			@RequestParam(name="searchScoreOption",defaultValue="default") String searchScoreOption			
			) {
		System.out.println("[ RegisterCounselorRestController] => [ restGetCounselorInfo ] 실행됨");
		System.out.println("---------------------------------------------------------");
		
		if(searchGenderOption.equals("undefined")) {
			searchGenderOption = "default";
		}else if(searchGenderOption.equals("male")) {
			searchGenderOption = "M";
		}else if(searchGenderOption.equals("female")) {
			searchGenderOption = "F";
		}else if(searchGenderOption.equals("all")) {
			searchGenderOption = "default";
		}		
		
		List<Map<String, Object>> counselorList = 
				registerCounselorService.getCounselorListForAJAX(
						searchCounselorName,searchCounselorType,searchGenderOption,searchScoreOption
						);
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
		
		for(Map<String, Object> map :counselorList) {
			System.out.println(map.get("NAME"));
		}
		
		jinyongRestResponseDto.setData(counselorList);
		jinyongRestResponseDto.setResult("success");
		
		return jinyongRestResponseDto;
		
	}
	
	@RequestMapping("reloadSearchTypeCategory")
	public JinyongRestResponseDto reloadSearchTypeCategory() {
		
		List<TypeCategoryDto> categoryList = registerCounselorService.getAllTypeCategoryList();
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(categoryList);
		
		return jinyongRestResponseDto;
		
	}
	
	@RequestMapping("checkDuplicationId")
	public JinyongRestResponseDto checkDuplicationId(String inputId) {
			
		boolean resultValue = registerCounselorService.checkDuplicationID(inputId);
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		jinyongRestResponseDto.setData(resultValue);
		
		return jinyongRestResponseDto;
			
	}
	
	@RequestMapping("resigterCounselorProcess")
	public JinyongRestResponseDto resigterCounselorProcess(
			@RequestParam(name="profile_Image") MultipartFile profile_Image,
			ExternalInfoDto externalInfoDto,
			CounselorDto counselorDto,
			@RequestParam(name="type_category_id") int[] counselorTypeList,
			MultipartFile[] license
			) {
		
		if(profile_Image.isEmpty() == true) {
			
			JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
			
			jinyongRestResponseDto.setResult("fail");
			jinyongRestResponseDto.setData(null);
			
			return jinyongRestResponseDto;
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
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		
		return jinyongRestResponseDto;
	}
	
	
	public JinyongRestResponseDto templete() {
		
		JinyongRestResponseDto jinyongRestResponseDto = new JinyongRestResponseDto();
				
		jinyongRestResponseDto.setResult("success");
		
		return jinyongRestResponseDto;
		
	}
}
