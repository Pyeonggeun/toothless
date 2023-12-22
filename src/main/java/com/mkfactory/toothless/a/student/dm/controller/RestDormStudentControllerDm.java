package com.mkfactory.toothless.a.student.dm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.a.student.dm.service.DormStudentServiceDm;
import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;

@RestController
@RequestMapping("/tl_a/student/*")
public class RestDormStudentControllerDm {
	
	@Autowired
	public DormStudentServiceDm dormStudentServiceDm;
	
	@RequestMapping("studentList")
	public RestResponseDto studentList(){
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.studentListAll());
		
		return responseDto;
	}
	
	@RequestMapping("studentInfoPk")
	public RestResponseDto studentInfoPk(int student_pk) {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.studentInfoByStudentPk(student_pk));
		
		return responseDto;
		
		
	}
	
	@RequestMapping("studentListCount")
	public RestResponseDto studentListCount() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.studentListCount());
		
		return responseDto;
		
		
	}
	
	@RequestMapping("assignListCount")
	public RestResponseDto assignListCount() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.assignPeopleCount());
		
		return responseDto;
		
		
	}
	
	@RequestMapping("assignNeedListCount")
	public RestResponseDto assignNeedListCount() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.assignPeopleNeedCount());
		
		return responseDto;
		
		
	}
	
	@RequestMapping("executiveListCount")
	public RestResponseDto executiveListCount() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.executiveCount());
		
		return responseDto;
		
		
	}
	
	@RequestMapping("todayDiaryCountList")
	public RestResponseDto todayDiaryCountList() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.diaryTodayCount());
		
		return responseDto;
		
		
	}
	
	@RequestMapping("todayOutingCountList")
	public RestResponseDto todayOutingCountList() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.todayOutingCount());
		
		return responseDto;
		
		
	}
	
	@RequestMapping("dongCountList")
	public RestResponseDto dongCountList() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.dongCount());
		
		return responseDto;
		
		
	}
	
	@RequestMapping("ingSemester")
	public RestResponseDto ingSemester() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.semesterName());
		
		return responseDto;
		
		
	}
	
	@RequestMapping("selectionStatusN")
	public RestResponseDto selectionStatusN() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.selectionStatusN());
		
		return responseDto;
		
		
	}
	
	@RequestMapping("unpaidPeople")
	public RestResponseDto unpaidPeople() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.unpaidCount());
		
		return responseDto;
		
		
	}
	
	@RequestMapping("pointListCount")
	public RestResponseDto pointListCount() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.pointListCount());
		
		return responseDto;
		
		
	}
	@RequestMapping("todayPointCreditCount")
	public RestResponseDto todayPointCreditCount() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.todayPointCreditCount());
		
		return responseDto;
	}
	@RequestMapping("roomCount")
	public RestResponseDto roomCount() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.roomCount());
		
		return responseDto;
	}
	@RequestMapping("noticeCount")
	public RestResponseDto noticeCount() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.noticeCount());
		
		return responseDto;
	}
	@RequestMapping("noticeRecentWriteTitle")
	public RestResponseDto noticeRecentWriteTitle() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.noticeRecentWriteTitle());
		
		return responseDto;
	}
	@RequestMapping("freeboardCount")
	public RestResponseDto freeboardCount() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.freeboardCount());
		
		return responseDto;
	}
	@RequestMapping("freeboardRecentWriteTitle")
	public RestResponseDto freeboardRecentWriteTitle() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.freeboardRecentWriteTitle());
		
		return responseDto;
	}
	@RequestMapping("requestCount")
	public RestResponseDto requestCount() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.requestCount());
		
		return responseDto;
	}
	@RequestMapping("todayRequestCount")
	public RestResponseDto todayRequestCount() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.todayRequestCount());
		
		return responseDto;
	}
	
	@RequestMapping("executiveList")
	public RestResponseDto executiveList() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.executiveList());
		
		return responseDto;
	}	
	
	@RequestMapping("dongHoList")
	public RestResponseDto dongHoList() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.dongHoList());
		
		return responseDto;
	}
	
	@RequestMapping("semesterAllList")
	public RestResponseDto semesterAllList() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.semesterAllList());
		
		return responseDto;
	}
	
	@RequestMapping("poingCategoryList")
	public RestResponseDto poingCategoryList() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.poingCategoryList());
		
		return responseDto;
	}
	
	@RequestMapping("dongHoAssignList")
	public RestResponseDto dongHoAssignList() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.dongHoAssignList());
		
		return responseDto;
	}
	@RequestMapping("noticeAllList")
	public RestResponseDto noticeAllList() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.noticeAllList());
		
		return responseDto;
	}
	@RequestMapping("freeboardAllList")
	public RestResponseDto freeboardAllList() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.freeboardAllList());
		
		return responseDto;
	}
	@RequestMapping("repaireRequestAllList")
	public RestResponseDto repaireRequestAllList() {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		responseDto.setResult("success");
		responseDto.setData(dormStudentServiceDm.repaireRequestAllList());
		
		return responseDto;
	}
	
	
	
	
	
	
	
	
}
