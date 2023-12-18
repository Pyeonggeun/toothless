package com.mkfactory.toothless.x.mj.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.ExitDto;
import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.mj.mapper.DormStaffSqlMapper;
import com.mkfactory.toothless.a.student.mj.mapper.DormStudnetSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.DepartmentCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.StudentSqlMapper;
import com.mkfactory.toothless.x.dto.ApplyConditionDto;
import com.mkfactory.toothless.x.dto.LectureCategoryDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LifeLecturerDto;
import com.mkfactory.toothless.x.dto.LifeStudentDto;
import com.mkfactory.toothless.x.dto.OpenLectureDto;
import com.mkfactory.toothless.x.dto.PossibleLectureDto;
import com.mkfactory.toothless.x.mj.mapper.LifeStaffSqlMapper;

@Service
public class LifeStaffServiceImpl {
	
	@Autowired
	private LifeStaffSqlMapper lifeStaffSqlMapper;
	
	// 교육과정 리스트
	public List<LectureCategoryDto> getLectureCategory(){
		
		return lifeStaffSqlMapper.selectLectureCategory();
	}
	
	// 아직 강사등록 안된 사람들
	public List<ExternalInfoDto> getNotYetTeacher(){
		
		return lifeStaffSqlMapper.selectNotYetTeacher();
	}
	
	
	// 강사등록 / 강사별 가능한 강의 목록 등록
	public void registerTeacherInfo(LifeLecturerDto lifeLecturerDto, int[] lecture_category_key) {

		int teacherPk = lifeStaffSqlMapper.createTeacherPk();
		lifeLecturerDto.setLecturer_key(teacherPk);
		lifeStaffSqlMapper.insertTeacherInfo(lifeLecturerDto);

				
		if(lecture_category_key != null) {
			
			for(int categoryId : lecture_category_key) {				
				
				PossibleLectureDto possibleLectureDto = new PossibleLectureDto();
				
				possibleLectureDto.setLecture_category_key(categoryId);
				possibleLectureDto.setLecturer_key(teacherPk);
				
				lifeStaffSqlMapper.insertPossibleLecture(possibleLectureDto);			
			}			
		}
	
	}
	
	// 강사 정보 수정
	public void updateTeacherInfo(LifeLecturerDto lifeLecturerDto, int lecturer_key, int[] lecture_category_key) {
		
		// 강사 기본정보 수정
		lifeStaffSqlMapper.updateTeacherInfo(lifeLecturerDto);
		
		// 강의 가능한 과목 이전꺼 삭제
		lifeStaffSqlMapper.deletePossibleLecture(lecturer_key);
		
		// 강의 가능한 과목 새로 다시 입력~
		if(lecture_category_key != null) {
			
			for(int categoryId : lecture_category_key) {				
				
				PossibleLectureDto possibleLectureDto = new PossibleLectureDto();
				
				possibleLectureDto.setLecture_category_key(categoryId);
				possibleLectureDto.setLecturer_key(lecturer_key);
				
				lifeStaffSqlMapper.insertPossibleLecture(possibleLectureDto);	
				
			}			
		}
	}
	
	// 강사 정보 삭제 deleteTeacherInfo
	public void deleteTeacherInfo(int lecturer_key) {
		
		lifeStaffSqlMapper.deleteTeacherInfo(lecturer_key);
		lifeStaffSqlMapper.deletePossibleLecture(lecturer_key);
	}
	
	

	// '전체'강사목록 + 강사별 가능한 교육과정조회
	public List<Map<String, Object>> getAllTeacherInfoList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		// 전체 강사목록
		List<LifeLecturerDto> allTeacherList = lifeStaffSqlMapper.selectAllTeacherList();
		
		for(LifeLecturerDto lecturerDto : allTeacherList) {
			
			// 강사별 가능한 교육과정
			List<LectureCategoryDto> possibleLectuerList = lifeStaffSqlMapper.selectPossibleLectuer(lecturerDto.getLecturer_key());
			
			Map<String, Object> map = new HashMap<>();
			map.put("lecturerDto", lecturerDto);
			map.put("possibleLectuerList", possibleLectuerList);
	
			list.add(map);
		}
		
