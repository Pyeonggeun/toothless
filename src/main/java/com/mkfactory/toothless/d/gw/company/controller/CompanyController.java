package com.mkfactory.toothless.d.gw.company.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.CompanyManagerDto;
import com.mkfactory.toothless.d.gw.company.service.CompanyServiceIpml;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;

@Controller
@RequestMapping("/tl_d/gw_company/*")
public class CompanyController {
	
	@Autowired
	private CompanyServiceIpml companyService;
	
	// 기업 등록 페이지
		@RequestMapping("registerCompanyPage")
		public String registerCompanyPage(Model model) {
			
			model.addAttribute("comScaleList",companyService.getComScaleList());
			
			return "/tl_d/gw_company/registerCompanyPage";
		}
		
		@RequestMapping("registerCompanyProcess")
		public String registerCompanyProcess(CompanyDto companyDto, CompanyManagerDto companyManagerDto, ExternalInfoDto externalInfoDto) {
			companyService.companyRegister(companyDto, companyManagerDto, externalInfoDto);
			
			System.out.println("입력완료");
			
			return"/tl_d/gw_company/registerCompanyComplete";
		}
		
	//기업관리 페이지
		
		@RequestMapping("companyManagementPage")
		public String companyManagementPage(Model model) {
			
			model.addAttribute("companyList", companyService.getCompanyList());
			
			return "/tl_d/gw_company/companyManagementPage";
		}
		
	//기업 상세정보 페이지
		@RequestMapping("companyViewDetailsPage")
		public String companyViewDetailsPage(Model model, int companyPK) {
			
			Map<String, Object> companyMap=companyService.getCompany(companyPK);
			
			model.addAttribute("companyMap",companyMap);
			
			return "/tl_d/gw_company/companyViewDetailsPage";
		}
		
	//가족기업으로 변환
		@RequestMapping("changeFamilyCompanyProcess")
		public String changeFamilyCompanyProcess(int companyPK) {
			
			companyService.changeFamilyCompany(companyPK);
			
			return "redirect:./companyViewDetailsPage?companyPK="+companyPK;
		}
		
	//가족기업을 일반기업으로 변환
		@RequestMapping("changeGeneralCompanyProcess")
		public String changeGeneralCompanyProcess(int companyPK) {
			
			companyService.changeGeneralCompany(companyPK);
			
			return "redirect:./companyViewDetailsPage?companyPK="+companyPK;
		}
		
	//기업, 담당자 정보 수정
		@RequestMapping("updateCompanyInfo")
		public String updateCompanyInfo(Model model,int companyPK) {
			
			model.addAttribute("companyMap",companyService.getCompany(companyPK));
			model.addAttribute("comScaleList",companyService.getComScaleList());
			
			return "/tl_d/gw_company/updateCompanyInfo";
		}
		
		@RequestMapping("updateCompanyInfoProcess")
		public String updateCompanyInfoProcess(CompanyDto companyDto, CompanyManagerDto companyManagerDto) {
			
			companyService.updateCompanyInfo(companyDto, companyManagerDto);
			
			return "redirect:./companyViewDetailsPage?companyPK="+companyDto.getCom_pk();
			
		}
		
		//기업정보 삭제
		@RequestMapping("deleteCompanyInfoProcess")
		public String deleteCompanyInfoProcess(int com_pk, int com_manager_pk, int external_pk) {
			
			companyService.deleteCompanyInfo(com_pk, com_manager_pk, external_pk);
			
			return "redirect:./companyManagementPage";
		}

}
