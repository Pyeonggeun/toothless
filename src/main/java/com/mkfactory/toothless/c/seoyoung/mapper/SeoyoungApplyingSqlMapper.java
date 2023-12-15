package com.mkfactory.toothless.c.seoyoung.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.dto.AjdksStudentApplyingDto;

public interface SeoyoungApplyingSqlMapper {

	// 등록된 산업체 상세 정보 리스트
	public List<Map<String, Object>> selectApplyCompanyList();
	
	//선발인원
	public void insert(AjdksStudentApplyingDto ajdksStudentApplyingDto);
	
	//현재 진행 상태
	public List<Map<String, Object>> selectApplyNewList(int student_pk);
	
	//이전 진행 리스트
	public List<Map<String, Object>> selectApplyOldList(int student_pk);
	
	//이미 신청했는지 여부 확인
	public String selectTFApply(int studentPk);
	
	//카테고리+산업체 조인
	public List<Map<String, Object>> searchCompanyCategori();

	public Map<String, Object> selectApplyCompanyModal(int INTERNSHIP_COURSE_PK);
}
