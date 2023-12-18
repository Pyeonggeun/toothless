package com.mkfactory.toothless.a.student.sj.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.RequestRepairDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface RequestRepairSqlMapper {

	public DormStudentDto printDormStudentPk(int dorm_student_pk);
	public void insertRequestRepair(RequestRepairDto requestRepairDto);
	
	public List<RequestRepairDto> printingArticles();
	public List<DormStudentDto> dormStudents();
	public List<Map<String, Object>> printingPage();
	
	public RequestRepairDto selectArticle(int request_repair_pk);
	public DormStudentDto selectDormStudentPk(int dorm_student_pk);
	public StudentInfoDto studentPk(int student_pk);
	public void deleteRequestRepair(int request_repair_pk);
}
