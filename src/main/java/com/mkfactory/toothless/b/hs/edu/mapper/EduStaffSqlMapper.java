package com.mkfactory.toothless.b.hs.edu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.b.dto.EduApplyDto;
import com.mkfactory.toothless.b.dto.EduDto;
import com.mkfactory.toothless.b.dto.EduStsfcSurveyDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface EduStaffSqlMapper {
	//프로그램 등록
	public void insert(EduDto eduDto);

	public List<EduDto> selectAll(	//1개일때도 param 써도됨
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord
			);
	
	public List<EduApplyDto> selectAllEduApply();
	
	public List<EduStsfcSurveyDto> selectAllServeyList();
	
	public StudentInfoDto selectServeyStudent(int edu_apply_pk);
	
	public String selectServeyEduName(int edu_apply_pk);
	
	public StaffInfoDto selectById(int id);
	
	public StudentInfoDto selectByIdStudent(int id);
	
	public EduDto selectByEdu_pk(int edu_pk);
	
	public int selectApplyPkPerEduPkCount(int edu_pk);
	
	public void update(EduDto eduDto);
	
	public void delete(int edu_pk);
	
	public void updateStatusY(int edu_apply_pk);
	public void updateStatusN(int edu_apply_pk);
	public void updateStatusC(int edu_apply_pk);
	public void updateStatusD(int edu_apply_pk);
	
	//같은프로그램신청 못하게 카운트로 뽑아와.
	public int selectByEdu_pkAndStudent_pk(EduApplyDto eduApplyDto);
	
}
