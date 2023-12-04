package com.mkfactory.toothless.donot.touch.mapper;

import java.util.List;

import com.mkfactory.toothless.donot.touch.dto.CenterCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.DepartmentCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentSemesterDto;

public interface StaffSqlMapper {
	
	public StaffInfoDto selectStaffByIdAndPassword(StaffInfoDto staffInfoDto);
	
	public List<ProfessorInfoDto> selectProfessorList();
	public List<DepartmentCategoryDto> selectDepartmentList();
	public int getStudentPk();
	
	public void insertStudentInfo(StudentInfoDto studentInfoDto);
	public void insertSemesterInfo(StudentSemesterDto suSemesterDto);
	public void insertGraduationInfo(int student_pk);
	
	public List<CenterCategoryDto> selectCenterList();
	
	public void insertProfessor(ProfessorInfoDto professorInfoDto);
	public void insertStaff(StaffInfoDto staffInfoDto);
	
	public int selectExistsCheckStudentId(String stduent_id);
	public int selectExistsCheckStaffId(String staff_id);
	public int selectExistsCheckProfessorId(String professor_id);
	
	
}