		return list;
	}
	
	
	// '전체' 강사목록만
	public List<LifeLecturerDto> getAllTeacherList(){
		
		return lifeStaffSqlMapper.selectAllTeacherList();
	}
	
	
	
	// '특정'강사 정보
	public LifeLecturerDto getSomeTeacherInfo(int lecturer_key) {

		return lifeStaffSqlMapper.selectSomeTeacher(lecturer_key);
	}
	
	// '특정'강사가 가능한 교육과정조회
	public List<LectureCategoryDto> getPossibleLectuerList(int lecturer_key) {

		return lifeStaffSqlMapper.selectPossibleLectuer(lecturer_key);
	}
	
	// '특정'강사의 외부인 회원가입 정보
	public ExternalInfoDto getSomeTeacherExternalInfo(int lecturer_key){
		
		return lifeStaffSqlMapper.selectSomeTeacherExternalInfo(lecturer_key);
	}
	
	
	// ============== 여기부터 학생 정보 ======================
	
	// 아직 학생등록 안된 사람들
	public List<ExternalInfoDto> getNotYetStudent(){
		
		return lifeStaffSqlMapper.selectNotYetStudent();
	}
	
	
	// 학생등록
	public void registerStudentInfo(LifeStudentDto lifeStudentDto) {

		lifeStaffSqlMapper.insertStudentInfo(lifeStudentDto);
	}
	

	// '전체'학생목록
	public List<LifeStudentDto> getAllStudentInfoList() {

		return lifeStaffSqlMapper.selectAllStudentList();
	}
	
	
	// '특정'학생 정보
	public LifeStudentDto getSomeStudentInfo(int life_student_key) {

		return lifeStaffSqlMapper.selectSomeStudentInfo(life_student_key);
	}
	
	// '특정'학생의 외부인 회원가입 정보
	public ExternalInfoDto getSomeStudentExternalInfo(int life_student_key){
		
		return lifeStaffSqlMapper.selectSomeStudentExternalInfo(life_student_key);
	}
	

	// 학생 정보 수정
	public void updateStudentInfo(LifeStudentDto lifeStudentDto, int life_student_key) {

		lifeStaffSqlMapper.updateStudentInfo(lifeStudentDto);
	}
	
	// 학생 정보 삭제
	public void deleteStudentInfo(int life_student_key) {
		
		lifeStaffSqlMapper.deleteStudentInfo(life_student_key);
	}
	
	// ============== 여기부터 교육과정 정보 ======================
	
	// 기본강의정보 등록
	public void registerLectureInfo(LectureInfoDto lectureInfoDto) {

		lifeStaffSqlMapper.insertLectureInfo(lectureInfoDto);
	}
	
	
	// 전체 교육과정목록
	public List<LectureInfoDto> getAllLectureList(){
		
		return lifeStaffSqlMapper.selectAllLectureInfoList();
	}
	
	
	// '전체'교육과정목록 + 강의별 수강신청 조건개수
	public List<Map<String, Object>> getAllLectureInfoList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		// 전체 교육과정 목록
		List<LectureInfoDto> allLectureInfoList = lifeStaffSqlMapper.selectAllLectureInfoList();
		
		
		for(LectureInfoDto lectureDto : allLectureInfoList) {
			
			// 강의별 수강신청 조건 리스트(for 개수새서 버튼 바꾸러고)
			List<ApplyConditionDto> conditionListByLectureKey = lifeStaffSqlMapper.selectConditionListByLectureKey(lectureDto.getLecture_info_key());
			
			// 수강신청 조건 개수
			int countCondition = conditionListByLectureKey.size();
			
			Map<String, Object> map = new HashMap<>();
			map.put("lectureDto", lectureDto);
			map.put("conditionListByLectureKey", conditionListByLectureKey);
			map.put("countCondition", countCondition);
	
			list.add(map);
		}

		return list;
		
	}
	
	// '특정'강의 정보
	public LectureInfoDto getSomeLectureInfo(int lecture_info_key) {

		return lifeStaffSqlMapper.selectSomeLectureInfo(lecture_info_key);
	}

	// 강의 정보 수정
	public void updateLectureInfo(LectureInfoDto lectureInfoDto) {

		lifeStaffSqlMapper.updateLectureInfo(lectureInfoDto);
	}

	
	// 강의 정보 삭제
	public void deleteLectureInfo(int lecture_info_key) {
		
		lifeStaffSqlMapper.deleteLectureInfo(lecture_info_key);
	}
	
	// 특정강의가 삭제되면 그에따른 개설강의 삭제
	public void deleteOpenLectureInfoByLecKey(int lecture_info_key) {
		
		lifeStaffSqlMapper.deleteOpenLectureInfoByLecKey(lecture_info_key);
	}
	
	// 강의별 수강신청 조건 리스트 
	public List<ApplyConditionDto> getConditionListByLectureKey(int lecture_info_key) {

		return lifeStaffSqlMapper.selectConditionListByLectureKey(lecture_info_key);
	}
	
	// 강의별 수강신청 조건 수정
	public void updateConditionInfo(int lecture_info_key, int[] condition_lecture_key) {
			
		// 강의별 수강신청 조건 리스트 이전꺼 삭제
		lifeStaffSqlMapper.deleteConditionList(lecture_info_key);
		
		// 강의 가능한 과목 새로 다시 입력~
		if(condition_lecture_key != null) {
			
			for(int value : condition_lecture_key) {				
				
				ApplyConditionDto applyConditionDto = new ApplyConditionDto();
				
				applyConditionDto.setLecture_info_key(lecture_info_key);
				applyConditionDto.setCondition_lecture_key(value);
	
				lifeStaffSqlMapper.insertConditionInfo(applyConditionDto);	
				
			}			
		}
	}
	
	// 강의별 수강신청 조건 정보 삭제
	public void deleteConditionList(int lecture_info_key) {
		
		lifeStaffSqlMapper.deleteConditionList(lecture_info_key);
	}
	
	// 교육과정 카테고리 정보 등록
	public void insertCategory(LectureCategoryDto lectureCategoryDto) {
		
		lifeStaffSqlMapper.insertCategory(lectureCategoryDto);
	}

	
	// 교육과정 카테고리 정보 삭제
	public void deleteCategory(int lecture_category_key) {
		
		lifeStaffSqlMapper.deleteCategory(lecture_category_key);
	}
	
	// 교육과정 카테고리 정보 삭제되면 그 카테고리 수업들/가능정보도 삭제
	public void deleteLectureListByCategoryKey(int lecture_category_key) {
		
		lifeStaffSqlMapper.deleteLectureListByCategoryKey(lecture_category_key);
		lifeStaffSqlMapper.deletePossibleByCategoryKey(lecture_category_key);
	}
	
	// ================여기부터 강의관련===================
	
	// 카테고리별 수업리스트
	public List<LectureInfoDto> getLectureListByCategory(int lecture_category_key) {
		
		return lifeStaffSqlMapper.getLectureListByCategory(lecture_category_key);
	}
	
	// 카테고리별 강사리스트
	public List<LifeLecturerDto> getTeacherListByCategory(int lecture_category_key) {
		
		return lifeStaffSqlMapper.getTeacherListByCategory(lecture_category_key);
	}

	// 신규 강의 개설
	public void insertOpenLecture(OpenLectureDto openLectureDto) {
		
		lifeStaffSqlMapper.insertOpenLecture(openLectureDto);
	}
	
	// 개설강의 정보 + 기본강의 정보
	public List<Map<String, Object>> getAllOpenLectureInfoList() {
		
		List<Map<String, Object>> list = new ArrayList<>();

		// 개설강의 리스트
		List<OpenLectureDto> openLectureList = lifeStaffSqlMapper.selectAllOpenLecture();
		
		for(OpenLectureDto openLec : openLectureList) {
			
			// 특정 기본수업정보
			LectureInfoDto lectureInfo = lifeStaffSqlMapper.selectSomeLectureInfo(openLec.getLecture_info_key());
			
			Map<String, Object> map = new HashMap<>();
			map.put("openLec", openLec);
			map.put("lectureInfo", lectureInfo);
	
			list.add(map);
		}
		
		return list;
	}
	
	// '특정' 개설 강의 정보
	public OpenLectureDto getSomeOpenLectureInfo(int open_lecture_key) {
		
		return lifeStaffSqlMapper.selectSomeOpenLectureInfo(open_lecture_key);
	}
	
	// 개설 강의 정보 수정
	public void updateOpenLectureInfo(OpenLectureDto openLectureDto) {
		
		lifeStaffSqlMapper.updateOpenLectureInfo(openLectureDto);
	}
	
	
	// 개설 강의 정보 삭제
	public void deleteOpenLectureInfo(int open_lecture_key) {
		
		lifeStaffSqlMapper.deleteOpenLectureInfo(open_lecture_key);
	}
	
	
	
	
	
	
	
	
	
	

}
