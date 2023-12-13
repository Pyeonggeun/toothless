package com.mkfactory.toothless.b.hs.edu.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.EduApplyDto;
import com.mkfactory.toothless.b.dto.EduDto;
import com.mkfactory.toothless.b.dto.EduStsfcSurveyDto;
import com.mkfactory.toothless.b.hs.edu.mapper.EduStaffSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.StaffSqlMapper;

@Service
public class EduStaffServiceimpl {
	
	@Autowired
	EduStaffSqlMapper eduStaffSqlMapper;
	
	@Autowired
	StaffSqlMapper staffSqlMapper;
	//프로그램 등록
	public void eduProgRegister(EduDto eduDto) {
		
		eduStaffSqlMapper.insert(eduDto);
	}
	//프로그램 리스트 출력
	public List<Map<String, Object>> getEduProgList(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<EduDto> EduProgList = eduStaffSqlMapper.selectAll(); 
		
		for(EduDto eduDto : EduProgList) {
			int staffPk = eduDto.getStaff_pk();
			StaffInfoDto staffInfoDto = eduStaffSqlMapper.selectById(staffPk);
			
			int applyStudentCount = eduStaffSqlMapper.selectApplyPkPerEduPkCount(eduDto.getEdu_pk());
			
			Map<String, Object> map = new HashMap<>();
			map.put("eduDto", eduDto);
			map.put("staffInfoDto", staffInfoDto);
			map.put("applyStudentCount", applyStudentCount);
			
			list.add(map);
		}
		return list;	
	
	}
	
	//프로그램 신청자 리스트 출력
	public List<Map<String, Object>> getEduApplyList(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<EduApplyDto> EduApplyList = eduStaffSqlMapper.selectAllEduApply();
		
		for(EduApplyDto eduApplyDto : EduApplyList) {
			int studentPk = eduApplyDto.getStudent_pk();
			StudentInfoDto studentInfoDto = eduStaffSqlMapper.selectByIdStudent(studentPk);
			
			EduDto eduDto = eduStaffSqlMapper.selectByEdu_pk(eduApplyDto.getEdu_pk());
			int applyStudentCount = eduStaffSqlMapper.selectApplyPkPerEduPkCount(eduApplyDto.getEdu_pk());
			
			Map<String, Object> map = new HashMap<>();
			map.put("eduApplyDto", eduApplyDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("eduDto", eduDto);
			map.put("applyStudentCount", applyStudentCount);
			
			list.add(map);
		}
				
		return list;
	}
	
	//만족도 전체 내역
	public List<Map<String, Object>> getAllServeyList(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<EduStsfcSurveyDto> allServeyList = eduStaffSqlMapper.selectAllServeyList();
		
		for(EduStsfcSurveyDto eduStsfcSurveyDto : allServeyList) {
			
			Map<String, Object> map = new HashMap<>();
			int edu_apply_pk = eduStsfcSurveyDto.getEdu_apply_pk();

			map.put("eduStsfcSurveyDto", eduStsfcSurveyDto);
			map.put("studentName", eduStaffSqlMapper.selectServeyStudent(edu_apply_pk));
			map.put("eduName", eduStaffSqlMapper.selectServeyEduName(edu_apply_pk));
			
			list.add(map);
		}
		
		return list;
	}
	
	
	//상세 글보기
	public Map<String, Object> getEduProg(EduApplyDto eduApplyDto){
		
		Map<String, Object> map = new HashMap<>();
		
		EduDto eduDto = eduStaffSqlMapper.selectByEdu_pk(eduApplyDto.getEdu_pk());
		int staffPk = eduDto.getStaff_pk();
		StaffInfoDto staffInfoDto = eduStaffSqlMapper.selectById(staffPk);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String apply_start_date = sdf.format(eduDto.getApply_start_date());
		String apply_end_date = sdf.format(eduDto.getApply_end_date());
		String edu_date = sdf.format(eduDto.getEdu_date());
		
		
		int stuAndEduCount = eduStaffSqlMapper.selectByEdu_pkAndStudent_pk(eduApplyDto);
		
		map.put("eduDto", eduDto);
		map.put("staffInfoDto", staffInfoDto);
		map.put("apply_start_date", apply_start_date);
		map.put("apply_end_date", apply_end_date);
		map.put("edu_date", edu_date);
		map.put("stuAndEduCount", stuAndEduCount);
		
		return map;
	}
	
	//교육프로그램 수정, 삭제
	public void updateEduProg(EduDto eduDto) {
		eduStaffSqlMapper.update(eduDto);
	}
	
	public void deleteEduProg(int edu_pk) {
		eduStaffSqlMapper.delete(edu_pk);
	}
	
	//상태바꾸기
	public void updateStatusY(int edu_apply_pk) {
		eduStaffSqlMapper.updateStatusY(edu_apply_pk);
	}
	public void updateStatusN(int edu_apply_pk) {
		eduStaffSqlMapper.updateStatusN(edu_apply_pk);
	}
	public void updateStatusC(int edu_apply_pk) {
		eduStaffSqlMapper.updateStatusC(edu_apply_pk);
	}
	public void updateStatusD(int edu_apply_pk) {
		eduStaffSqlMapper.updateStatusD(edu_apply_pk);
	}
	
	
	
	
}
