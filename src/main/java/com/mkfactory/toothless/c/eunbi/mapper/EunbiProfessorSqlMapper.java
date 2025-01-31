package com.mkfactory.toothless.c.eunbi.mapper;

import java.util.List;

import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.dto.AjdksProfessorEvaluationDto;
import com.mkfactory.toothless.c.dto.AjdksStudentInternDto;
import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface EunbiProfessorSqlMapper {
	
	// 교수의 담당 학생 리스트 출력
	public List<StudentInfoDto> getChargedStudent(int professor_pk);
	// 교수의 담당 현장실습과정 리스트 출력
	public List<AjdksInternshipCourseDto> getChargedInternshipCourse(int professor_pk);
	
	// 교수 학생평가 입력
	public void insertProfessorEvaluation(AjdksProfessorEvaluationDto professorEvaluationDto);
	
	// 학생평가 했는지 안했는지
	public Integer isExistProfessorEvaluation(int internship_course_pk);
	public int didProfessorEvaluateIntern(int student_intern_pk);
	
	// 교수info
	public ProfessorInfoDto getProfessorInfo(int professor_pk);
	
	// 교수키로 담당 현장학습의 실습생 구하기
	public List<AjdksStudentInternDto> getInternByProfessorPk(int professor_pk);
	
	
	
}
