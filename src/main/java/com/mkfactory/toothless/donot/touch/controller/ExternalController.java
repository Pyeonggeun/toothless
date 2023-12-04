package com.mkfactory.toothless.donot.touch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.service.ExternalServiceImpl;

@Controller
@RequestMapping("/another/external/*")
public class ExternalController {
	@Autowired
	private ExternalServiceImpl externalService;
	
	@RequestMapping("loginPage")
	public String loginPage() {
		
		
		
		return "another/external/loginPage";
	}
		
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, ExternalInfoDto params) {
		
		ExternalInfoDto externalInfoDto = externalService.loginByExternalIdAndPassword(params);
		
		
		if( externalInfoDto == null ) {
			return "rediract: ./loginPage";
		}
		session.setAttribute("sessionExternalInfo", externalInfoDto);
		if(externalInfoDto.getExternal_category() == 1) {
				
			return "redirect: ./mainPage";
		
		}else if(externalInfoDto.getExternal_category() == 2) {
				
			return "redirect: ./mainPage";
			
		}else if(externalInfoDto.getExternal_category() == 3){
			
			return "redirect: ../../tl_e/commons/counselorCounselMainPage";
			
		}else {
			
			return "redirect: ./loginPage";
		}
			
	}
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
	
		session.invalidate();
		
		return "redirect: ./loginPage";
	}
	
	@RequestMapping("mainPage")
	public String mainPage() {
		
	
		
		return "another/external/mainPage";
	}
}
