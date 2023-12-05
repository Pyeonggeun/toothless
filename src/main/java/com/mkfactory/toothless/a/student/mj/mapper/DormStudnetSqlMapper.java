package com.mkfactory.toothless.a.student.mj.mapper;

import java.util.List;

import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.donot.touch.dto.DepartmentCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface DormStudnetSqlMapper {
	
	// 진행중인 학기정보
	public SemesterDto thisSemesterByY();
	
	// 학기 정보로 입주공고 가져오기
	public JoinDormInfoDto joinDormInfoBySemesterPk(int semester_pk);
	
	// 학생 pk로 특정학생 정보 가져오기
	public StudentInfoDto selectStudentInfoByStudentPk(int student_pk);
	
	// 학과 pk로 특정학과 정보 가져오기
	public DepartmentCategoryDto selectDeparmentInfoByPk(int department_pk);
	
	// 입주신청하기
	public void insertStudentInfo(JoinDormApplicationDto joinDormApplicationDto);
	
}
