package com.mkfactory.toothless.x.ic.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.RestResponseDto;
import com.mkfactory.toothless.x.dto.AttendanceBookDto;
import com.mkfactory.toothless.x.dto.AttendanceStatusDto;
import com.mkfactory.toothless.x.dto.LectureTestDto;
import com.mkfactory.toothless.x.dto.LifeLecturerDto;
import com.mkfactory.toothless.x.dto.QuestionChoiceDto;
import com.mkfactory.toothless.x.dto.TestQuestionDto;
import com.mkfactory.toothless.x.ic.service.LifeLecturerServiceImpl;

@RestController
@RequestMapping("/tl_x/ic/*")
public class RestLifeLecutrerController {
	@Autowired
	LifeLecturerServiceImpl lifeLecturerService;
	
	@RequestMapping("getMyInfo")
	public RestResponseDto getMyInfo(int external_pk) {
		RestResponseDto responseDto = new RestResponseDto();
		
		
		LifeLecturerDto lifeLecturerDto = lifeLecturerService.getLecturerInfo(external_pk);
		
		responseDto.setResult("success");
		responseDto.setData(lifeLecturerDto);
		
		return responseDto;
	}
	@RequestMapping("loadMylecture")
	public RestResponseDto loadMylecture(int lecturer_key) {
		RestResponseDto responseDto = new RestResponseDto();
		
		List<Map<String, Object>> list = lifeLecturerService.getMyLecutre(lecturer_key);
		
		responseDto.setResult("success");
		responseDto.setData(list);
		
		return responseDto;
	}
	
	@RequestMapping("lectureStudentList")
	public RestResponseDto lectureStudentList(int open_lecture_key) {
		RestResponseDto responseDto = new RestResponseDto();
		
		List<Map<String, Object>> list = lifeLecturerService.getLectureStudentList(open_lecture_key);
		
		responseDto.setResult("success");
		responseDto.setData(list);
		
		return responseDto;
	}
	@RequestMapping("checkAttendanceBookLoad")
	public RestResponseDto checkAttendanceBookLoad(String date_created) {
		RestResponseDto responseDto = new RestResponseDto();
		
		Map<String, Object>map = lifeLecturerService.checkAttendanceBook(date_created);
		
		responseDto.setData(map);
		responseDto.setResult("success");
		
		
		return responseDto;
	}
	
	
	@RequestMapping("insertAttendanceBookProcess")
	public RestResponseDto insertAttendanceProcess(AttendanceBookDto attendanceBookDto) {
		RestResponseDto responseDto = new RestResponseDto();
		int attendance_book_key = lifeLecturerService.insertAttendanceBook(attendanceBookDto);
		
		responseDto.setResult("success");
		responseDto.setData(attendance_book_key);
		
		return responseDto;
	}
	@RequestMapping("insertAttendanceStatusProcess")
	public void insertAttendanceStatusProcess(AttendanceStatusDto attendanceStatusDto) {
		lifeLecturerService.insertAttendanceStatus(attendanceStatusDto);
	
	}
	
