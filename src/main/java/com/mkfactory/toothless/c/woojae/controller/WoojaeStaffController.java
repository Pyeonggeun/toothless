package com.mkfactory.toothless.c.woojae.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksCompanyCategoryDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.woojae.service.WoojaeStaffServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Controller
@RequestMapping("/tl_c/woojae/staff/*")
public class WoojaeStaffController {
	
	@Autowired
	private WoojaeStaffServiceImpl woojaeStaffService;
	
	// 교직원 로그인 하면 뜨는 첫 메인페이지
	@RequestMapping("ajdksStaffMainPage")
	public String ajdksStaffMainPage() {
		
		
		return"tl_c/woojae/staff/ajdksStaffMainPage";
	}
	
	// 교직원 로그아웃
	@RequestMapping("ajdksStaffLogoutProcess")
	public String ajdksStaffLogoutProcess(HttpSession session) {
		
		session.invalidate();
		
		return"redirect:../../../another/staff/loginPage";
	}
	
	// 산업체 등록 페이지
	@RequestMapping("ajdksRegisterCompanyPage")
	public String ajdksRegisterCompanyPage(HttpSession session, Model model) {
		
		StaffInfoDto sessionStaffInfo = (StaffInfoDto) session.getAttribute("sessionStaffInfo");
		model.addAttribute("sessionStaffInfo", sessionStaffInfo);
		
		List<AjdksCompanyCategoryDto> list = woojaeStaffService.companyCategoryList();
		model.addAttribute("list", list);
		
		return"tl_c/woojae/staff/ajdksRegisterCompanyPage";
	}
	
	// 산업체 등록내역
	@RequestMapping("ajdksRegistedCompanyPage")
	public String ajdksRegistedCompanyPage(Model model, int company_category_pk) {
		
		// 카테고리 리스트
		List<AjdksCompanyCategoryDto> list = woojaeStaffService.companyCategoryList();
		model.addAttribute("categoryList", list);
		
		// 전체 리스트
		List<Map<String,Object>> registedCompanyList = woojaeStaffService.registedCompanyList();
		model.addAttribute("registedCompanyList", registedCompanyList);
		
		// 카테고리별 리스트
		List<Map<String, Object>> companyListByCategoryPk = woojaeStaffService.getCompanyListByCategoryPk(company_category_pk);
		model.addAttribute("getCompanyListByCategoryPk", companyListByCategoryPk);
		
		
		
		return"tl_c/woojae/staff/ajdksRegistedCompanyPage";
	}
		
	// 산업체 등록
	@RequestMapping("registerCompanyProcess")
	public String registerCompanyProcess(AjdksCompanyInfoDto ajdksCompanyInfoDto, ExternalInfoDto externalInfoDto) {
		
		//woojaeStaffService.registerCompanyInfo(ajdksCompanyInfoDto, externalInfoDto);
		
		return"redirect:./ajdksStaffMainPage";
	}
	
	
	// 체크박스용 리스트페이지
	
	@RequestMapping("ajdksRegistedCompanyPage2")
	public String ajdksRegistedCompanyPage2(
			Model model,
			int[] searchType,
			String searchWord
			) {
		// 카테고리 리스트
		List<AjdksCompanyCategoryDto> list = woojaeStaffService.companyCategoryList();
		model.addAttribute("categoryList", list);
		
		// 전체 리스트
		List<Map<String,Object>> registedCompanyList = woojaeStaffService.registedCompanyList();
		model.addAttribute("registedCompanyList", registedCompanyList);
		
		model.addAttribute("catSearch", woojaeStaffService.categorizedCompanyList(searchType, searchWord));
		
		return"tl_c/woojae/staff/ajdksRegistedCompanyPage2";
	}
	
	//공지사항
	@RequestMapping("ajdksStaffNoticePage")
	public String ajdksStaffNoticePage() {
		
		return"tl_c/woojae/staff/ajdksStaffNoticePage";
	}

}
