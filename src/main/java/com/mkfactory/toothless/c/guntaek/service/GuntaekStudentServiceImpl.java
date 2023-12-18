package com.mkfactory.toothless.c.guntaek.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksInternEduApplying;
import com.mkfactory.toothless.c.dto.AjdksInternEduProgramDto;

import com.mkfactory.toothless.c.dto.AjdksInternEduReviewDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionImgDto;
import com.mkfactory.toothless.c.guntaek.mapper.GuntaekStaffSqlMapper;
import com.mkfactory.toothless.c.guntaek.mapper.GuntaekStudentSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class GuntaekStudentServiceImpl {

	@Autowired
	private GuntaekStudentSqlMapper guntaekstudentSqlMapper;
	@Autowired
	private GuntaekStaffSqlMapper guntaekstaffSqlMapper;
	
	
	// 이력서 insert 
	public void registerSelfIntroduction(AjdksSelfIntroductionDto selfIntroductionDto) {
		guntaekstudentSqlMapper.registerSelfIntroduction(selfIntroductionDto);
	}

	// 이력서 개수 return
	public int countSelfIntroduction(int student_pk) {
		return guntaekstudentSqlMapper.countSelfIntroduction(student_pk);
	}
	
	// 특정학생 키의 이력서 Dto return 
	public AjdksSelfIntroductionDto getselfIntroductionDto(int student_pk) {
		return guntaekstudentSqlMapper.getSelfIntroductionDto(student_pk);
	}
	
	// 특정 학생키로 Dto 답변 수정
	public void updateSelfIntroductionDto(AjdksSelfIntroductionDto selfIntroductionDto) {
		guntaekstudentSqlMapper.updateSelfIntroductionDto(selfIntroductionDto);
	}
		
	
	// 모든 학생의 이력서 DTO 리스트 가져오기
	
	
	public List<AjdksSelfIntroductionDto> getSelfIntroductionDtoList(){
		return guntaekstudentSqlMapper.getSelfIntroductionDtoList();
	}

	// 자격증 기능 시작 
	public void registerCertification(AjdksCertificationDto certificationDto) {
		guntaekstudentSqlMapper.registerCertification(certificationDto);
	}
	
	public List<AjdksCertificationDto> getCertificationByStudentPk(int student_pk){
		return guntaekstudentSqlMapper.getCertificationByStudentPk(student_pk);
	}
	// 특정 파일명으로 자격증Dto 삭제
	public void deleteCertificationByFile(String FileName) {
		guntaekstudentSqlMapper.deleteCertificationByFile(FileName);
	}
	
	// 특정 학생키로 학생 DTO 가져오기 (괜히 만듬)
	public StudentInfoDto getStudentDto(int student_pk) {
		return guntaekstudentSqlMapper.getStudentDto(student_pk);
	}
	
	public String getDepartmentName(int department_pk) {
		return guntaekstudentSqlMapper.getDepartmentName(department_pk);	
	}
	
	public String getProfessorName(int professor_pk) {
		return guntaekstudentSqlMapper.getProfessorName(professor_pk);
	}
	
	public int getStudentSemester(int student_pk) {
		return guntaekstudentSqlMapper.getStudentSemester(student_pk);
	}
	
	// 이력서 사진 insert 함과 동시에 자기소개서 이력서사진pk 업데이트
	public void registerIntroductionImg(AjdksSelfIntroductionImgDto ImageDto, int student_pk) {
		
		int img_pk = guntaekstudentSqlMapper.getIntroduction_img_pk();
		// 1씩증가하는 img_pk sequence 호출 
		
		ImageDto.setSelf_introduction_img_pk(img_pk);
		// 매개변수 Dto 프라이머리 키 세팅
		 
		guntaekstudentSqlMapper.registerIntroductionImage(ImageDto); 
		// 이력서 사진 Dto insert 했다.		
		// 새로운 자기소개서 Dto 만들고
		AjdksSelfIntroductionDto selfIntroductionDto = new AjdksSelfIntroductionDto();
		
		// 거기다가 새로운 값들을 다 받아와서 설정해주었다.
		selfIntroductionDto.setStudent_pk(student_pk);
		selfIntroductionDto.setSelf_introduction_img_pk(img_pk);
		
		// 그리고 그 값들을 통해 현재 로그인한 자기소개서 Dto를 수정해 주겠다.
		guntaekstudentSqlMapper.updateIntroduction(selfIntroductionDto);
	}
	// 이력서 이미지 고유번호를 통해 이미지 링크 얻어오기
	public String getSelfIntroductionFile(int self_introduction_img_pk) {
		return guntaekstudentSqlMapper.getSelfIntroductionFile(self_introduction_img_pk);
	}
	// ********************* 교육 프로그램 기능 ****************************************
	// 교육 프로그램 insert 하기
	public void RegisterProgramProcess(AjdksInternEduApplying EduApplying) {
		guntaekstudentSqlMapper.RegisterProgramProcess(EduApplying);
	}
	// 교육 프로그램 리턴 ( 신청 했는지 안했는지)
	public AjdksInternEduApplying programToApply(AjdksInternEduApplying EduApplying) {
		return guntaekstudentSqlMapper.programToApply(EduApplying);
	}
	// 교육 프로그램 마감됬는지 안됬는지
	public AjdksInternEduProgramDto deadProgram(int internedu_program_pk) {
		return guntaekstudentSqlMapper.deadProgram(internedu_program_pk);
	}
	// 특정 학생이 신청했던 교육 프로그램 리스트들 + 그 프로그램의 정보들 을 합치겠다. (자료구조로)
	public List<Map<String,Object>> applyprogramListByStudent(int student_pk) {
		List<Map<String,Object>> list = new ArrayList<>();
		List<AjdksInternEduApplying> EduApplying =  guntaekstudentSqlMapper.applyProgramListByStudent(student_pk);	
		
		for(AjdksInternEduApplying applyDto : EduApplying) {
			
			Map<String,Object> map = new HashMap<>();
			map.put("applyDto", applyDto); // 교육 
			
			int program_pk = applyDto.getInternedu_program_pk();
			
			int apply_pk = applyDto.getInternedu_applying_pk();
			
			AjdksInternEduReviewDto reviewDto = guntaekstudentSqlMapper.getCheckReview(apply_pk);
			
			
			map.put("EduProgramDto",guntaekstaffSqlMapper.getEduProgramByPk(program_pk));			// 교육키를 갖고와서 프로그램 Dto 가져오기			
			
			map.put("getCountPeople", guntaekstudentSqlMapper.getCountPeopleOfProgram(program_pk)); 
			// 특정 프로그램에 신청한 사람들의 수 엮기			
			
			
			// 리뷰 등록 여부 확인
			map.put("reviewDto", reviewDto);
			
			
			list.add(map);
		}	
		return list;
	}
	
	// 특정 학생이 신청한 프로그램 리스트
	public List<Map<String,Object>> programListByStudent(int student_pk){
		List<Map<String,Object>> list = new ArrayList<>();
		
		
		List<AjdksInternEduProgramDto> eduList = guntaekstudentSqlMapper.programListByStudent(student_pk);
		
		for(AjdksInternEduProgramDto eduDto : eduList) {
			Map<String,Object> map = new HashMap<>();
			
			AjdksInternEduApplying apply = new AjdksInternEduApplying();
			apply.setStudent_pk(student_pk);
			apply.setInternedu_program_pk(eduDto.getInternedu_program_pk());
			
			int applying_pk = guntaekstudentSqlMapper.getApplyKey(apply);
			
			map.put("eduList", eduDto);
			map.put("checkList",guntaekstudentSqlMapper.getCheckReview(applying_pk));
			list.add(map);
		}
		
		return list;
	}
	// 프로그램 리뷰 등록
	public void registerProgramReview(AjdksInternEduReviewDto review) {
		guntaekstudentSqlMapper.registerProgramReview(review);
	}

	public int getApplyKey(AjdksInternEduApplying apply) {
		return guntaekstudentSqlMapper.getApplyKey(apply);
	}
}

