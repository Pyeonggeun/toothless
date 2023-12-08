package com.mkfactory.toothless.c.guntaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.guntaek.mapper.GuntaekStudentSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class GuntaekStudentServiceImpl {

	@Autowired
	private GuntaekStudentSqlMapper guntaekstudentSqlMapper;
	
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
}
