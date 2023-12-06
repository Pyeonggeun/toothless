package com.mkfactory.toothless.e.onlinecounsel.mapper;

import java.util.List;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.OnlineCounselBoardDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;

public interface OnlineCounselSqlMapper {

	//		**		공용		**
	
	public List<TypeCategoryDto> takeAllCategory();
	
	public TypeCategoryDto selectCategoryDto(int category_id);


	
	//		**	학생관련	**
	
	public void insertOnlineCounsel(OnlineCounselBoardDto onlineCounselBoardDto);
	
	public List<OnlineCounselBoardDto> selectAllCounselListByStudentPk(int student_id);
	
	public StudentInfoDto getStudentInfo(int student_id);
	
	public OnlineCounselBoardDto selectCounsel(int counsel_pk);
	
	
	
	//		**** 상담원 관련 ****
	
	public List<OnlineCounselBoardDto> selecAllCounselDtoByCounselorPk(int counselorPk);
	
}