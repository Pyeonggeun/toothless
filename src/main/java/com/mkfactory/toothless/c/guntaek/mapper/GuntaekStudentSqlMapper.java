package com.mkfactory.toothless.c.guntaek.mapper;

import java.util.List;
import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksInternEduApplying;
import com.mkfactory.toothless.c.dto.AjdksInternEduProgramDto;
import com.mkfactory.toothless.c.dto.AjdksInternEduReviewDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionImgDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface GuntaekStudentSqlMapper {

	// 이력서 Dto insert
	public void registerSelfIntroduction(AjdksSelfIntroductionDto selfIntroductionDto);
	
	// 특정 학생키에 따른 이력서 개수
	public int countSelfIntroduction(int student_pk);
	
	// 특정 학생키에 따른 이력서 Dto 얻기
	public AjdksSelfIntroductionDto getSelfIntroductionDto(int student_pk);
	
	// 특정 학생키로 이력서 답변 수정
	public void updateSelfIntroductionDto(AjdksSelfIntroductionDto selfIntroductionDto);

	// 모든 학생 이력서 DTO 리스트 얻기
	
	public List<AjdksSelfIntroductionDto> getSelfIntroductionDtoList();
	
	// 자격증 Dto insert
	public void registerCertification(AjdksCertificationDto certificationDto);
	
	// 특정 학생 자격증 Dto 리스트 가져오기
	public List<AjdksCertificationDto> getCertificationByStudentPk (int student_pk);
	
	// 특정 파일 이름으로 자격증 Dto 삭제
	public void deleteCertificationByFile(String FileName);

	
	// 특정 학생키를 통하여 학생 Dto 가져오기(괜히 만듬)
	public StudentInfoDto getStudentDto(int student_pk);
	
	// 특정 전공키를 통하여 전공 이름 가져오기
	public String getDepartmentName(int department_pk);
	
	// 특정 교수키를 통하여 교수 이름만 가져오기
	public String getProfessorName(int professor_pk);
	
	// 특정 학생키를 이용하여 학기 얻어오기
	public int getStudentSemester(int student_pk);
	
	
	// 이력서 사진DTO 쪽
	
	// 이력서 이미지 Dto insert
	public void registerIntroductionImage(AjdksSelfIntroductionImgDto ImageDto);
	// 이미지 pk 리턴
	public int getIntroduction_img_pk();
	
	// 자기소개서Dto의 이력서 사진코드 업데이트 하기
	public void updateIntroduction(AjdksSelfIntroductionDto selfIntroductionDto);
	
	
	// 이력서 사진 링크 가져오기
	public String getSelfIntroductionFile(int self_introduction_img_pk);
	
	
	// ----------------------------------------여기서 부터 교육프로그램 쿼리 Mapper --------------------------------------------------
	
	// 교육프로그램 프로그램 신청하기 insert 
	public void RegisterProgramProcess(AjdksInternEduApplying EduApplying);
	
	// 프로그램이 신청 됬는지 안되었는지 리턴한 값으로 판단할거다
	public AjdksInternEduApplying programToApply(AjdksInternEduApplying EduApplying);
	
	// 프로그램이 마감 됬는지 안되었는지 리턴되면 마감이 된거다.
	public AjdksInternEduProgramDto deadProgram(int internedu_program_pk);

	// 특정 학생이 신청했던 모든 신청 프로그램 리스트들.
	public List<AjdksInternEduApplying> applyProgramListByStudent(int student_pk);
	
	// 특정 학생이 이수한 프로그램들.
	public List<AjdksInternEduProgramDto> programListByStudent(int student_pk);
	
	// 특정 프로그램에 신청한 인원 수
	public int getCountPeopleOfProgram(int internedu_program_pk);
	
	// 프로그램 리뷰
	public void registerProgramReview(AjdksInternEduReviewDto review);

	// 프로그램 신청 고유키 가져오기
	public int getApplyKey(AjdksInternEduApplying apply);
	
	public AjdksInternEduReviewDto getCheckReview(int internedu_applying_pk);
}
