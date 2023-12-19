package com.mkfactory.toothless.d.jm.consulting.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.ConsultingDto;
import com.mkfactory.toothless.d.dto.HopeJobCategoryDto;
import com.mkfactory.toothless.d.dto.HopeJobDto;
import com.mkfactory.toothless.d.dto.HopeJobFeedbackDto;
import com.mkfactory.toothless.d.dto.JobFieldCategoryDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingReplyDto;
import com.mkfactory.toothless.d.jm.consulting.mapper.ConsultingMapper;
import com.mkfactory.toothless.d.ny.posting.mapper.PostingSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class ConsultingService {
	
	@Autowired
	private ConsultingMapper consultingMapper ;
	@Autowired
	private PostingSqlMapper postingSqlMapper ;
	
	
	//학생 pk로 학생정보뽑기
	public StudentInfoDto getStudentInfoByPk(int student_pk) {
		return consultingMapper.getStudentInfoByPk(student_pk);
	}
	
	//학생 구직희망신청 중복 확인
	public boolean checkOverlapHopeJobApply(int student_pk) {
		
		//int값으로 중복여부 확인
		int checkOverlap = consultingMapper.checkOverlapHopeJobApply(student_pk);
		//기존 신청x면 진행, 아니면 등록거부
		boolean isboolean = true;
		if (checkOverlap==0) {
			isboolean = false;
			//false가 진행 가능
		}
		else if(checkOverlap==1) {
			isboolean = true;
		}
		else {
			System.out.println("학생 구직희망신청 중복확인 버그터짐");
			isboolean = true;
		}
		return isboolean;
	}
	
	
	//학생 구직희망신청 정보 입력
	public void insertHopeJobApply(HopeJobDto par) {
		consultingMapper.insertHopeJobApply(par);
	}
	
	
	
	
	
	//학생 온라인 상담 가능한지 여부
	public boolean isOnlineconsulting(int student_pk) {
		OnlineConsultingDto onlineConsultingDto = consultingMapper.getLastOnConsulting(student_pk);
		
		
		
		//아직 온라인 신청0번이면 가능
		if(onlineConsultingDto == null) {
			return true;
		}
		
		//답글 달렸는지 확인
		int on_consulting_pk = onlineConsultingDto.getOn_consulting_pk();
		OnlineConsultingReplyDto onlineConsultingReplyDto = consultingMapper.checkOnConsultingReply(on_consulting_pk);
		
		//
		if(onlineConsultingReplyDto != null) {
			return true;
		}
		else {
			return false;
		}
		
	}
	
	//학생 최근 구직희망 신청서 정보 출력
	public HopeJobDto getLastHopejob(int student_pk) {
		return consultingMapper.getLastHopejob(student_pk);
	}
	
	//학생 온라인상담 정보 입력
	public void insertOnlineConsulting(OnlineConsultingDto par) {
		
		HopeJobDto hopeJobDto = consultingMapper.getLastHopejob(0);
		consultingMapper.insertOnlineConsulting(par);
	}
	
	
	// (구직희망 메인페이지 출력용)
	//학생 최근 온라인상담 뽑아오기
	public Map<String, Object> lastOnlineConsulting(int student_pk){
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//학생정보 뽑기
		StudentInfoDto studentInfoDto = consultingMapper.getStudentInfoByPk(student_pk);
		//가장 최근 온라인상담 정보
		OnlineConsultingDto onlineConsultingDto = consultingMapper.getLastOnConsulting(student_pk);
		
		if(onlineConsultingDto == null) {
			map.put("onlineConsultingReplyDto", null);
		}
		else {
			int consulting_pk = onlineConsultingDto.getOn_consulting_pk();
			OnlineConsultingReplyDto onlineConsultingReplyDto = consultingMapper.getOnConsultingReplyByOnPk(consulting_pk);
			map.put("onlineConsultingReplyDto", onlineConsultingReplyDto);			
		}
		

		
		map.put("studentInfoDto", studentInfoDto);
		map.put("onlineConsultingDto", onlineConsultingDto);
		
		
		
		
		
		return map;
	}
	// (구직희망 메인페이지 출력용)
	// 미응답 만족도조사 갯수
	public int countUnAnsweredHJF(int student_Pk) {
		return consultingMapper.countUnAnsweredHJF(student_Pk);
	}
	// 학생 진행중인 구직희망 정보
	public HopeJobDto getProgressHopejob(int student_pk) {
		return consultingMapper.getProgressHopejob(student_pk);
	}
	
	
	
	
	
	
	//학생 온라인 상담 내역 자세히보기 페이지
	//교직원도 가능
	public Map<String, Object> getOnlineConsultingByPk(int ON_CONSULTING_PK){
		
		StudentInfoDto studentInfoDto = consultingMapper.getStudentInfoByOnPk(ON_CONSULTING_PK);
		OnlineConsultingDto onlineConsultingDto = consultingMapper.getOnlineConsultingByPk(ON_CONSULTING_PK);
		OnlineConsultingReplyDto onlineConsultingReplyDto = consultingMapper.getOnConsultingReplyByOnPk(ON_CONSULTING_PK);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(onlineConsultingReplyDto == null) {
			map.put("onlineConsultingDto", onlineConsultingDto);
			map.put("onlineConsultingReplyDto", onlineConsultingReplyDto);
			map.put("staffInfoDto", onlineConsultingReplyDto); //널값 넣기용
			map.put("studentInfoDto", studentInfoDto);

		}
		
		else {
			int staff_pk = onlineConsultingReplyDto.getStaff_pk();
			StaffInfoDto staffInfoDto = consultingMapper.getStaffInfoByPk(staff_pk);
			map.put("staffInfoDto", staffInfoDto);
			map.put("onlineConsultingDto", onlineConsultingDto);
			map.put("onlineConsultingReplyDto", onlineConsultingReplyDto);
			map.put("studentInfoDto", studentInfoDto);
			
		}
			
		return map;
	}
	
	
	//학생 최근 상담 전부 꺼내오기(나중에 페이징 처리하자)
	//이 쿼리의 한계 <- 하나의 구직희망신청에서만 온라인 상담 내역 출력가능...
	public List<Map<String, Object>> getMyOnlineConsultingList (int student_pk, String isReply){
		
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		HopeJobDto hopeJobDto = consultingMapper.getLastHopejob(student_pk);		
		List<OnlineConsultingDto> onlineConsultingDtoList = consultingMapper.getMyOnlineConsultingList(hopeJobDto.getHope_job_pk(), isReply);
		
		for(OnlineConsultingDto onlineConsultingDto : onlineConsultingDtoList) {
			int on_consulting_pk = onlineConsultingDto.getOn_consulting_pk();
			OnlineConsultingReplyDto onlineConsultingReplyDto = consultingMapper.getOnConsultingReplyByOnPk(on_consulting_pk);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			//상담 답글 안달렸을때에
			if(onlineConsultingReplyDto==null) {
				map.put("onlineConsultingDto", onlineConsultingDto);
				map.put("onlineConsultingReplyDto", onlineConsultingReplyDto);
				map.put("staffInfoDto", null);
			}
			else {
				int staff_pk = onlineConsultingReplyDto.getStaff_pk();
				StaffInfoDto staffInfoDto = consultingMapper.getStaffInfoByPk(staff_pk);
				
				map.put("onlineConsultingDto", onlineConsultingDto);
				map.put("onlineConsultingReplyDto", onlineConsultingReplyDto);
				map.put("staffInfoDto", staffInfoDto);
			}


			list.add(map);
		}
		return list;
	}
	
	//학생 최근 상담 5건
	public List<Map<String, Object>> getMyOnlineConsultingListNumFive (int student_pk, String isReply){
		
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		HopeJobDto hopeJobDto = consultingMapper.getLastHopejob(student_pk);
		if (hopeJobDto==null) {
			return null;
		}
		List<OnlineConsultingDto> onlineConsultingDtoList = consultingMapper.getMyOnlineConsultingListNumFive(hopeJobDto.getHope_job_pk(), isReply);
		
		if (onlineConsultingDtoList==null) {
			return null;
		}
		
		for(OnlineConsultingDto onlineConsultingDto : onlineConsultingDtoList) {
			
			Map<String, Object> map = new HashMap<String, Object>();
//			if(onlineConsultingDto==null) {
//				map.put("onlineConsultingDto", null);
//				map.put("onlineConsultingReplyDto", null);
//				map.put("staffInfoDto", null);	
//				System.out.println("날1ㅂ");
//				continue;
//
//			}
			
			System.out.println("널2");
			int on_consulting_pk = onlineConsultingDto.getOn_consulting_pk();
			OnlineConsultingReplyDto onlineConsultingReplyDto = consultingMapper.getOnConsultingReplyByOnPk(on_consulting_pk);

			
			//상담 답글 안달렸을때에
			if(onlineConsultingReplyDto==null) {

				map.put("onlineConsultingDto", onlineConsultingDto);
				map.put("onlineConsultingReplyDto", onlineConsultingReplyDto);
				map.put("staffInfoDto", null);
			}
			else {
				int staff_pk = onlineConsultingReplyDto.getStaff_pk();
				StaffInfoDto staffInfoDto = consultingMapper.getStaffInfoByPk(staff_pk);
				
				map.put("onlineConsultingDto", onlineConsultingDto);
				map.put("onlineConsultingReplyDto", onlineConsultingReplyDto);
				map.put("staffInfoDto", staffInfoDto);
			}


			list.add(map);
		}
		return list;
	}
	
	
	
	
	
	
	
	
	//만족도조사 값입력
	public void insertHopeJobFeedback(HopeJobFeedbackDto par) {
		consultingMapper.insertHopeJobFeedback(par);
	}
	//미응답 만족도조사 리스트 출력
	public List<HopeJobDto> getUnAnsweredHJFList(int STUDENT_PK){
		
		List<HopeJobDto> hopeJobDtoList = consultingMapper.getUnAnsweredHJFList(STUDENT_PK);

		
		return hopeJobDtoList ;
	}
	
	
	
	
	
	
	
	
	
	
	
	//교직원 화면 출력용
	//미응답 온라인 상담 최근 5개 오래된순으로 꺼내오기
	public List<Map<String, Object>> getOnConsultingInfoListNumFiveASC(){
		
		
		//리턴용 list
		List<Map<String, Object>> temp = new ArrayList<Map<String,Object>>();
		
		//컨설팅dto 5개
		List<OnlineConsultingDto> onlineConsultingDto = consultingMapper.getOnConsultingListNumFiveASC();
		
		for(OnlineConsultingDto e : onlineConsultingDto) {
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			
			//온라인 상담 dto에서 구직희망 신청번호 뽑고 구직희망 dto 뽑기
			int hopeJobPk = e.getHope_job_pk();
			
			//카테고리 정보담기			
			List<Map<String, Object>> categoryList = new ArrayList<Map<String,Object>>();
			for(Map<String, Object> d : consultingMapper.getHopeJobCategoryByHopeJobPk(hopeJobPk)) {
				Map<String, Object> hopeJobCategory = d ;
				categoryList.add(hopeJobCategory);
			}
			map.put("categoryList", categoryList);
			
			HopeJobDto hopeJobDto = consultingMapper.getHopeJobByPk(hopeJobPk);
			
			//구직희망 신청번호에서 학생pk뽑고 학생정보 갖고오기
			int student_pk = hopeJobDto.getStudent_pk();
			StudentInfoDto studentInfoDto = consultingMapper.getStudentInfoByPk(student_pk);
			
			
			map.put("onlineConsultingDto", e);
			map.put("hopeJobDto", hopeJobDto);
			map.put("studentInfoDto", studentInfoDto);
			//나중에 구직관심 도 추가해야함
			
			temp.add(map);
		}
		
		
		return temp;
	}
	
	
	//교직원 온라인상담 답글입력
	public void insertOnlineConsultingReply(OnlineConsultingReplyDto par) {
		consultingMapper.insertOnlineConsultingReply(par);
	}
	//구직관심 등록 및 등록 페이지 관련
	//채용분야 카테고리 출력
	public List<Map<String, Object>> selectJobFieldCategoryList(HopeJobCategoryDto par){
		
		//
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		//전체카테고리
		List<JobFieldCategoryDto> jobFieldCategoryDtoList = postingSqlMapper.selectJobFieldCategoryList();
		
		//전체카테고리로 내 구직관심목록에 해당 분야 있는지 확인
		for(JobFieldCategoryDto jobFieldCategoryDto : jobFieldCategoryDtoList) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int jopFieldCategoryPk = jobFieldCategoryDto.getJob_field_category_pk();
			par.setJob_field_category_pk(jopFieldCategoryPk);
			
			int hope_job_pk = par.getHope_job_pk();
			
			//테이블에 해당 분야 있는지 확인
			HopeJobCategoryDto hopeJobCategoryDto = consultingMapper.getHopeJobCategory(par);
			
			//없으면 false값
			if(hopeJobCategoryDto==null) {
				map.put("jobFieldCategoryDto", jobFieldCategoryDto);
				map.put("isBoolean", false);
			}
			
			else {
				map.put("jobFieldCategoryDto", jobFieldCategoryDto);
				map.put("isBoolean", true);
			}
			
			list.add(map);
		}
		
		
		return list;
	}
	//현재 구직pk의 구직관심분야 리스트 출력
	public List<Map<String, Object>> getHopeJobCategoryList(int HOPE_JOB_PK){
		
		
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<HopeJobCategoryDto> hopeJobCategoryDtoList = consultingMapper.getHopeJobCategoryList(HOPE_JOB_PK);
		if(hopeJobCategoryDtoList.size()==0) {
			return list;
		}
		
		for(HopeJobCategoryDto hopeJobCategoryDto : hopeJobCategoryDtoList) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int jobFieldCategoryPk = hopeJobCategoryDto.getJob_field_category_pk();			
			JobFieldCategoryDto jobFieldCategoryDto = consultingMapper.getJobFieldCategoryByPk(jobFieldCategoryPk);
			
			map.put("hopeJobCategoryDto", hopeJobCategoryDto);
			map.put("jobFieldCategoryDto", jobFieldCategoryDto);
			
			list.add(map);
			
			
			
		}
		
		return list;
	}
	
	//구직관심분야 등록
	public void insertHopeJobCategory(int hopeJobPk, int[] job_field_category_pk) {
		
		for(int e : job_field_category_pk) {
			HopeJobCategoryDto hopeJobCategoryDto = new HopeJobCategoryDto();
			hopeJobCategoryDto.setJob_field_category_pk(e);
			hopeJobCategoryDto.setHope_job_pk(hopeJobPk);
			consultingMapper.insertHopeJobCategory(hopeJobCategoryDto);
		}		
	}
	//구직관심분야 삭제
	public void deleteHopeJobCategory(int[] HOPE_JOB_CATEGORY_PK) {
		
		for(int e : HOPE_JOB_CATEGORY_PK) {
			consultingMapper.deleteHopeJobCategory(e);	
		}		
	}
	
	
	
	
	//교직원쪽
	//온라인상담 오래된순 싹 출력 + 검색 및 정렬 추가
	//교직원 페이지에서 온라인상담 관련 정보 보기위함
	public List<Map<String, Object>> getOnlineConsultingList(String isReply, String sortby, String searchType, String searchContents, int pageNum){
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		//온라인상담 내역 싹 다 + 검색 및 정렬 추가
		List<OnlineConsultingDto> onlineConsultingDtoList = consultingMapper.getOnlineConsultingList(isReply, sortby,searchType,searchContents, pageNum);
		
		
		for(OnlineConsultingDto onlineConsultingDto : onlineConsultingDtoList) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int hopeJobPk = onlineConsultingDto.getHope_job_pk();
			//구직희망pk로 뽑은 학생정보
			StudentInfoDto studentInfoDto = consultingMapper.getStudentInfoByHopeJobPk(hopeJobPk);
			
			//응답/미응답 확인
			int on_consulting_pk = onlineConsultingDto.getOn_consulting_pk();
			OnlineConsultingReplyDto dto = consultingMapper.checkOnConsultingReply(on_consulting_pk);
			if(dto==null) {
				map.put("isReply", false);
				
			}
			
			else {
				map.put("isReply", true);
			}
			
			
			
			
			map.put("onlineConsultingDto", onlineConsultingDto);
			map.put("studentInfoDto", studentInfoDto);
			
			list.add(map);
		}
		
		
		return list;
	}
	
	//온라인상담 글 총 갯수
	public Map<String, Object> countTotalBoardNumInSOC (String isReply, String sortby, String searchType, String searchContents, int pageNum) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//글 총갯수
		int totalBoardNumInSOC = consultingMapper.countTotalBoardNumInSOC(isReply, sortby, searchType, searchContents);
		
		//글 총 페이지
		int totalPageNumInSOC = (int)Math.ceil(totalBoardNumInSOC/(double)10);
		//화면상 첫/마지막 페이지
		int startPageNumber = ((pageNum-1)/5)*5+1;
		int endPageNumber = ((pageNum-1)/5+1)*5;
		
		//짜르기
		if(endPageNumber > totalPageNumInSOC) {
			endPageNumber = totalPageNumInSOC;
		}
		
		map.put("currentPageNum", pageNum);
		map.put("totalPageNumInSOC", totalPageNumInSOC);
		map.put("startPageNumber", startPageNumber);
		map.put("endPageNumber", endPageNumber);
		
		
		
		return map;
	}
	
	
		
	//교직원입장에서 구직희망 진행중인 학생 리스트 보기
	//구직희망 - 학생엮음, 구직희망pk당 학생 정보
	public List<Map<String, Object>> getHopeJobInfoList(){		
		//진행중 구직희망 리스트
		List<HopeJobDto> hopeJobDtoList = consultingMapper.getOngoingHopeJobList();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for(HopeJobDto hopeJobDto : hopeJobDtoList) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			//학생정보
			int student_pk=hopeJobDto.getStudent_pk();
			int unAnsweredHJF = consultingMapper.countUnAnsweredHJF(student_pk);
			StudentInfoDto studentInfoDto = consultingMapper.getStudentInfoByPk(student_pk);
			
			//미응답 만족도 조사 갯수
			
			map.put("studentInfoDto", studentInfoDto);
			map.put("hopeJobDto", hopeJobDto);
			map.put("unAnsweredHJF", unAnsweredHJF);
			
			
			list.add(map);
		}
		return list;
	}
	
	
	//교직원 페이지 학생 자세히보기 관련 정보
	public Map<String, Object> viewStudentDetailPageInfo(int HOPE_JOB_PK){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//구직희망정보
		HopeJobDto hopeJobDto = consultingMapper.getHopeJobByPk(HOPE_JOB_PK);
		int student_pk = hopeJobDto.getStudent_pk();
		//학생정보
		StudentInfoDto studentInfoDto = consultingMapper.getStudentInfoByHopeJobPk(HOPE_JOB_PK);
		
		//취업상담 내역(갯수)
		int countConsultingByHopeJobPk = consultingMapper.countConsultingByHopeJobPk(HOPE_JOB_PK);
		int countOnConsultingByHopeJobPk = consultingMapper.countOnConsultingByHopeJobPk(HOPE_JOB_PK);
		int countUnAnsweredFeedback = consultingMapper.countUnAnsweredHJF(student_pk);
		
		map.put("countConsultingByHopeJobPk", countConsultingByHopeJobPk);
		map.put("countOnConsultingByHopeJobPk", countOnConsultingByHopeJobPk);
		map.put("hopeJobDto", hopeJobDto);
		map.put("studentInfoDto", studentInfoDto);
		map.put("countUnAnsweredFeedback", countUnAnsweredFeedback);

		
		return map;
	}
	
	
	//취업상담 정보입력
	public void insertConsultingInfo(ConsultingDto par) {
		consultingMapper.insertConsultingInfo(par);
	}
	
	//학생정보/구직희망정보 담은 만족도 리스트 전체
	public List<Map<String, Object>> getHopeJobFeedbackListAll(String sortHJFScore){
		
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<HopeJobFeedbackDto> hopeJobFeedbackDtoList = consultingMapper.getHopeJobFeedbackListAll(sortHJFScore);
		for(HopeJobFeedbackDto hopeJobFeedbackDto : hopeJobFeedbackDtoList) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			int hope_job_pk = hopeJobFeedbackDto.getHope_job_pk();

			HopeJobDto hopeJobDto = consultingMapper.getHopeJobByPk(hope_job_pk);
			int studetn_pk = hopeJobDto.getStudent_pk();
			StudentInfoDto studentInfoDto = consultingMapper.getStudentInfoByPk(studetn_pk);

			map.put("hopeJobFeedbackDto", hopeJobFeedbackDto);
			map.put("hopeJobDto", hopeJobDto);
			map.put("studentInfoDto", studentInfoDto);
			list.add(map);
		}
		return list;
	}
	//만족도조사 평균평점
	public Integer avgHopeJobFeedbackScore() {
		Integer vaule = consultingMapper.avgHopeJobFeedbackScore();
		return vaule; 
				
	}
	
	//만족도조사 디테일페이지
	public Map<String, Object> HopeJobFeedbackDetailInfo(int hope_job_feedback_pk){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		HopeJobFeedbackDto hopeJobFeedbackDto = consultingMapper.getHopeJobFeedbackByPk(hope_job_feedback_pk);
		int hope_job_pk = hopeJobFeedbackDto.getHope_job_pk();
		
		StudentInfoDto studentInfoDto = consultingMapper.getStudentInfoByHopeJobPk(hope_job_pk);
		
		map.put("hopeJobFeedbackDto", hopeJobFeedbackDto);
		map.put("studentInfoDto", studentInfoDto);
		
		return map;
	}
	
	//특정 학생pk로 구직희망정보와 학생정보 뽑아오기
	public Map<String, Object> studentAndHopeJobInfoByStudentPk(int student_pk){
		
		Map<String, Object> map = new HashMap<String, Object>();
		StudentInfoDto studentInfoDto = consultingMapper.getStudentInfoByPk(student_pk);
		HopeJobDto hopeJobDto = consultingMapper.getProgressHopejob(student_pk);
		
		map.put("hopeJobDto", hopeJobDto);
		map.put("studentInfoDto", studentInfoDto);
		
		return map;
		
	}
	
	//구직희망수정
	public void updateHopeJobProcess(HopeJobDto par) {
		consultingMapper.updateHopeJobProcess(par);
	}
	//구직희망종료
	public void endHopeJobProcess(int hope_jop_pk) {
		consultingMapper.endHopeJobProcess(hope_jop_pk);
	}
	
	//메인페이지 출력용 구직희망 신청 최근5건
	public List<Map<String, Object>> getHopeJobInfoNumFive(){
		
		return consultingMapper.getHopeJobInfoNumFive();
	}
	
	

	
}
