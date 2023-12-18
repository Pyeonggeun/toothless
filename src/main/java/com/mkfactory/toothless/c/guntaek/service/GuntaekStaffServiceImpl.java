package com.mkfactory.toothless.c.guntaek.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksInternEduApplying;
import com.mkfactory.toothless.c.dto.AjdksInternEduProgramDto;
import com.mkfactory.toothless.c.dto.AjdksInternEduReviewDto;
import com.mkfactory.toothless.c.guntaek.mapper.GuntaekStaffSqlMapper;
import com.mkfactory.toothless.c.guntaek.mapper.GuntaekStudentSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class GuntaekStaffServiceImpl {

	
	@Autowired
	private GuntaekStaffSqlMapper guntaekstaffSqlMapper;
	
	@Autowired
	private GuntaekStudentSqlMapper guntaekstudentSqlMapper;
	
	// 교육 프로그램 등록하기.
	public void registerEduProgram(AjdksInternEduProgramDto eduProgramDto) {
		guntaekstaffSqlMapper.registerEduProgram(eduProgramDto);
	}
	
	// 특정 교육 프로그램 삭제하기.
	public void deleteProgramByStaff(int internedu_program_pk) {
		guntaekstaffSqlMapper.deleteProgramByStaff(internedu_program_pk);
		
	}
	
	// 교육 프로그램 조회하는 리스트 가져오는 서비스 (전체 + 담당자가 작성한 리스트를 맵으로 엮어올거임 사실상 inner join이다.)
	public List<Map<String,Object>> getListEduProgramAll() {
		List<Map<String,Object>> list = new ArrayList<>();
		// 리턴할 List<Map<String,Object>>
		List<AjdksInternEduProgramDto> allEduProgramList = guntaekstaffSqlMapper.getListEduProgram();
		// 모든 교육 프로그램 리스트 얻어오기.
		
		// 모든 교육 프로그램 리스트를 반복하면서 그것에 해당하는 StaffDto도 가져온다.
		for (AjdksInternEduProgramDto eduProgram : allEduProgramList) {
			Map<String,Object> map = new HashMap<>();
			map.put("eduDto", eduProgram);
			map.put("staffDto", guntaekstaffSqlMapper.getStaffDtoByStaff(eduProgram.getStaff_pk()));
			list.add(map);		
		}
		// 태호형님과 강사님의 정석대로라면	
		// INNER JOIN 자체를 여기서 한다. 즉 STAFFDTO와 EDUDTO를 PK로 묶어버리는	
		return list;
	}
	
	// 특정 교육pk에 해당하는 교육 Dto 얻어오기
	public AjdksInternEduProgramDto getEduDto(int program_pk) {
		return guntaekstaffSqlMapper.getEduProgramByPk(program_pk);
	}
	
	// 특정 담당자 pk에 해당하는 담당자 Dto 얻어오기
	public StaffInfoDto getStaffDto(int staff_pk) {
		return guntaekstaffSqlMapper.getStaffDtoByStaff(staff_pk);
	}
	
	// 마감된 교육 프로그램, 모집중인 프로그램을 가져오고 둘다 Return 하기
	public Map<String,Object> allProgram(){
		List<AjdksInternEduProgramDto> deadLineProgram = guntaekstaffSqlMapper.getDeadLineProgram();
		List<AjdksInternEduProgramDto> recruitingProgram = guntaekstaffSqlMapper.getRecruitingProgram();
		
		Map<String,Object> map = new HashMap<>();
		map.put("deadProgram", deadLineProgram);
		map.put("recrueProgram", recruitingProgram);
		// 이제 Map에 배열이 2개 들어간다.
		
		// 그 배열 2개가 들어간 map을 또 list로 감싼다. (2중 배열)
		return map;
	}
	// 특정 담당자가 등록한 프로그램 리스트로 가져오기
	public List<AjdksInternEduProgramDto> getEduProgramByStaff(int staff_pk){
		return guntaekstaffSqlMapper.getEduProgramByStaff(staff_pk);
	}
	
	// 특정 프로그램을 듣는 학생 Dto와 프로그램 신청 Dto를 엮어서 가져오는 Service (사실상 inner Join)
	public List<Map<String,Object>> getEduProgramAppStudentList(int internedu_program_pk){
		List<Map<String,Object>> list = new ArrayList<>(); 
		
		// 일단 특정 프로그램 키를 통해 프로그램 신청한 Dto 얻어오기
		
		List<AjdksInternEduApplying> ApplyingList = guntaekstaffSqlMapper.getInternEduApplyingByProgram(internedu_program_pk);
		// 특정 프로그램에 신청한 신청Dto 리스트
		
		// 받아온 신청 Dto 리스트를 반복한다. 반복하면서 얻은 학생 pk를 통해 inner 조인 한다. 즉 신청 Dto + 학생 = 
		// 특정 교육프로그램에 신청한 학생들 Dto임
		for (AjdksInternEduApplying appDto : ApplyingList) {
			Map<String,Object> map = new HashMap<>();
			
			map.put("aDto", appDto);
			map.put("sDto", guntaekstudentSqlMapper.getStudentDto(appDto.getStudent_pk()));
			list.add(map);
		}
		return list;
	}
	
	
	public void updateInternEduComplete(AjdksInternEduApplying eduApply) {
		guntaekstaffSqlMapper.updateInternEduComplete(eduApply);
	}
	
	
	// 특정 담당자가 등록한 프로그램 + 그것에 해당하는 평점 리스트로 가져오기
	public List<Map<String,Object>> getEduDtoWithRating(int staff_pk) {
		
		List<Map<String,Object>> list = new ArrayList<>();
		
		List<AjdksInternEduProgramDto> Programlist = guntaekstaffSqlMapper.getEduProgramByStaff(staff_pk);
		// 특정 담당자의 프로그램 리스트들을 얻고
		
		
		
		for (AjdksInternEduProgramDto a : Programlist) {
			int internedu_program_pk = a.getInternedu_program_pk();	
			// 그 프로그램 리스트들의 pk 를 얻어 넣어준다.
			Map<String,Object> map = new HashMap<>();
			map.put("programList", a);
			
			map.put("rating",guntaekstaffSqlMapper.getProgramRatingByProgramPk(internedu_program_pk));
			list.add(map);
		}
		return list;
		
	}
	
	public List<AjdksInternEduReviewDto> getReviewDtoListByProgramPk(int internedu_program_pk) {
		return guntaekstaffSqlMapper.getReviewDtoListByProgramPk(internedu_program_pk);
	}
	public void deleteProgramReview(int INTERNEDU_REVIEW_PK) {
		guntaekstaffSqlMapper.deleteProgramReview(INTERNEDU_REVIEW_PK);
	}
}
