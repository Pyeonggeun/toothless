package com.mkfactory.toothless.donot.touch.mapper;

import java.util.List;

import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface StudentSqlMapper {

	public StudentInfoDto selectStudentByIdAndPassword(StudentInfoDto studentInfoDto);
	
	public String selectStudnetDepartmentName(int department_pk);
	
	public int selectStudentYear(int student_pk);
	
	public int selectGraduationInfo(int student_pk);
	
	
	
	public ProfessorInfoDto selectMyProfessor(int professor_pk);
}
