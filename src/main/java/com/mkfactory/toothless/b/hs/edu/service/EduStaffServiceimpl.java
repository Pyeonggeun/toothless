package com.mkfactory.toothless.b.hs.edu.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
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
		
		String content = eduDto.getContent();
//      content = content.replaceAll("<", "&lt;");
//      content = content.replaceAll(">", "&gt;");
      
	    content = StringEscapeUtils.escapeHtml4(content);
	    content = content.replaceAll("<br>", "\n");
	    eduDto.setContent(content);

//출력 쪽은 replaceAll 쪽 '', '' 요거 바꿔줘서 넣으면 됩니다!
// 표시는 < , > 이거도 바꾸는 거라 넣을거면 출력하는 부분에도 같이 넣어주셔야 돼용!
		
		eduStaffSqlMapper.insert(eduDto);
	}
	//프로그램 리스트 출력
	public List<Map<String, Object>> getEduProgList(String searchType, String searchWord){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<EduDto> EduProgList = eduStaffSqlMapper.selectAll(searchType, searchWord); 
		
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
	
	//메인에 프로그램 리스트 출력
	public List<Map<String, Object>> getProgListMain(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<EduDto> eduProgList = eduStaffSqlMapper.selectProgListMain(); 
		
		for(EduDto eduDto : eduProgList) {
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
	public List<Map<String, Object>> getEduApplyList(String searchType, String searchWord){
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<EduApplyDto> EduApplyList = eduStaffSqlMapper.selectAllEduApply(searchType, searchWord);
		
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
	
	//메인에 신청자 리스트 출력
	public List<Map<String, Object>> getApplyListMain(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<EduApplyDto> applyListMain = eduStaffSqlMapper.selectApplyListMain();
		
		for(EduApplyDto eduApplyDto : applyListMain) {
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
	
	
	
	
	//만족도 전체 리스트
	public List<Map<String, Object>> getAllServeyList(String searchType, String searchWord){
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<EduStsfcSurveyDto> allServeyList = eduStaffSqlMapper.selectAllServeyList(searchType, searchWord);
		
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
	//메인에 만족도 리스트
	public List<Map<String, Object>> getServeyListMain(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<EduStsfcSurveyDto> serveyListMain = eduStaffSqlMapper.selectServeyListMain();
		
		for(EduStsfcSurveyDto eduStsfcSurveyDto : serveyListMain) {
			
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
		
		String content = eduDto.getContent();
//      content = content.replaceAll("<", "&lt;");
//      content = content.replaceAll(">", "&gt;");
      
	    content = StringEscapeUtils.escapeHtml4(content);
	    content = content.replaceAll("\n", "<br>");
	    eduDto.setContent(content);

//출력 쪽은 replaceAll 쪽 '', '' 요거 바꿔줘서 넣으면 됩니다!
// 표시는 < , > 이거도 바꾸는 거라 넣을거면 출력하는 부분에도 같이 넣어주셔야 돼용!
		
		
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
		
		String content = eduDto.getContent();
//      content = content.replaceAll("<", "&lt;");
//      content = content.replaceAll(">", "&gt;");
      
	    content = StringEscapeUtils.escapeHtml4(content);
	    content = content.replaceAll("<br>", "\n");
	    eduDto.setContent(content);

//출력 쪽은 replaceAll 쪽 '', '' 요거 바꿔줘서 넣으면 됩니다!
// 표시는 < , > 이거도 바꾸는 거라 넣을거면 출력하는 부분에도 같이 넣어주셔야 돼용!
		
		
		
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
