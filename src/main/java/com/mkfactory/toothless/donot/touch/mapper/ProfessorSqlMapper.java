package com.mkfactory.toothless.donot.touch.mapper;

import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;

public interface ProfessorSqlMapper {
	
	public ProfessorInfoDto selectProfessorByIdAndPassword(ProfessorInfoDto professorInfo);
}
