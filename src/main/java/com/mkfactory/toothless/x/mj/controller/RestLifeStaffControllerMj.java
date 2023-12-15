package com.mkfactory.toothless.x.mj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.Mj_RestResponseDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.mj.service.DormStaffServiceImpl;
import com.mkfactory.toothless.a.student.mj.service.DormStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.x.dto.LectureCategoryDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LifeLecturerDto;
import com.mkfactory.toothless.x.dto.LifeStudentDto;
import com.mkfactory.toothless.x.dto.PossibleLectureDto;
import com.mkfactory.toothless.x.mj.service.LifeStaffServiceImpl;

@RestController
@RequestMapping("/tl_x/mj/*")
public class RestLifeStaffControllerMj {
	
	@Autowired
	private LifeStaffServiceImpl lifeStaffService;
	
	// 강사 / 강사별 가능한 강의 목록 등록 
	@RequestMapping("registerTeacherProcess")
	public Mj_RestResponseDto registerTeacherProcess(LifeLecturerDto params, int[] lecture_category_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		lifeStaffService.registerTeacherInfo(params, lecture_category_key);

		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	// 강사 정보 수정(모달창에서)
	@RequestMapping("updateTeacherInfo")
	public Mj_RestResponseDto updateTeacherInfo(LifeLecturerDto params, int lecturer_key, int[] lecture_category_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();

		params.setLecturer_key(lecturer_key);
		lifeStaffService.updateTeacherInfo(params, lecturer_key, lecture_category_key);

		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	// 강사 정보 삭제 deleteTeacherInfo
	@RequestMapping("deleteTeacherInfo")
	public Mj_RestResponseDto deleteTeacherInfo(int lecturer_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		lifeStaffService.deleteTeacherInfo(lecturer_key);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	
	// 강사 등록 페이지로 보낼 내용
	@RequestMapping("getRegisterTeacherInfo")
	public Mj_RestResponseDto getRegisterTeacherInfo() {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
		// 교육과정 리스트
		List<LectureCategoryDto> lectureCategoryList = lifeStaffService.getLectureCategory();
		restResponseDto.addData("lectureCategoryList", lectureCategoryList);
		
		// 아직 강사등록 안된 사람들
		List<ExternalInfoDto> notYetTeacherList = lifeStaffService.getNotYetTeacher();
		restResponseDto.addData("notYetTeacherList", notYetTeacherList);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	// 강사 목록 조회/수정 페이지로 보낼 내용 1
	@RequestMapping("getAllTeacherInfoList")
	public Mj_RestResponseDto getAllTeacherInfoList() {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
		// 전체강사목록 + 강사별 가능한 교육과정 리스트
		List<Map<String, Object>> allTeacherInfoList = lifeStaffService.getAllTeacherInfoList();
		restResponseDto.addData("allTeacherInfoList", allTeacherInfoList);
		
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	// 강사 목록 조회/수정 페이지로 보낼 내용 2
	@RequestMapping("getSomeTeacherInfo")
	public Mj_RestResponseDto getSomeTeacherInfo(int lecturer_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();

		// 특정강사 정보
		LifeLecturerDto someTeacherInfo = lifeStaffService.getSomeTeacherInfo(lecturer_key);
		restResponseDto.addData("someTeacherInfo", someTeacherInfo);
				
		// 특정강사 가능 강의
		List<LectureCategoryDto> possibleLectuerList = lifeStaffService.getPossibleLectuerList(lecturer_key);
		restResponseDto.addData("possibleLectuerList", possibleLectuerList);
		
		// 특정강사 외부인 회원가입 정보
		ExternalInfoDto someTeacherExternalInfo = lifeStaffService.getSomeTeacherExternalInfo(lecturer_key);
		restResponseDto.addData("someTeacherExternalInfo", someTeacherExternalInfo);
				
		restResponseDto.setResult("success");
		return restResponseDto;
	} 
	
	
	// ================ 여기부터 학생 관련 =====================================
	// 학생 등록 페이지로 보낼 내용
	@RequestMapping("getRegisterStudentInfo")
	public Mj_RestResponseDto getRegisterStudentInfo() {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
		// 교육과정 리스트
		List<LectureCategoryDto> lectureCategoryList = lifeStaffService.getLectureCategory();
		restResponseDto.addData("lectureCategoryList", lectureCategoryList);
		
		// 아직 강사등록 안된 사람들
		List<ExternalInfoDto> notYetStudentList = lifeStaffService.getNotYetStudent();
		restResponseDto.addData("notYetStudentList", notYetStudentList);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	} 
	
	// 학생 정보 등록 프로세스
	@RequestMapping("registerStudentProcess")
	public Mj_RestResponseDto registerStudentProcess(LifeStudentDto params) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		lifeStaffService.registerStudentInfo(params);

		restResponseDto.setResult("success");
		return restResponseDto;	
	}

	// 강사 목록 조회/수정 페이지로 보낼 내용 1
	@RequestMapping("getAllStudentInfoList")
	public Mj_RestResponseDto getAllStudentInfoList() {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
		// 전체강사목록 + 강사별 가능한 교육과정 리스트
		List<LifeStudentDto> allStudentInfoList = lifeStaffService.getAllStudentInfoList();
		restResponseDto.addData("allStudentInfoList", allStudentInfoList);
		
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	

	// 학생 목록 조회/수정 페이지로 보낼 내용 2
	@RequestMapping("getSomeStudentInfo")
	public Mj_RestResponseDto getSomeStudentInfo(int life_student_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();

		// 특정학생 정보
		LifeStudentDto someStudentInfo = lifeStaffService.getSomeStudentInfo(life_student_key);
		restResponseDto.addData("someStudentInfo", someStudentInfo);
				
		// 특정학생 외부인 회원가입 정보
		ExternalInfoDto someStudentExternalInfo = lifeStaffService.getSomeStudentExternalInfo(life_student_key);
		restResponseDto.addData("someStudentExternalInfo", someStudentExternalInfo);
				
		restResponseDto.setResult("success");
		return restResponseDto;
	} 
	
	// 학생 정보 수정(모달창에서)
	@RequestMapping("updateStudentInfo")
	public Mj_RestResponseDto updateStudentInfo(LifeStudentDto params, int life_student_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();

		params.setLife_student_key(life_student_key);
		lifeStaffService.updateStudentInfo(params, life_student_key);

		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	// 학생 정보 삭제
	@RequestMapping("deleteStudentInfo")
	public Mj_RestResponseDto deleteStudentInfo(int life_student_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		lifeStaffService.deleteStudentInfo(life_student_key);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	
	
	
	
	
	
	
}
