 package com.mkfactory.toothless.b.ty.staffboard.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.b.dto.StudentboardDto;
import com.mkfactory.toothless.b.dto.StudentboardImageDto;
import com.mkfactory.toothless.b.dto.StudentboardLikeDto;
import com.mkfactory.toothless.b.dto.StudentboardReplyDto;
import com.mkfactory.toothless.b.kh.medicine.service.MedicineServiceImpl;
import com.mkfactory.toothless.b.ty.staffboard.service.StaffBoardServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_b/ty/*")
public class StaffBoardController {

	@Autowired
	private StaffBoardServiceImpl staffBoardService;
	@RequestMapping("staffBoardImgPage")
	public String staffBoardImgPage(Model model, StudentboardLikeDto likeDto, StudentboardDto params,HttpSession session,
			   String searchType,
			   String searchWord
				) {
		StaffInfoDto sessionStaffInfo =(StaffInfoDto) session.getAttribute("sessionStaffInfo");
		int staffPk = sessionStaffInfo.getStaff_pk(); 
		params.setStaff_pk(staffPk);
		
		int total = staffBoardService.totalList(params);
		int aa = staffBoardService.upAndDownCount(likeDto);
		
		List<Map<String, Object>>list=staffBoardService.boardNoticeList(searchType, searchWord);
		List<Map<String, Object>>readList = staffBoardService.bestRead();
		
		
		model.addAttribute("aa" , aa);
		model.addAttribute("noticeList", list);
		model.addAttribute("total", total);
		model.addAttribute("readList", readList);
		
		return "tl_b/ty/staffBoardImgPage";
		
		
	}
	
	@RequestMapping("staffBoardPage")
	public String staffBoardPage(Model model, StudentboardLikeDto likeDto, StudentboardDto params,HttpSession session,
			   String searchType,
			   String searchWord
				){
		

		StaffInfoDto sessionStaffInfo =(StaffInfoDto) session.getAttribute("sessionStaffInfo");
		int staffPk = sessionStaffInfo.getStaff_pk(); 
		params.setStaff_pk(staffPk);
		
		int total = staffBoardService.totalList(params);
		int aa = staffBoardService.upAndDownCount(likeDto);
		
		List<Map<String, Object>>list=staffBoardService.boardNoticeList(searchType, searchWord);
		List<Map<String, Object>>readList = staffBoardService.bestRead();
		
		
		model.addAttribute("aa" , aa);
		model.addAttribute("noticeList", list);
		model.addAttribute("total", total);
		model.addAttribute("readList", readList);
		
		return "tl_b/ty/staffBoardPage";
	}
	
	@RequestMapping("staffWriteBoardPage")
	public String staffWriteBoardPage(StudentboardDto params) {
		return"tl_b/ty/staffWriteBoardPage";
	}
	@RequestMapping("staffWriteProcess")
	public String staffWriteProcess(HttpSession session, StudentboardDto params, MultipartFile imageFile, MultipartFile[] imageFiles ) {
		List<StudentboardImageDto> boardImageDtoList = new ArrayList<>();
		if(imageFile != null) {
			
			// 경로 수정
			String rootPath = "C:/uploadFiles/mainImage/";
			
	         
	         File FolderForCreate = new File(rootPath);
	         if(!FolderForCreate.exists()) {
	        	 FolderForCreate.mkdirs();
	         }
	         
	         String originalFileName = imageFile.getOriginalFilename();
	         
	         String uuid = UUID.randomUUID().toString();
	         long currentTime = System.currentTimeMillis();
	         String fileName = uuid + "_" + currentTime;
	         
	         // 확장자 추출
	         String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
	         
	         fileName += ext;
	         
	         try {
	        	 imageFile.transferTo(new File(rootPath + fileName));
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         
	         params.setImg_link(fileName);
	         
	         
		}
		
		//파일 저장 로직
		  if(imageFiles != null) { 
			  for(MultipartFile multipartFile : imageFiles) {
				  if(multipartFile.isEmpty()) {
					  continue; 
					}
				  
				  String rootPath = "C:/uploadFiles/mainImage/";
				  

				  File FolderForCreate = new File(rootPath);
				  
				  if(!FolderForCreate.exists()) {
					  FolderForCreate.mkdirs();
				  }
				  String originalFileName = multipartFile.getOriginalFilename();
				  
				  //파일명 충돌 회피 - 랜덤, 시간 조합
				  String uuid = UUID.randomUUID().toString();
				  long currentTime = System.currentTimeMillis();
				  String fileName = uuid + "_" + currentTime;
				  
				  //확장자 추출
				  String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				  fileName += ext;
				  
				  try {
					  multipartFile.transferTo(new File(rootPath + fileName));  
				  }catch(Exception e) { 
					e.printStackTrace();  
				  }
				  StudentboardImageDto boardImageDto = new  StudentboardImageDto();
				  boardImageDto.setImg_link(fileName);
				  
				  boardImageDtoList.add(boardImageDto);
				  
			  	}
			  }
		 
			
			StaffInfoDto sessionStaffInfo =(StaffInfoDto) session.getAttribute("sessionStaffInfo");
			int staffPk = sessionStaffInfo.getStaff_pk();
			params.setStaff_pk(staffPk);
			
			staffBoardService.staffWrite(params, boardImageDtoList);
			
			
		return"redirect:./staffBoardPage";
	}
	@RequestMapping("staffBoardReadPage")
	public String staffBoardReadPage(Model model, int id, StudentboardDto params, HttpSession session) {
		staffBoardService.increaseCount(id);
		
		StaffInfoDto sessionStaffInfo =(StaffInfoDto) session.getAttribute("sessionStaffInfo");
		int staffPk = sessionStaffInfo.getStaff_pk();
		params.setStaff_pk(staffPk);
		
		List<Map<String, Object>>readList = staffBoardService.bestRead();
		List<Map<String, Object>> list = staffBoardService.replyList(id);
		Map<String, Object> map = staffBoardService.viewDtls(id);

		model.addAttribute("read", map);
		model.addAttribute("reply", list);
		model.addAttribute("readList", readList);
		
		int likeCount = staffBoardService.likeCount(id);
		model.addAttribute("likeCount", likeCount);
		
		int replyCount = staffBoardService.replyCount(id);
		System.out.println(replyCount);
		model.addAttribute("replyCount", replyCount);
		
		return"tl_b/ty/staffBoardReadPage";
	}
	@RequestMapping("noticeDeleteProcess")
	public String noticeDeleteProcess(int id) {
		staffBoardService.delete(id);
		return"redirect:./staffBoardPage";
	}
	@RequestMapping("noticeUpdatePage")
	public String noticeUpdatePage(Model model, int id) {
		Map<String, Object> map = staffBoardService.viewDtls(id);
		model.addAttribute("update",map);
		return"tl_b/ty/noticeUpdatePage";
	}
	@RequestMapping("noticeUpdateProcess")
	public String noticeUpdateProcess(StudentboardDto params, HttpSession session,MultipartFile imageFile, MultipartFile[] imageFiles) {
		staffBoardService.update(params);
		
		List<StudentboardImageDto> boardImageDtoList = new ArrayList<>();
		if(imageFile != null) {
			// 경로 수정
			String rootPath = "C:/uploadFiles/mainImage/";
			
	         
	         File FolderForCreate = new File(rootPath);
	         if(!FolderForCreate.exists()) {
	        	 FolderForCreate.mkdirs();
	         }
	         
	         String originalFileName = imageFile.getOriginalFilename();
	         
	         String uuid = UUID.randomUUID().toString();
	         long currentTime = System.currentTimeMillis();
	         String fileName = uuid + "_" + currentTime;
	         
	         // 확장자 추출
	         String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
	         
	         fileName += ext;
	         
	         try {
	        	 imageFile.transferTo(new File(rootPath + fileName));
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         
	         params.setImg_link(fileName);
	         
	         
		}
		
		//파일 저장 로직
		  if(imageFiles != null) { 
			  for(MultipartFile multipartFile : imageFiles) {
				  if(multipartFile.isEmpty()) {
					  continue; 
					}
				  
				  String rootPath = "C:/uploadFiles/mainImage/";
				  

				  File FolderForCreate = new File(rootPath);
				  
				  if(!FolderForCreate.exists()) {
					  FolderForCreate.mkdirs();
				  }
				  String originalFileName = multipartFile.getOriginalFilename();
				  
				  //파일명 충돌 회피 - 랜덤, 시간 조합
				  String uuid = UUID.randomUUID().toString();
				  long currentTime = System.currentTimeMillis();
				  String fileName = uuid + "_" + currentTime;
				  
				  //확장자 추출
				  String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				  fileName += ext;
				  
				  try {
					  multipartFile.transferTo(new File(rootPath + fileName));  
				  }catch(Exception e) { 
					e.printStackTrace();  
				  }
				  StudentboardImageDto boardImageDto = new  StudentboardImageDto();
				  boardImageDto.setImg_link(fileName);
				  
				  boardImageDtoList.add(boardImageDto);
				  
			  	}
			  }
		 
			
			StaffInfoDto sessionStaffInfo =(StaffInfoDto) session.getAttribute("sessionStaffInfo");
			int staffPk = sessionStaffInfo.getStaff_pk();
			params.setStaff_pk(staffPk);
			
			staffBoardService.staffWrite(params, boardImageDtoList);
		
		
		return"redirect:./staffBoardReadPage?id="+params.getStudentboard_pk();
	}
	@RequestMapping("replyProcess")
	public String replyProcess (HttpSession session, StudentboardReplyDto params) {
		StaffInfoDto sessionStaffInfo =(StaffInfoDto) session.getAttribute("sessionStaffInfo");
		int staffPk = sessionStaffInfo.getStaff_pk();
		params.setStaff_pk(staffPk);
		
		staffBoardService.boardReplay(params);
		return"redirect:./staffBoardReadPage?id="+params.getStudentboard_pk();
	}
	@RequestMapping("replyDeleteProcess")
	public String replyDeleteProcess(int id, int deleteId, int boardPk) {
		staffBoardService.deleteBoardReply(id);
		return"redirect:./staffBoardReadPage?id="+boardPk;
	}
	
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect:./staffBoardPage";
	}	
}