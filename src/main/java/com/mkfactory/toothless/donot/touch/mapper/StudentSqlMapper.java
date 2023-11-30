package com.mkfactory.toothless.donot.touch.mapper;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface StudentSqlMapper {

	public StudentInfoDto selectStudentByIdAndPassword(StudentInfoDto studentInfoDto);
}
