package com.mkfactory.toothless.d.sb.resume.mapper;

import java.util.List;

import com.mkfactory.toothless.d.dto.CareerCategoryDto;
import com.mkfactory.toothless.d.dto.CareerDto;
import com.mkfactory.toothless.d.dto.LicenseDto;
import com.mkfactory.toothless.d.dto.ResumeDto;

public interface ResumeSqlMapper {

	// 이력서등록
	public void insertResumeDto(ResumeDto resumeDto);
	
	// 로그인 학생의 이력서 가져오기
	public List<ResumeDto> getResumeListByStudentPk(ResumeDto resumeDto);
	
	// 메인이력서로 새이력서 등록시 기존이력서 변경
	public void changeMainAndPublic(ResumeDto resumeDto);
	
	// 기본이력서 메인으로 변경시
	public void changeMainResume(ResumeDto resumeDto);
	
	// 이력서 공개하기
	public void changePublicResume(ResumeDto resumeDto);
	
	// 이력서 비공개하기
	public void changePrivateResume(ResumeDto resumeDto);
	
	// 이력서 상세보기
	public ResumeDto getThisResumeDtoByResumePk(ResumeDto resumeDto);
	
	// 이력서 내용 수정
	public void updateResumeDtoByResumePk(ResumeDto resumeDto);
	
	
	// 경력 카테고리가져오기
	public List<CareerCategoryDto> getCareerCategoryList();
	
	// 경력 추가
	public void insertCareerContents(CareerDto careerDto);
	
	// 해당 이력서의 경력 내용 가져오기
	public List<CareerDto> getCareerByResumePk(ResumeDto resumeDto);
	
	// 경력 카테고리 번호로 카테고리 이름 가져오기
	public CareerCategoryDto getCareerCategoryNameByCategoryPk(int category_pk);
	
	// 경력 삭제
	public void deleteCareerByCareerPk(CareerDto careerDto);
	
	// 경력 수정
	public void updateCareerByCareerPk(CareerDto careerDto);
	
	// 자격증 추가
	public void insertLicenseContents(LicenseDto licenseDto);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
