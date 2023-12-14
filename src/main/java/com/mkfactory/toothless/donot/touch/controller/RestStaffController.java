package com.mkfactory.toothless.donot.touch.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.service.StaffServiceImpl;

@RestController
@RequestMapping("/another/staff/*")
public class RestStaffController {
	@Autowired
	private StaffServiceImpl staffService;
	
	@RequestMapping("existsStudentId")
	public RestResponseDto existsStudentId(String student_id) {
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(staffService.checkStudentId(student_id));
		
		return responseDto;
		
	}
	@RequestMapping("existsStaffId")
	public RestResponseDto existsStaffId(String staff_id) {
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(staffService.checkStaffId(staff_id));
		
		return responseDto;
	}
	@RequestMapping("existsProfessorId")
	public RestResponseDto existsProfessorId(String professor_id) {
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(staffService.checkProfessorId(professor_id));
		
		return responseDto;
		
	}
	
	@RequestMapping("getStudentInfoList")
	public RestResponseDto getStudentInfoList(int pageNum) {
		RestResponseDto responseDto = new RestResponseDto();
		
		List<Map<String, Object>> studentInfoList = staffService.getStudentList(pageNum);
		
		responseDto.setResult("success");
		responseDto.setData(studentInfoList);
		
		return responseDto;
		
	}
	@RequestMapping("getStudentTotalCount")
	public RestResponseDto getStudentTotalCount(int pageNum) {
		RestResponseDto responseDto = new RestResponseDto();
		
		
		
		List<Map<String, Object>> studentInfoList = staffService.getStudentList(pageNum);
		
		
		
		responseDto.setResult("success");
		responseDto.setData(studentInfoList);
		
		return responseDto;
		
	}
	@RequestMapping("studentRegisterProcess")
	public RestResponseDto studentRegisterProcess(StudentInfoDto studentInfoDto,
			int semester_count,
			@RequestParam(required = false, defaultValue="0")
			boolean graduation,
			double scoreAVG) {
		
		RestResponseDto responseDto = new RestResponseDto();
		staffService.insertStudentInfo(studentInfoDto, semester_count, graduation, scoreAVG);
		
		responseDto.setResult("success");
		
		return responseDto;
	}
	
	
}
