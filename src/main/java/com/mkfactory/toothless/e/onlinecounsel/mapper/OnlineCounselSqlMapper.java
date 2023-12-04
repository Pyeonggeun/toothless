package com.mkfactory.toothless.e.onlinecounsel.mapper;

import java.util.List;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.OnlineCounselBoardDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;

public interface OnlineCounselSqlMapper {

	public void insertOnlineCounsel(OnlineCounselBoardDto onlineCounselBoardDto);
	
	public List<TypeCategoryDto> takeAllCategory();
	
	public List<OnlineCounselBoardDto> selectAllCounselListByStudentPk(int student_id);
	
	public TypeCategoryDto selectCategoryDto(int category_id);
	
	public StudentInfoDto getStudentInfo(int student_id);
	
	public OnlineCounselBoardDto selectCounsel(int counsel_pk);
}
