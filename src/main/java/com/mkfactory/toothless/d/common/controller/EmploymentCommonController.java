package com.mkfactory.toothless.d.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.ny.posting.service.PostingServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_d/common/*")
public class EmploymentCommonController {

	
	@Autowired
	private PostingServiceImpl postingService;

	
	// 학생용 마이페이지
	@RequestMapping("studentMyPage")
	public String studentMyPage(HttpSession session, Model model) {
			
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto != null) {
			int studentPk = studentInfoDto.getStudent_pk();
			model.addAttribute("interestpostingForMyPage", postingService.getInterestPostingListForMyPage(studentPk));
		}
		
		
		return "tl_d/common/studentMyPage";
	}
	
	// 취창업 메인 페이지
	@RequestMapping("employMainPage")
	public String employMainPage() {
		return "tl_d/common/employMainPage";
	}
	
	
	
	
	// 기업용 메인 페이지
	@RequestMapping("companyMainPage")
	public String companyMainPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		
		if(externalInfoDto != null) {
			int externalPk = externalInfoDto.getExternal_pk();
			
			CompanyDto companyDto = postingService.getCompanyPkFromExternalPk(externalPk);
			model.addAttribute("jobPostingForCompanyMainPage", postingService.getPostingListForCompanyMainPage(companyDto.getCom_pk()));
			model.addAttribute("applyListForMainPage", postingService.getApplyListForCompanyMainPage(externalPk));
		}
		
		return "tl_d/common/companyMainPage";
	}
	
	
	//교직원 메인페이지
	@RequestMapping("staffMainPage")
	public String staffMainPage() {
		return "tl_d/common/staffMainPage";
	}

}
