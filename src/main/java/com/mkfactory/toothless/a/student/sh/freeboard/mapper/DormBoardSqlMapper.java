package com.mkfactory.toothless.a.student.sh.freeboard.mapper;

import java.util.List;

import com.mkfactory.toothless.a.dto.DormFreeboardDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface DormBoardSqlMapper {
	
	public void insert(DormFreeboardDto heung);
	
	public List<DormFreeboardDto> selectAll();
	
	public DormFreeboardDto selectByBoardId(int id);
	public void increaseReadCount(int student_pk);
	
	public void delete(int id);
	
	public void update(DormFreeboardDto dormFreeboardDto);
	
	
	public StudentInfoDto getStudentInfoById(int pk);
	
	
}
