package com.mkfactory.toothless.d.gw.company.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.CompanyManagerDto;
import com.mkfactory.toothless.d.dto.InterestCompanyDto;
import com.mkfactory.toothless.d.gw.company.service.CompanyServiceIpml;
import com.mkfactory.toothless.d.ny.posting.service.PostingServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_d/gw_company/*")
public class CompanyController {
	
	@Autowired
	private CompanyServiceIpml companyService;
	
	@Autowired
	private PostingServiceImpl postingService;
	
	// 기업 등록 페이지
		@RequestMapping("registerCompanyPage")
		public String registerCompanyPage(HttpSession session, Model model) {
			
			StaffInfoDto staffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
			
			if(staffInfo == null) {
				return "redirect:../../another/staff/loginPage";
				
			}
			
			model.addAttribute("comScaleList",companyService.getComScaleList());
			
			return "/tl_d/gw_company/registerCompanyPage";
		}
		
		@RequestMapping("registerCompanyProcess")
		public String registerCompanyProcess(CompanyDto companyDto, CompanyManagerDto companyManagerDto, ExternalInfoDto externalInfoDto) {
			companyService.companyRegister(companyDto, companyManagerDto, externalInfoDto);
			
			
			return"/tl_d/gw_company/registerCompanyComplete";
		}
		
	//기업관리 페이지
		
		@RequestMapping("companyManagementPage")
		public String companyManagementPage(HttpSession session, Model model) {
			
			StaffInfoDto staffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
			
			if(staffInfo == null) {
				return "redirect:../../another/staff/loginPage";
				
			}
			
			model.addAttribute("companyList", companyService.getCompanyList());
			
//			String searchQueryString = "";
//			
//			if(searchType != null && searchWord != null) {
//				searchQueryString += "&searchType=" + searchType;
//				searchQueryString += "&searchWord=" + searchWord;
//			}
//			
//			model.addAttribute("searchQueryString", searchQueryString);
//			
//			model.addAttribute("searchType", searchType);
//			model.addAttribute("searchWord", searchWord);
			
			return "/tl_d/gw_company/companyManagementPage";
		}
		
	//기업 상세정보 페이지
		@RequestMapping("companyViewDetailsPage")
		public String companyViewDetailsPage(HttpSession session, Model model, int com_pk) {
			
			StaffInfoDto staffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
			
			if(staffInfo == null) {
				return "redirect:../../another/staff/loginPage";
				
			}
			
			Map<String, Object> companyMap=companyService.getCompany(com_pk);
			
			model.addAttribute("companyMap",companyMap);
			
			return "/tl_d/gw_company/companyViewDetailsPage";
		}
		
	//가족기업으로 변환
		@RequestMapping("changeFamilyCompanyProcess")
		public String changeFamilyCompanyProcess(int com_pk) {
			
			companyService.changeFamilyCompany(com_pk);
			
			return "redirect:./companyViewDetailsPage?com_pk="+com_pk;
		}
		
	//가족기업을 일반기업으로 변환
		@RequestMapping("changeGeneralCompanyProcess")
		public String changeGeneralCompanyProcess(int com_pk) {
			
			companyService.changeGeneralCompany(com_pk);
			
			return "redirect:./companyViewDetailsPage?com_pk="+com_pk;
		}
		
	//기업, 담당자 정보 수정
		@RequestMapping("updateCompanyInfo")
		public String updateCompanyInfo(HttpSession session, Model model,int com_pk) {
			
			StaffInfoDto staffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
			
			if(staffInfo == null) {
				return "redirect:../../another/staff/loginPage";
				
			}
			
			model.addAttribute("companyMap",companyService.getCompany(com_pk));
			model.addAttribute("comScaleList",companyService.getComScaleList());
			
			return "/tl_d/gw_company/updateCompanyInfo";
		}
		
		@RequestMapping("updateCompanyInfoProcess")
		public String updateCompanyInfoProcess(CompanyDto companyDto, CompanyManagerDto companyManagerDto) {
			
			companyService.updateCompanyInfo(companyDto, companyManagerDto);
			
			return "redirect:./companyViewDetailsPage?com_pk="+companyDto.getCom_pk();
			
		}
		
		//기업정보 삭제
		@RequestMapping("deleteCompanyInfoProcess")
		public String deleteCompanyInfoProcess(int com_pk, int com_manager_pk, int external_pk) {
			
			companyService.deleteCompanyInfo(com_pk, com_manager_pk, external_pk);
			
			return "redirect:./companyManagementPage";
		}

		
		//학생이 보는 기업상세정보
		@RequestMapping("studentViewDetailCompanyPage")
		public String studentViewDetailCompanyPage(HttpSession session,Model model, int com_pk) {
			
			model.addAttribute("companyMap",companyService.getCompany(com_pk));
			model.addAttribute("companyPostingCount", postingService.getCompanyPostingCount(com_pk));
			model.addAttribute("companyPostingListForStudent", postingService.getCompanyPostingList(com_pk));
			
			model.addAttribute("companyTotalInterest", companyService.companyTotalInterest(com_pk));
			
			StudentInfoDto studentInfoDto=(StudentInfoDto)session.getAttribute("sessionStudentInfo");
			
			if(studentInfoDto !=null) {
				
				InterestCompanyDto interestCompanyDto=new InterestCompanyDto();
				
				interestCompanyDto.setCom_pk(com_pk);
				interestCompanyDto.setStudent_pk(studentInfoDto.getStudent_pk());
				
				int myInterestCompany=companyService.studentInterestCompany(interestCompanyDto);
				
				model.addAttribute("myInterestCompany",myInterestCompany);
				
			}
			
			return "/tl_d/gw_company/studentViewDetailCompanyPage";
		}
		
		
		//학생의 기업찜!!
		@RequestMapping("interestCompanyProcess")
		public String interestCompanyProcess(InterestCompanyDto interestCompanyDto) {
			companyService.insertInterestCompany(interestCompanyDto);
			
			return "redirect:./studentViewDetailCompanyPage?com_pk="+interestCompanyDto.getCom_pk();
		}
		
		//학생의 기업 찜 취소!!
		@RequestMapping("deleteInterestCompanyProcess")
		public String deleteInterestCompanyProcess(InterestCompanyDto interestCompanyDto) {
			companyService.deleteInterestCompany(interestCompanyDto);
			
			return "redirect:./studentViewDetailCompanyPage?com_pk="+interestCompanyDto.getCom_pk();
		}
		
		
		//기업에서 누가 자기네 회사 찜했나 볼 수 있게!!
		@RequestMapping("companyViewStudentInterestPage")
		public String companyViewStudentInterestPage(HttpSession session, Model model, int com_pk) {
			
			ExternalInfoDto externalInfo = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
			
			if(externalInfo == null) {
				return "redirect:../../another/external/loginPage";
				
			}
			
			model.addAttribute("company", companyService.getCompany(com_pk));
			model.addAttribute("studentInterestCompanyList", companyService.studentCompanyInterestList());
			
			return "/tl_d/gw_company/companyViewStudentInterestPage";
		}
		
		
		//학생용 학생이 찜한 기업 목록
		@RequestMapping("interestCompanyListForStudentPage")
		public String interestCompanyListForStudentPage(HttpSession session, Model model) {
			StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
			
			if(studentInfoDto == null) {
				return "redirect:../../another/student/loginPage";
				
			}
			
			if(studentInfoDto != null) {
				
				model.addAttribute("studentInterestCompanyList", companyService.studentCompanyInterestList());
			}
			
			
			return "/tl_d/gw_company/interestCompanyListForStudentPage";
		}
		
		
		//확인용기업관리 페이지
		
		@RequestMapping("checkCompanyManagementPage")
		public String checkCompanyManagementPage(Model model) {
			
			model.addAttribute("companyList", companyService.getCompanyList());
			
			return "/tl_d/gw_company/checkCompanyManagementPage";
		}
		
}
