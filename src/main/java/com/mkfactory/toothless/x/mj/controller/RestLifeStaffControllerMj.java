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
import com.mkfactory.toothless.x.dto.ApplyConditionDto;
import com.mkfactory.toothless.x.dto.LectureCategoryDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LifeLecturerDto;
import com.mkfactory.toothless.x.dto.LifeStudentDto;
import com.mkfactory.toothless.x.dto.OpenLectureDto;
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
	
	// 전체 강사 목록만
	@RequestMapping("getAllTeacherList")
	public Mj_RestResponseDto getAllTeacherList() {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();

		// 전체강사목록
		List<LifeLecturerDto> allTeacherList = lifeStaffService.getAllTeacherList();
		restResponseDto.addData("allTeacherList", allTeacherList);

		
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

	// 학생 목록 조회/수정 페이지로 보낼 내용 1
	@RequestMapping("getAllStudentInfoList")
	public Mj_RestResponseDto getAllStudentInfoList() {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
		// 전체학생목록
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

	
	// =================여기부터 교육과정 관련========================
	
	// 교육과정 리스트
	@RequestMapping("getLectureCategory")
	public Mj_RestResponseDto getLectureCategory() {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();

		// 교육과정 리스트
		List<LectureCategoryDto> lectureCategoryList = lifeStaffService.getLectureCategory();
		restResponseDto.addData("lectureCategoryList", lectureCategoryList);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	
	// 기본수업정보 등록
	@RequestMapping("registerLectureProcess")
	public Mj_RestResponseDto registerLectureProcess(LectureInfoDto params) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		lifeStaffService.registerLectureInfo(params);

		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	

	// 교육과정 목록 조회/수정 페이지로 보낼 내용 1
	@RequestMapping("getAllLectureInfoList")
	public Mj_RestResponseDto getAllLectureInfoList() {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
		// 전체 교육과정 목록 + 강의별 수강신청 조건 개수
		List<Map<String, Object>> getAllLectureInfoList = lifeStaffService.getAllLectureInfoList();
		restResponseDto.addData("getAllLectureInfoList", getAllLectureInfoList);
		
		// 교육과정 리스트
		List<LectureCategoryDto> lectureCategoryList = lifeStaffService.getLectureCategory();
		restResponseDto.addData("lectureCategoryList", lectureCategoryList);
		
		restResponseDto.setResult("success");
		return restResponseDto;
	}
	
	// 교육과정 목록 조회/수정 페이지로 보낼 내용 2
	@RequestMapping("getSomeLectureInfo")
	public Mj_RestResponseDto getSomeLectureInfo(int lecture_info_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();

		// 특정 강의 정보
		LectureInfoDto someLectureInfo = lifeStaffService.getSomeLectureInfo(lecture_info_key);
		restResponseDto.addData("someLectureInfo", someLectureInfo);
		
		// 전체 교육과정 목록 
		List<LectureInfoDto> allLectureList =  lifeStaffService.getAllLectureList();
		restResponseDto.addData("allLectureList", allLectureList);
		
		// 강의별 수강신청 조건 리스트 
		List<ApplyConditionDto> conditionListByLectureKey = lifeStaffService.getConditionListByLectureKey(lecture_info_key);
		restResponseDto.addData("conditionListByLectureKey", conditionListByLectureKey);
		
		// 교육과정 리스트
		List<LectureCategoryDto> lectureCategoryList = lifeStaffService.getLectureCategory();
		restResponseDto.addData("lectureCategoryList", lectureCategoryList);
		
		
		restResponseDto.setResult("success");
		return restResponseDto;
	} 
	
	// 강의 정보 수정(모달창에서)
	@RequestMapping("updateLectureInfo")
	public Mj_RestResponseDto updateLectureInfo(LectureInfoDto params, int lecture_info_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();

		params.setLecture_info_key(lecture_info_key);
		lifeStaffService.updateLectureInfo(params);

		restResponseDto.setResult("success");
		return restResponseDto;	
	}

	// 강의 정보 삭제
	@RequestMapping("deleteLectureInfo")
	public Mj_RestResponseDto deleteLectureInfo(int lecture_info_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		// 강의정보삭제되면
		lifeStaffService.deleteLectureInfo(lecture_info_key);
		
		// 해당하는 개설된 강의들도 삭제(---> 수강신청이 한명이라도있으면 삭제 불가하게...(-))
		lifeStaffService.deleteOpenLectureInfoByLecKey(lecture_info_key);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	// 강의별 수강신청 조건 수정
	// --> 체크박스 수정하게되면 lecture_info_key로 조건리스트 뽑아서 전체 삭제하고,
    // --> 다시 lecture_info_key별로 condition_lecture_key 인서트하는게 편하다!
	@RequestMapping("updateConditionInfo")
	public Mj_RestResponseDto updateConditionInfo(int lecture_info_key, int[] condition_lecture_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();

		lifeStaffService.updateConditionInfo(lecture_info_key, condition_lecture_key);

		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	// 강의별 수강신청 조건 리스트 삭제
	@RequestMapping("deleteConditionList")
	public Mj_RestResponseDto deleteConditionList(int lecture_info_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		lifeStaffService.deleteConditionList(lecture_info_key);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	// 교육과정 카테고리 삭제 
	@RequestMapping("deleteCategoryProcess")
	public Mj_RestResponseDto deleteCategoryProcess(int lecture_category_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		// 카테고리 삭제
		lifeStaffService.deleteCategory(lecture_category_key);
		
		// 그 카테고리 수업들도 삭제
		lifeStaffService.deleteLectureListByCategoryKey(lecture_category_key);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	// 교육과정 카테고리 등록
	@RequestMapping("insertCategoryProcess")
	public Mj_RestResponseDto insertCategoryProcess(LectureCategoryDto params) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		lifeStaffService.insertCategory(params);

		restResponseDto.setResult("success");
		return restResponseDto;	
	}

	
	
	// =================여기부터 개설 강의 관련========================
	// 카테고리별 수업리스트
	@RequestMapping("getLectureListByCategory")
	public Mj_RestResponseDto getLectureListByCategory(int lecture_category_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		List<LectureInfoDto> lectureListByCategory = lifeStaffService.getLectureListByCategory(lecture_category_key);
		restResponseDto.addData("lectureListByCategory", lectureListByCategory);
		
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	// 카테고리별 수업가능한 강사리스트 中 개강일~종강일 사이에 수업없는 애들
	@RequestMapping("getTeacherListByCategory")
	public Mj_RestResponseDto getTeacherListByCategory(
			@RequestParam int lecture_category_key, 
			@RequestParam String insertOpenDate, 
			@RequestParam String insertCloseDate) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		// 수업가능한 강사리스트
		List<LifeLecturerDto> teacherListByCategory = lifeStaffService.getTeacherListByCategory(lecture_category_key, insertOpenDate, insertCloseDate);
		restResponseDto.addData("teacherListByCategory", teacherListByCategory);			

		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	

	// 신규 강의개설
	@RequestMapping("registerOpenLectureProcess")
	public Mj_RestResponseDto registerOpenLectureProcess(OpenLectureDto params) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		lifeStaffService.insertOpenLecture(params);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	// 개설강의 정보 리스트
	@RequestMapping("getAllOpenLectureInfoList")
	public Mj_RestResponseDto getAllOpenLectureInfoList() {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		// 개설강의 정보 리스트
		List<Map<String, Object>> allOpenLectureInfoList = lifeStaffService.getAllOpenLectureInfoList();
		restResponseDto.addData("allOpenLectureInfoList", allOpenLectureInfoList);
		
		// 전체강사목록
		List<LifeLecturerDto> allTeacherList = lifeStaffService.getAllTeacherList();
		restResponseDto.addData("allTeacherList", allTeacherList);
		
		// 교육과정 리스트
		List<LectureCategoryDto> lectureCategoryList = lifeStaffService.getLectureCategory();
		restResponseDto.addData("lectureCategoryList", lectureCategoryList);
		
		// 전체학생 리스트
		List<LifeStudentDto> allStudentInfoList = lifeStaffService.getAllStudentInfoList();
		restResponseDto.addData("allStudentInfoList", allStudentInfoList);
		
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	// 개설강의 입력된 정보 + 해당 강의 기본수업정보
	@RequestMapping("getSomeOpenLectureInfo")
	public Mj_RestResponseDto getSomeOpenLectureInfo(int open_lecture_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();

		// 특정 개설강의 정보
		OpenLectureDto someOpenLecInfo = lifeStaffService.getSomeOpenLectureInfo(open_lecture_key);
		restResponseDto.addData("someOpenLecInfo", someOpenLecInfo);
		
		// 특정 강의 기본 정보
		LectureInfoDto someLectureInfo = lifeStaffService.getSomeLectureInfo(someOpenLecInfo.getLecture_info_key());
		restResponseDto.addData("someLectureInfo", someLectureInfo);
		
		// 교육과정 리스트
		List<LectureCategoryDto> lectureCategoryList = lifeStaffService.getLectureCategory();
		restResponseDto.addData("lectureCategoryList", lectureCategoryList);
		
		
		restResponseDto.setResult("success");
		return restResponseDto;
	} 
	
	// 개설 강의 정보 수정(모달창에서)
	@RequestMapping("updateOpenLectureInfo")
	public Mj_RestResponseDto updateOpenLectureInfo(OpenLectureDto params, int open_lecture_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		params.setOpen_lecture_key(open_lecture_key);
		
		/* 특정 개설강의 정보
		OpenLectureDto someOpenLecInfo = lifeStaffService.getSomeOpenLectureInfo(open_lecture_key);
		params.setLecture_info_key(someOpenLecInfo.getLecture_info_key());
		*/
		lifeStaffService.updateOpenLectureInfo(params);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	
	// 수강신청 된 강의는 수정불가하게
	@RequestMapping("getNoUpdateLectureList")
	public Mj_RestResponseDto getNoUpdateLectureList() {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		List<OpenLectureDto> noUpdateLectureList = lifeStaffService.getNoUpdateLecture();
		restResponseDto.addData("noUpdateLectureList", noUpdateLectureList);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	
	
	
	// 개설 강의 정보 삭제(모달창에서)
	@RequestMapping("deleteOpenLectureInfo")
	public Mj_RestResponseDto deleteOpenLectureInfo(int open_lecture_key) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		lifeStaffService.deleteOpenLectureInfo(open_lecture_key);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	

	// 월별 수강신청 정보 리스트 selectMonthlyOpenLectureList
	@RequestMapping("selectMonthlyOpenLectureList")
	public Mj_RestResponseDto selectMonthlyOpenLectureList(int month) {
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
		
		System.out.println(month + "달이넘어오니");
		
		List<Map<Object, String>> monthlyOpenLectureList = lifeStaffService.selectMonthlyOpenLectureList(month);
		restResponseDto.addData("monthlyOpenLectureList", monthlyOpenLectureList);
		
		restResponseDto.setResult("success");
		return restResponseDto;	
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
