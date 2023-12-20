package com.mkfactory.toothless.b.hs.edu.controller;

import java.io.File;
import java.text.SimpleDateFormat;
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

import com.mkfactory.toothless.b.dto.EduApplyDto;
import com.mkfactory.toothless.b.dto.EduDto;
import com.mkfactory.toothless.b.hs.edu.service.EduStaffServiceimpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Controller
@RequestMapping("/tl_b/hs/*")
public class EduStaffController {
	
	@Autowired
	EduStaffServiceimpl eduStaffService; 
	//교육 메인
	@RequestMapping("eduMainPageForStaff")
	public String eduMainPageForStaff(Model model) {
		
		List<Map<String, Object>> progListMain = eduStaffService.getProgListMain();
		List<Map<String, Object>> applyListMain = eduStaffService.getApplyListMain();
		List<Map<String, Object>> serveyListMain = eduStaffService.getServeyListMain();
		

		model.addAttribute("progListMain", progListMain);
		model.addAttribute("applyListMain", applyListMain);
		model.addAttribute("serveyListMain", serveyListMain);
		
		return "tl_b/hs/eduMainPageForStaff";
	}
	
	//프로그램 목록페이지
	@RequestMapping("eduProgListPage")
	public String eduProgListPage(Model model,
			String searchType,
			String searchWord) {
		
		List<Map<String, Object>> list = eduStaffService.getEduProgList(searchType, searchWord);
		
		model.addAttribute("list", list);
		
		
		return "tl_b/hs/eduProgListPage";
	}
	
	//신청현황 페이지
	@RequestMapping("eduApplyListPage")
	public String eduApplyListPage(Model model,
			String searchType,
			String searchWord) {
		
		List<Map<String, Object>> eduApplyList = eduStaffService.getEduApplyList(searchType, searchWord);
		
		model.addAttribute("eduApplyList", eduApplyList);
		
		
		return "tl_b/hs/eduApplyListPage";
	}
	//만족도 현황 페이지
	@RequestMapping("eduServeyListPage")
	public String eduServeyListPage(Model model,
			String searchType,
			String searchWord) {
		
		List<Map<String, Object>> allServeyList = eduStaffService.getAllServeyList(searchType, searchWord);
		
		model.addAttribute("allServeyList", allServeyList);
		
		
		return "tl_b/hs/eduServeyListPage";
	}
	
	
	
	
	//프로그램 등록 페이지
	@RequestMapping("eduProgRegisterPage")
	public String eduProgRegisterPage(HttpSession session) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		if(sessionStaffInfo == null) {
			
			return "redirect:../../another/staff/loginPage";
		}
		
		
		return "tl_b/hs/eduProgRegisterPage";
	}
	//프로그램 등록프로세스
	@RequestMapping("eduProgRegisterProcess")
	public String eduProgRegisterProcess(HttpSession session, EduDto eduDto, MultipartFile eduImage) {
		
		if(eduImage != null) {
			String rootPath = "C:\\workspace\\GitWorkSpace\\toothless\\src\\main\\webapp\\resources\\img\\healthRoom\\edu\\";
			
			// 날짜별 폴더 생성
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
	         // 아래 new Date는 현재 날짜 반환 format으로 문자로 반환
	         String todayPath = sdf.format(new Date());
	         
	         File todayFolderForCreate = new File(rootPath + todayPath);
	         if(!todayFolderForCreate.exists()) {
	            todayFolderForCreate.mkdirs();
	         }
	         
	         String originalFileName = eduImage.getOriginalFilename();
	         
	         String uuid = UUID.randomUUID().toString();
	         long currentTime = System.currentTimeMillis();
	         String fileName = uuid + "_" + currentTime;
	         
	         // 확장자 추출
	         String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
	         
	         fileName += ext;
	         
	         try {
	        	 eduImage.transferTo(new File(rootPath + todayPath + fileName));
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         
	         eduDto.setImg_link(todayPath + fileName);   
	         
		}
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		int staffPk = sessionStaffInfo.getStaff_pk();
		
		
		eduDto.setStaff_pk(staffPk);
		
		eduStaffService.eduProgRegister(eduDto);
		
		
		
		return "redirect:./eduMainPageForStaff";
	}
	
	//상세 글 보기
	@RequestMapping("readEduProgPage")
	public String readEduProgPage(Model model, EduApplyDto eduApplyDto) {
		
		Map<String, Object> map = eduStaffService.getEduProg(eduApplyDto);
		
		model.addAttribute("qwer", map);
		
		return "tl_b/hs/readEduProgPage";
	}
	
	//교육프로그램 정보 수정
	@RequestMapping("updateEduProgPage")
	public String updateEduProgPage(Model model,EduApplyDto eduApplyDto, HttpSession session) {
		
		model.addAttribute("update", eduStaffService.getEduProg(eduApplyDto));
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		if(sessionStaffInfo == null) {
			
			return "redirect:../../another/staff/loginPage";
		}
		
		
		return "tl_b/hs/updateEduProgPage";
	}
	
	@RequestMapping("updateEduProgProcess")
	public String updateEduProgProcess(EduDto params) {
		
		eduStaffService.updateEduProg(params);
		
		return "redirect:./readEduProgPage?edu_pk=" + params.getEdu_pk();
	}
	
	//삭제
	@RequestMapping("deleteEduProgProcess")
	public String deleteEduProgProcess(int edu_pk) {
		eduStaffService.deleteEduProg(edu_pk);
		return "redirect:./eduMainPageForStaff";
	}
	
	//상태 바꾸기(교직원)
	@RequestMapping("updateStatusYProcess")
	public String updateStatusYProcess(int edu_apply_pk) {
		eduStaffService.updateStatusY(edu_apply_pk);
		return "redirect:./eduMainPageForStaff";
	}
	@RequestMapping("updateStatusNProcess")
	public String updateStatusNProcess(int edu_apply_pk) {
		eduStaffService.updateStatusN(edu_apply_pk);
		return "redirect:./eduMainPageForStaff";
	}
	
	
	
	
}
