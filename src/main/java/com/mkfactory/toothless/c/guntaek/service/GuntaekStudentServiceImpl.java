package com.mkfactory.toothless.c.guntaek.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.guntaek.mapper.GuntaekStudentSqlMapper;

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
		
	public void registerCertification(AjdksCertificationDto certificationDto) {
		guntaekstudentSqlMapper.registerCertification(certificationDto);
	}
	
	public List<AjdksCertificationDto> getCertificationByStudentPk(int student_pk){
		return guntaekstudentSqlMapper.getCertificationByStudentPk(student_pk);
	}
}
