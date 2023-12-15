package com.mkfactory.toothless.c.seoyoung.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.c.guntaek.service.GuntaekStudentServiceImpl;
import com.mkfactory.toothless.c.seoyoung.service.SeoyoungApplyingServicempl;
import com.mkfactory.toothless.c.woojae.service.WoojaeExternalServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@RestController
@RequestMapping("/tl_c/seoyoung/student/*")
public class SeoyoungApplyingRestController {

	@Autowired
	private SeoyoungApplyingServicempl seoyoungApplyingService;

	@Autowired
	private GuntaekStudentServiceImpl guntaekStudentService;

	@Autowired
	private WoojaeExternalServiceImpl woojaeExternalService;

	@RequestMapping("companyListBox")
	public RestResponseDto companyListBox() {

		RestResponseDto response = new RestResponseDto();
		response.setResult("success");

		response.setData(seoyoungApplyingService.applyCompanyList());

		return response;
	}

	@RequestMapping("companyListModal")
	public RestResponseDto companyListModal(int pk) {

		RestResponseDto response = new RestResponseDto();
		response.setResult("success");

		response.setData(seoyoungApplyingService.getApplyCompanyModal(pk));

		return response;
	}

	@RequestMapping("companyTF")
	public RestResponseDto companyTF(HttpSession session) {

		StudentInfoDto sessionStudentInfo = (StudentInfoDto) session.getAttribute("sessionStudentInfo");

		RestResponseDto response = new RestResponseDto();
		response.setResult("success");
		String tf = seoyoungApplyingService.applyTF(sessionStudentInfo.getStudent_pk());
		if (tf == null) {
			tf = "yes";
		}
		response.setData(tf);
		System.out.println(tf);
		return response;
	}

}
