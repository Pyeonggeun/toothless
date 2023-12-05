package com.mkfactory.toothless.a.student.dm.mapper;

import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;

public interface DormStudentSqlMapperDm {
	
	public SemesterDto semesterByProgressState();
	
	public JoinDormInfoDto joinDormInfoBySemesterPk(int semester_pk);
}