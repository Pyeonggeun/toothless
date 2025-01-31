package com.mkfactory.toothless.e.freeboardcounsel.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.FreeboardCommentDto;
import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.dto.FreeboardEmpathyDto;
import com.mkfactory.toothless.e.dto.FreeboardImageDto;

public interface FreeboardCounselSqlMapper {
	
	

	public void insertFreeboardPosts(FreeboardDto paraFreeboardDto);
	
	public List<FreeboardDto> selectfreeboardList(
			@Param("searchType") String searchType,
			@Param("searchWord") String searchWord
			);
	
	public StudentInfoDto selectStudentInfo(int student_pk);
	
	public FreeboardDto selectPostById(int id);
	
	public void readCount(int id);
	
	public StudentInfoDto selectByStudentId(int student_pk);
	
	public void deleteFreeboardPost(int id);
	
	public void updateFreeboardPost(FreeboardDto paraFreeboardDto);
	
	public int selectFreeboardCount(FreeboardDto paraFreeboardDto);
	
	public List<FreeboardDto> bestFreeboardPost();
	
	public List<FreeboardDto> selectNewPost();
	
	public void insertFreeboardComment(FreeboardCommentDto paraFreeboardCommentDto);
	
	public List<FreeboardCommentDto> selectFreeboardComment();
	public int countComment(int freeboard_id);
	
	public StudentInfoDto selectStudentInfoForComment(int student_pk);
	
	public void insertImage(FreeboardImageDto elementFreeboardImageDto);
	public List<FreeboardImageDto> selectFreeboardImageDto(int freeboard_id);
	
	public int createFreeboardPk();
	
	public void insertEmpathy(FreeboardEmpathyDto paraFreeboardEmpathyDto);
	
	public int submitAndSelectEmpathy(FreeboardEmpathyDto paraFreeboardEmpathyDto);

	public void deleteEmpathyByIdAndPk(FreeboardEmpathyDto paraFreeboardEmpathyDto);
	
	public int selectAllEmpathy(int freeboard_id);
	
}