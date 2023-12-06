package com.mkfactory.toothless.a.staff.sj.controller;

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

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormCategoryDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
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
	public String buildingPage(Model model) {
		model.addAttribute("dormBuilding", buildingService.dormBuildNames());
		model.addAttribute("dormAmount", buildingService.dormCategoryList());
		
		return "tl_a/staff/sj_manageDormInfo";
	}
	
	@RequestMapping("sj_manageRoomInfo")
	public String roomInfo(Model model) {
		
		model.addAttribute("dormBuilding", buildingService.dormBuildNames());
		model.addAttribute("dormAmount", buildingService.dormCategoryList());
		
		return "tl_a/staff/sj_manageRoomInfo";
	}
	
	@RequestMapping("sj_registerDormInfo")
	public String dormInfo() {
		
		return "tl_a/staff/sj_registerDormInfo";
	}
	
	@RequestMapping("sj_registerRoomInfo")
	public String registerRoomInfoPage(Model model) {
		
		model.addAttribute("dormBuilding", buildingService.dormBuildNames());
		model.addAttribute("dormAmount", buildingService.dormCategoryList());
		return "tl_a/staff/sj_registerRoomInfo";
	}

	
	@RequestMapping("registerDormProcess")
	public String registerDormInfoProcess(/*StaffInfoDto params,*/ DormBuildingDto dormbuildingDto, DormRoomDto dormRoomDto,MultipartFile mainImage) {
		//StaffInfoDto staffInfoDto = staffService.loginByStaffIdAndPassword(params);
		
		//기숙사 건물(동) 대표 이미지
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
	
	@RequestMapping("sj_registerRoomImages")
	public String registerRoomImagesPage(Model model) {
		model.addAttribute("dormAmount", buildingService.dormCategoryList());
		return "tl_a/staff/sj_registerRoomImages";
	}
	
	@RequestMapping("registeRoomImagesProcess")
	public String registerRoomImageProcess(@RequestParam("dorm_amount") int dormAmount, DormCategoryDto dormCategory, MultipartFile[] roomImgs, DormBuildingDto dormBuild) {
		// 상세 이미지 렛츠고
	    List<DormCategoryDto> categoryList = new ArrayList<>();

		// ㄱㄱ
		if(roomImgs != null) {
			for(MultipartFile multipartFile : roomImgs) {
				if(multipartFile.isEmpty()) {
					continue;
				}

				String rootPath = "C:/uploadRoomImgs/";
				
				// 날짜별 폴더 생성.
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
				String todayPath = sdf.format(new Date());
				
				File todayFolderForCreate = new File(rootPath + todayPath);
				
				if(!todayFolderForCreate.exists()) {
					todayFolderForCreate.mkdirs();
				}
				
				String originalFileName = multipartFile.getOriginalFilename();

				//파일명 충돌 회피 - 랜덤, 시간 조합
				String uuid = UUID.randomUUID().toString();
				long currentTime = System.currentTimeMillis();
				String fileName = uuid + "_" + currentTime;
				
				// 확장자 추출
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				fileName += ext;
				
				try {
					multipartFile.transferTo(new File(rootPath + todayPath + fileName));					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				int RoomCategoryPk = dormCategory.getDorm_amount_pk();
				DormCategoryDto dcd =  new DormCategoryDto();
				
				dcd.setDorm_amount_pk(RoomCategoryPk);
				dcd.setDorm_imgs(todayPath+fileName);
				
				categoryList.add(dcd);
				
			}
		}
		buildingService.insertRegisterCategory(dormCategory, categoryList);
		return "redirect:./sj_registerRoomImages";
	}
	
	@RequestMapping("registerRoomProcess")
	public String registerRoomInfoProcess(DormRoomDto roomDto) {
		
		buildingService.registerRoom(roomDto);
		 System.out.println("dorm_amount_pk: " + roomDto.getDorm_amount_pk());
		 System.out.println("dorm_pk: " + roomDto.getDorm_pk());
		return "redirect:./sj_registerRoomInfo";
	}
	
	@RequestMapping("deleteForDormInfoProcess")
	public String manageDorm(int dorm_pk) {
		buildingService.deleteForDormInfoProcess(dorm_pk);
		return "redirect:./sj_manageDormInfo";
		
	}
	
	
}
