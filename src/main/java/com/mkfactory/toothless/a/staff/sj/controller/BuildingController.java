package com.mkfactory.toothless.a.staff.sj.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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
		
	//기숙사 동 관리페이지
	@RequestMapping("sj_manageDormInfo")
	public String buildingPage(Model model) {
		model.addAttribute("dormBuilding", buildingService.dormBuildNames());
		model.addAttribute("dormAmount", buildingService.dormCategoryList());
		
		return "tl_a/staff/sj_manageDormInfo";
	}
	
	//기숙사 호실 관리 페이지
	@RequestMapping("sj_manageRoomInfo")
	public String roomInfo(Model model ) {
		
		List<Map<String, Object>> rooms2 = buildingService.roomList();
		model.addAttribute("rooms", rooms2);
		model.addAttribute("dormBuilding", buildingService.dormBuildNames());
		
		//stList
		model.addAttribute("studentList", buildingService.studentList());		
		return "tl_a/staff/sj_manageRoomInfo";
	}
	
	//기숙사 호실 상세 페이지?
	@RequestMapping("sj_manageRoomInfoReadPage")
	public String roomInfoReadPage(Model model, int dorm_pk) {
		
		List<Map<String, Object>> rooms2 = buildingService.roomList();
		model.addAttribute("rooms", rooms2);
		
		model.addAttribute("studentList", buildingService.studentList());
		model.addAttribute("dormBuilding", buildingService.dormBuildNames());
		
		return "tl_a/staff/sj_manageRoomInfoReadPage";
	}
	
	//기숙사 호실 별 (2/4인실) 이미지 관리 페이지
	@RequestMapping("sj_manageRoomImages")
	public String roomImgInfo(Model model, DormCategoryDto categoryDto) {
		
		model.addAttribute("dormAmount", buildingService.dormCategoryList());
		
		return "tl_a/staff/sj_manageRoomImages";
	}
	
	@RequestMapping("sj_manageRoomImagesReadPage")
	public String roomImgInfoReadPage() {
		
		return "tl_a/staff/sj_manageRoomImagesReadPage";
	}
	
	
	//기숙사 동 등록페이지
	@RequestMapping("sj_registerDormInfo")
	public String dormInfo() {
		
		return "tl_a/staff/sj_registerDormInfo";
	}
	
	//기숙사 호실 등록 페이지
	@RequestMapping("sj_registerRoomInfo")
	public String registerRoomInfoPage(Model model) {
		
		model.addAttribute("dormBuilding", buildingService.dormBuildNames());
		model.addAttribute("dormAmount", buildingService.dormCategoryList());
		return "tl_a/staff/sj_registerRoomInfo";
	}

	
	//기숙사 동 등록 프로세스
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
		return "redirect:./sj_manageDormInfo";
	}
	
	//기숙사 호실 이미지 등록!
	@RequestMapping("sj_registerRoomImages")
	public String registerRoomImagesPage(Model model ) {
		model.addAttribute("dormAmount", buildingService.dormCategoryList());
		return "tl_a/staff/sj_registerRoomImages";
	}
	
	//호실 별 이미지 프로세스
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
		return "redirect:./sj_manageRoomImages";
	}
	
	//기숙사 호실 등록
	@RequestMapping("registerRoomProcess")
	public String registerRoomInfoProcess(DormRoomDto roomDto) {
		
		buildingService.registerRoom(roomDto);
		 System.out.println("dorm_amount_pk: " + roomDto.getDorm_amount_pk());
		 System.out.println("dorm_pk: " + roomDto.getDorm_pk());
		return "redirect:./sj_manageRoomInfo";
	}
	
	//기숙사 동 삭제 프로세스
	@RequestMapping("deleteForDormInfoProcess")
	public String manageDorm(int dorm_pk) {
		buildingService.deleteForDormInfoProcess(dorm_pk);
		return "redirect:./sj_manageDormInfo";
		
	}
	
	//기숙사 호실 삭제 프로세스
	@RequestMapping("deleteForRoomProcess")
	public String manageRoom(int dorm_room_pk) {
		buildingService.deleteForRoomProcess(dorm_room_pk);
		return "redirect:./sj_manageRoomInfo";
	}
	
	//기숙사 호실 수정 페이지
	@RequestMapping("sj_editRoomInfo")
	public String editRoomPage(Model model, int dorm_room_pk) {
		
		model.addAttribute("editRooms", buildingService.printRooms(dorm_room_pk));
		model.addAttribute("dormBuilding", buildingService.dormBuildNames());

		return "tl_a/staff/sj_editRoomInfo";
	}
	
	@RequestMapping("editRoomProcess")
	public String editRoomProcess(DormRoomDto roomDto) {
		
//		로그확인용
//		System.out.println("------controller--------");
//	    System.out.println("DORM_PK: " + roomDto.getDorm_pk());
//	    System.out.println("roompk : "+roomDto.getDorm_room_pk());
//	    System.out.println("DORM_AMOUNT_PK: " + roomDto.getDorm_amount_pk());
//	    System.out.println("ROOM_NAME: " + roomDto.getRoom_name());
//	    System.out.println("GENDER: " + roomDto.getGender());
//	    System.out.println("DORM_FLOOR: " + roomDto.getDorm_floor());

		buildingService.updateForRoom(roomDto);
	
		
		return "redirect:./sj_manageRoomInfoReadPage?dorm_pk="+roomDto.getDorm_pk();
	}
	
//	이거 일괄 그거
//	@RequestMapping("deleteForRoomDatailProcess")
//	public String deleteForRoomDatailProcess(int dorm_amount) {
//		buildingService.deleteForRoomDetailImg(dorm_amount);
//		return "redirect:./sj_manageRoomImages";
//	}
	
	@RequestMapping("deleteForRoomDatailProcess")
	public String deleteForRoomDatailProcess(int dorm_amount_pk, DormCategoryDto categoryDto) {
		return "redirect:./sj_manageRoomImages";
	}
	
}
