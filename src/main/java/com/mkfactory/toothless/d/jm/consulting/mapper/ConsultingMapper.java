package com.mkfactory.toothless.d.jm.consulting.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.d.dto.HopeJobCategoryDto;
import com.mkfactory.toothless.d.dto.HopeJobDto;
import com.mkfactory.toothless.d.dto.HopeJobFeedbackDto;
import com.mkfactory.toothless.d.dto.JobFieldCategoryDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingReplyDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface ConsultingMapper {
	
	
	//학생 구직희망신청 중복확인
	public int checkOverlapHopeJobApply(int student_pk);	
	
	//학생 구직희망신청 정보 입력
	public void insertHopeJobApply(HopeJobDto par);
	
	
	
	
	//학생 온라인상담 중복 확인용
	//학생 가장 최근 온라인 상담 내역 추출
	public OnlineConsultingDto getLastOnConsulting(int student_pk);

	//특정 온라인 상담 답글 확인 
	public OnlineConsultingReplyDto checkOnConsultingReply(int on_consulting_pk);
	
	
	//학생 온라인상담 정보입력
	public void insertOnlineConsulting(OnlineConsultingDto par);
	//학생 온라인상담 최근 구직희망 신청서 출력
	public HopeJobDto getLastHopejob(int student_pk);
	//학생 진행중 구직희망 프로그램 출력
	public HopeJobDto getProgressHopejob(int student_pk);	
	//학생 최근 온라인상담 10건 뽑아오기(추후건수 변경가능)
	public List<OnlineConsultingDto> getOnlineConsultingList (int hope_job_pk);
	
	
	
	
	//학생 온라인상담 자세히보기용 페이지 출력
	public OnlineConsultingDto getOnlineConsultingByPk(int ON_CONSULTING_PK);
	public OnlineConsultingReplyDto getOnConsultingReplyByOnPk(int ON_CONSULTING_PK);
	//교직원 pk로 교직원 정보추출
	public StaffInfoDto getStaffInfoByPk(int STAFF_PK);
		

	
	
	
	
	//만족도조사 값입력
	public void insertHopeJobFeedback(HopeJobFeedbackDto par);
	//특정학생의 미응답 만족도조사 갯수
	public int countUnAnsweredHJF(int STUDENT_PK);
	//특정학생 만족도조사 미응답의 구직희망정보 리스트
	public List<HopeJobDto> getUnAnsweredHJF(int STUDENT_PK);
	public JobFieldCategoryDto getJobFieldCategoryByPk(int JOB_FIELD_CATEGORY_PK);

	
	
	
	//구직관심분야 신청
	//구직희망신청의 페이지 출력용
	public List<HopeJobCategoryDto> getHopeJobCategoryList(int HOPE_JOB_PK);
	//구직관심분야 등록
	public void insertHopeJobCategory(HopeJobCategoryDto par);
	//구직관심 분야키로 뽑기
	public HopeJobCategoryDto getHopeJobCategory(HopeJobCategoryDto par);
	//구직관심 삭제
	public void deleteHopeJobCategory(int HOPE_JOB_CATEGORY_PK);
	
	
	
	
	
	//교직원 화면출력용
	//미응답 온라인 상담 최근 5개 오래된순으로 꺼내오기
	public List<OnlineConsultingDto > getOnConsultingList();
	//구직희망신청번호로 구직희망 정보 뽑기
	public HopeJobDto getHopeJobByPk(int HOPE_JOB_PK);
	//student_pk로 학생정보 뽑기
	public StudentInfoDto getStudentInfoByPk(int STUDENT_PK);
	
	
	//교직원 온라인상담 답글입력
	public void insertOnlineConsultingReply(OnlineConsultingReplyDto par);
	
	//온라인상담 오래된순 전체출력
	public List<OnlineConsultingDto> getHopeJobListAll();
	
	//구직희망pk로 학생정보 뽑기
	public StudentInfoDto getStudentInfoByHopeJobPk(int HOPE_JOB_PK);
	
	
	
	

}
