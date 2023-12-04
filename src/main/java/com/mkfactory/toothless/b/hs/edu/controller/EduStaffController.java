package com.mkfactory.toothless.b.hs.edu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		List<Map<String, Object>> list = eduStaffService.getEduProgList();
		

		model.addAttribute("list", list);
		
		return "tl_b/hs/eduMainPageForStaff";
	}
	
	//프로그램 등록 페이지
	@RequestMapping("eduProgRegisterPage")
	public String eduProgRegisterPage() {
		return "tl_b/hs/eduProgRegisterPage";
	}
	//프로그램 등록프로세스
	@RequestMapping("eduProgRegisterProcess")
	public String eduProgRegisterProcess(HttpSession session, EduDto eduDto) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		int staffPk = sessionStaffInfo.getStaff_pk();
	
		eduDto.setStaff_pk(staffPk);
		
		eduStaffService.eduProgRegister(eduDto);
		
		return "redirect:./eduMainPageForStaff";
	}
	
	//상세 글 보기
	@RequestMapping("readEduProgPage")
	public String readEduProgPage(Model model, int edu_pk) {
		
		Map<String, Object> map = eduStaffService.getEduProg(edu_pk);
		
		model.addAttribute("qwer", map);
		
		return "tl_b/hs/readEduProgPage";
	}
	
	//교육프로그램 정보 수정
	@RequestMapping("updateEduProgPage")
	public String updateEduProgPage(Model model, int edu_pk) {
		
		model.addAttribute("update", eduStaffService.getEduProg(edu_pk));
		
		return "tl_b/hs/updateEduProgPage";
	}
	
	@RequestMapping("updateEduProgProcess")
	public String updateEduProgProcess(EduDto params) {
		
		eduStaffService.updateEduProg(params);
		
		System.out.println(params.getEdu_pk());
		
		return "redirect:./readEduProgPage?edu_pk=" + params.getEdu_pk();
	}
	
	//삭제
	@RequestMapping("deleteEduProgProcess")
	public String deleteEduProgProcess(int edu_pk) {
		eduStaffService.deleteEduProg(edu_pk);
		return "redirect:./eduMainPageForStaff";
	}
	
	
	
	
	
}
