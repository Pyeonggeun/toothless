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
import com.mkfactory.toothless.x.dto.LectureCategoryDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LifeLecturerDto;
import com.mkfactory.toothless.x.dto.LifeStudentDto;
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
		
		// 강사 기본정보 수정
		lifeStaffSqlMapper.updateStudentInfo(lifeStudentDto);
		
	}
	
	// 강사 정보 삭제 deleteTeacherInfo
	public void deleteStudentInfo(int life_student_key) {
		
		lifeStaffSqlMapper.deleteStudentInfo(life_student_key);
	}
	
	
	
	
	
	
	
	
	
	

}
