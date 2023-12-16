package com.mkfactory.toothless.a.student.sj.mapper;

import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.RequestRepairDto;

public interface RequestRepairSqlMapper {

	public DormStudentDto printDormStudentPk(int dorm_student_pk);
	public void insertRequestRepair(RequestRepairDto requestRepairDto);
}
