package com.mkfactory.toothless.b.hs.edu.mapper;

import java.util.List;

import com.mkfactory.toothless.b.dto.EduDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

public interface EduStaffSqlMapper {
	//프로그램 등록
	public void insert(EduDto eduDto);

	public List<EduDto> selectAll();
	
	public StaffInfoDto selectById(int id);
	
	public EduDto selectByEdu_pk(int edu_pk);
	
	public void update(EduDto eduDto);
	
	public void delete(int edu_pk);
	
	
	
}
