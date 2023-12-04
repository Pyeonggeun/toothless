package com.mkfactory.toothless.a.staff.sj.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.staff.sj.mapper.BuildingSqlMapper;
import com.mkfactory.toothless.a.staff.sj.service.BuildingServieImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.service.StaffServiceImpl;

@Controller
@RequestMapping("/tl_a/staff/*")
public class BuildingController {
	
	@Autowired
	private BuildingServieImpl buildingService;
	
	@Autowired
	private StaffServiceImpl staffService;
	

	@RequestMapping("sj_manageDormInfo")
	public String buildingPage() {
		return "tl_a/staff/sj_manageDormInfo";
	}
	
	@RequestMapping("sj_manageRoomInfo")
	public String roomInfo() {
		return "tl_a/staff/sj_manageRoomInfo";
	}
	
	@RequestMapping("sj_registerDormInfo")
	public String dormInfo() {
		return "tl_a/staff/sj_registerDormInfo";
	}
	
	@RequestMapping("sj_registerRoomInfo")
	public String registerRoomInfoPage(Model model) {
//		model.addAttribute("dormBuilding", buildingService.dormBuildNames());
//		model.addAttribute("dormAmount", buildingService.dormCategoryList());
		return "tl_a/staff/sj_registerRoomInfo";
	}
	
	@RequestMapping("registerDormProcess")
	public String registerDormInfoProcess(/*StaffInfoDto params,*/ DormBuildingDto dormbuildingDto, MultipartFile mainImage) {
		//StaffInfoDto staffInfoDto = staffService.loginByStaffIdAndPassword(params);
		
		if (mainImage != null && !mainImage.isEmpty()) {
	        String rootPath = "C:/uploadDormMainImg/";

	        // 날짜별 폴더 생성.
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
	        String todayPath = sdf.format(new Date());

	        File todayFolderForCreate = new File(rootPath + todayPath);

	        if (!todayFolderForCreate.exists()) {
	            todayFolderForCreate.mkdirs();
	        }

	        String originalFileName = mainImage.getOriginalFilename();

	        // 파일명 충돌 회피 - 랜덤, 시간 조합
	        String uuid = UUID.randomUUID().toString();
	        long currentTime = System.currentTimeMillis();
	        String fileName = uuid + "_" + currentTime;

	        // 확장자 추출
	        String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
	        fileName += ext;

	        try {
	        	mainImage.transferTo(new File(rootPath + todayPath + fileName));
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        dormbuildingDto.setMain_img(todayPath+fileName);
	    }
		
		buildingService.registerBuilding(dormbuildingDto);
		return "redirect:./sj_registerDormInfo";
	}
	
	@RequestMapping("registerRoomProcess")
	public String registerRoomInfoProcess() {
		return "redirect:./sj_registerRoomInfo";
	}
	
	
}
