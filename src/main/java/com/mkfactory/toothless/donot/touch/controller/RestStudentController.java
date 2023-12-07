package com.mkfactory.toothless.donot.touch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.NotificationDto;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.donot.touch.mapper.StudentSqlMapper;
import com.mkfactory.toothless.donot.touch.service.StudentServiceImpl;

@RestController
@RequestMapping("/another/student/*")
public class RestStudentController {
	@Autowired
	private StudentServiceImpl studentService;
	
	@RequestMapping("reloadMyNotifyCount")
	public RestResponseDto reloadMyNotifyCount(int student_pk) {
		RestResponseDto responseDto = new RestResponseDto();
		int notifyCount = studentService.getMyNotifyCount(student_pk);
		
		responseDto.setData(notifyCount);
		responseDto.setResult("success");
		
		return responseDto;
		
	}
	@RequestMapping("loadUnreadNotifyList")
	public RestResponseDto loadUnreadNotifyList(int student_pk) {
		RestResponseDto responseDto = new RestResponseDto();
		List<NotificationDto> list = studentService.getUnreadMyNotifyList(student_pk);
		
		responseDto.setData(list);
		responseDto.setResult("success");
		
		return responseDto;
	}
	@RequestMapping("updateReadNotifyStatus")
	public void updateReadNotifyStatus(int student_pk) {
		studentService.updateReadNotifyList(student_pk);
	}
	@RequestMapping("loadReadNotifyList")
	public RestResponseDto loadReadNotifyList(int student_pk) {
		RestResponseDto responseDto = new RestResponseDto();
		List<NotificationDto> list = studentService.getReadMyNotifyList(student_pk);
		
		responseDto.setData(list);
		responseDto.setResult("success");
		
		return responseDto ;
	}
	
	@RequestMapping("reloadMyNewNotifyList")
	public RestResponseDto reloadMyNewNotifyList(int student_pk) {
		RestResponseDto responseDto = new RestResponseDto();
		List<NotificationDto> list = studentService.getNewNotifyList(student_pk);
		
		responseDto.setData(list);
		responseDto.setResult("success");
		
		return responseDto;
		
	}
	@RequestMapping("updateNewNotifyStatus")
	public void updateNewNotifyStatus(int student_pk) {
		studentService.updateNewNotifyStatus(student_pk);
	}

	
	
		
}
