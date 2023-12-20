package com.mkfactory.toothless.a.student.jw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.a.dto.ExecutiveDto;
import com.mkfactory.toothless.a.student.jw.service.DormStudentServiceJw;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@RestController
@RequestMapping("/tl_a/student/*")
public class RestDormStudentControllerJw {
	
	@Autowired
	public DormStudentServiceJw dormStudentServiceJw;
	
	@RequestMapping("templete")
	public RestResponseDto templete() {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	@RequestMapping("threeList")
	public RestResponseDto threeList() {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		
		RestResponseDto restResponseDto = new RestResponseDto();
		
	
		restResponseDto.setData(dormStudentServiceJw.resentBoardthree());
		restResponseDto.setResult("success");
		
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}
	
	@RequestMapping("restExecutiveManagementList")
	public RestResponseDto restExecutiveManagementList(HttpSession session) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int studentPk = studentInfoDto.getStudent_pk();
		ExecutiveDto executiveDto = dormStudentServiceJw.getExecutiveInfoByStudentPk(studentPk);
		int executivePk = executiveDto.getExecutive_pk();
		
		restResponseDto.setData(dormStudentServiceJw.getExecutiveManagementList(executivePk));
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	@RequestMapping("restRegisterCallAbsence")
	public RestResponseDto restRegisterCallAbsence(int executive_management_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		dormStudentServiceJw.registerCallAbsence(executive_management_pk);
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	@RequestMapping("restDeleteCallAbsence")
	public RestResponseDto restDeleteCallAbsence(int executive_management_pk) {
		RestResponseDto restResponseDto = new RestResponseDto();
		
		dormStudentServiceJw.deleteCallAbsence(executive_management_pk);
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
}