	@RequestMapping("lectureAttendanceStatus")
	public RestResponseDto lectureAttendanceStatus(int attendance_book_key) {
		RestResponseDto responseDto = new RestResponseDto();
		List<Map<String, Object>> list = lifeLecturerService.lectureAttendanceInfo(attendance_book_key);
		
		responseDto.setResult("success");
		responseDto.setData(list);
		
		return responseDto;
	}
	@RequestMapping("loadOpenLectureInfo")
	public RestResponseDto loadOpenLectureInfo(int open_lecture_key) {
		RestResponseDto responseDto = new RestResponseDto();
		
		Map<String, Object> map = lifeLecturerService.openLectureInfo(open_lecture_key);
		
		responseDto.setResult("success");
		responseDto.setData(map);
		
		return responseDto;
	}
	@RequestMapping("getAttendanceInfoList")
	public RestResponseDto getAttendanceInfoList(int open_lecture_key) {
		RestResponseDto responseDto = new RestResponseDto();
		
		List<Map<String, Object>> list = lifeLecturerService.lectureAttendanceBookList(open_lecture_key);
		
		responseDto.setResult("success");
		responseDto.setData(list);
		
		return responseDto;
		
	}
	@RequestMapping("getTotalStudyingInfo")
	public RestResponseDto getTotalStudyingInfo(int open_lecture_key) {
		RestResponseDto responseDto = new RestResponseDto();
		
		Map<String, Object> map = lifeLecturerService.totalStudyingInfo(open_lecture_key);
		
		responseDto.setResult("success");
		responseDto.setData(map);
		
		return responseDto;
		
	}
	@RequestMapping("insertLectureTestAndGetTestPk")
	public RestResponseDto insertLectureTestAndGetTestPk(LectureTestDto lectureTestDto) {
		RestResponseDto responseDto = new RestResponseDto();
		
		int lecutre_test_key = lifeLecturerService.insertLecutreTestInfoAndReturnPk(lectureTestDto);
		
		responseDto.setResult("success");
		responseDto.setData(lecutre_test_key);
		
		return responseDto;
		
	}
	@RequestMapping("insertTestQuestionAndGetQuestionPk")
	public RestResponseDto insertTestQuestionAndGetQuestionPk(TestQuestionDto testQuestionDto) {
		RestResponseDto responseDto = new RestResponseDto();
		
		int test_question_key = lifeLecturerService.insertTestQuestionInfoAndReturnPk(testQuestionDto);
		
		responseDto.setResult("success");
		responseDto.setData(test_question_key);
		
		return responseDto;
	}
	@RequestMapping("insertQuestionChoice")
	public void insertQuestionChoice(QuestionChoiceDto questionChoiceDto) {
		lifeLecturerService.insertQuestionChoiceInfo(questionChoiceDto);
	}
	@RequestMapping("getLectureTestList")
	public RestResponseDto getLectureTestList(int open_lecture_key) {
		RestResponseDto responseDto = new RestResponseDto();
		
		List<Map<String, Object>> list = lifeLecturerService.lectureTestList(open_lecture_key);
		
		responseDto.setResult("success");
		responseDto.setData(list);
		
		return responseDto;
	}
	@RequestMapping("loadTestStudentList")
	public RestResponseDto loadTestStudentList(int lecture_test_key) {
		
		RestResponseDto responseDto = new RestResponseDto();
		
		List<Map<String, Object>> list = lifeLecturerService.getTestStudentList(lecture_test_key);
		
		responseDto.setResult("success");
		responseDto.setData(list);
		
		return responseDto;
		
	}
	@RequestMapping("loadTestInfo")
	public RestResponseDto loadTestInfo(int lecture_test_key) {
		RestResponseDto responseDto = new RestResponseDto();
		
		Map<String, Object> map = lifeLecturerService.testAndLecturerInfo(lecture_test_key);
		
		responseDto.setResult("success");
		responseDto.setData(map);
		
		return responseDto;
	}
	@RequestMapping("loadAttendanceInfo")
	public RestResponseDto loadAttendanceInfo(int open_lecture_key) {
		RestResponseDto responseDto = new RestResponseDto();
		
		Map<String, Object> map = lifeLecturerService.openLectureAttendanceInfo(open_lecture_key);
		
		responseDto.setResult("success");
		responseDto.setData(map);
		
		return responseDto;
	}
	@RequestMapping("loadAttendanceStudentList")
	public RestResponseDto loadAttendanceStudentList(int open_lecture_key) {
		RestResponseDto responseDto = new RestResponseDto();
		
		List<Map<String, Object>> list = lifeLecturerService.attendanceStudentList(open_lecture_key);
		
		responseDto.setResult("success");
		responseDto.setData(list);
		
		return responseDto;
	}
	
	@RequestMapping("loadLectureStudentTotalInfoList")
	public RestResponseDto loadLectureStudentTotalInfoList(int open_lecture_key) {
		RestResponseDto responseDto = new RestResponseDto();
		
		List<Map<String, Object>> list = lifeLecturerService.getLectureStudentTotalInfoList(open_lecture_key);
		
		responseDto.setResult("success");
		responseDto.setData(list);
		
		return responseDto;
	}
	
	
}
