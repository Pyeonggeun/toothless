package com.mkfactory.toothless.d.jm.consulting.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.HopeJobDto;
import com.mkfactory.toothless.d.dto.HopeJobFeedbackDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingReplyDto;
import com.mkfactory.toothless.d.jm.consulting.mapper.ConsultingMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class ConsultingService {
	
	@Autowired
	private ConsultingMapper consultingMapper ;
	
	
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
	
	//학생 최근 온라인상담 뽑아오기 (구직희망 메인페이지 출력용)
	public Map<String, Object> lastOnlineConsulting(int student_pk){
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//학생정보 뽑기
		StudentInfoDto studentInfoDto = consultingMapper.getStudentInfoByPk(student_pk);
		//가장 최근 온라인상담 정보
		OnlineConsultingDto onlineConsultingDto = consultingMapper.getLastOnConsulting(student_pk);
		
		//일단은 구직희망신청 안했으면 페이지 접근조차 못하므로 if문 안검
		int consulting_pk = onlineConsultingDto.getOn_consulting_pk();
		OnlineConsultingReplyDto onlineConsultingReplyDto = consultingMapper.getOnConsultingReplyByOnPk(consulting_pk);
		
		map.put("studentInfoDto", studentInfoDto);
		map.put("onlineConsultingDto", onlineConsultingDto);
		map.put("onlineConsultingReplyDto", onlineConsultingReplyDto);
		
		
		
		
		return map;
	}
	
	
	//학생 온라인 상담 내역 자세히보기 페이지
	public Map<String, Object> getOnlineConsultingByPk(int ON_CONSULTING_PK){
		
		OnlineConsultingDto onlineConsultingDto = consultingMapper.getOnlineConsultingByPk(ON_CONSULTING_PK);
		OnlineConsultingReplyDto onlineConsultingReplyDto = consultingMapper.getOnConsultingReplyByOnPk(ON_CONSULTING_PK);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(onlineConsultingReplyDto == null) {
			map.put("onlineConsultingDto", onlineConsultingDto);
			map.put("onlineConsultingReplyDto", onlineConsultingReplyDto);

		}
		
		else {
			int staff_pk = onlineConsultingReplyDto.getStaff_pk();
			StaffInfoDto staffInfoDto = consultingMapper.getStaffInfoByPk(staff_pk);
			map.put("staffInfoDto", staffInfoDto);
			map.put("onlineConsultingDto", onlineConsultingDto);
			map.put("onlineConsultingReplyDto", onlineConsultingReplyDto);
			
		}
			
		return map;
	}
	
	
	//학생 최근 상담 10건 꺼내오기(나중에 페이징 처리하자)
	//이 쿼리의 한계 <- 하나의 구직희망신청에서만 온라인 상담 내역 출력가능...
	public List<Map<String, Object>> getOnlineConsultingList (int student_pk){
		
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		HopeJobDto hopeJobDto = consultingMapper.getLastHopejob(student_pk);		
		
		List<OnlineConsultingDto> onlineConsultingDtoList = consultingMapper.getOnlineConsultingList(hopeJobDto.getHope_job_pk());	
		for(OnlineConsultingDto onlineConsultingDto : onlineConsultingDtoList) {
			int on_consulting_pk = onlineConsultingDto.getOn_consulting_pk();
			OnlineConsultingReplyDto onlineConsultingReplyDto = consultingMapper.getOnConsultingReplyByOnPk(on_consulting_pk);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			//상담 답글 안달렸을때에
			if(onlineConsultingReplyDto==null) {
				map.put("onlineConsultingDto", onlineConsultingDto);
				map.put("onlineConsultingReplyDto", false);
				map.put("staffInfoDto", false);
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
	
	
	
	
	
	
	
	
	
	
	
	//교직원 화면 출력용
	//미응답 온라인 상담 최근 5개 오래된순으로 꺼내오기
	public List<Map<String, Object>> getOnConsultingList(){
		
		
		//리턴용 list
		List<Map<String, Object>> temp = new ArrayList<Map<String,Object>>();
		
		//컨설팅dto 5개
		List<OnlineConsultingDto> onlineConsultingDto = consultingMapper.getOnConsultingList();
		
		for(OnlineConsultingDto e : onlineConsultingDto) {
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			
			//온라인 상담 dto에서 구직희망 신청번호 뽑고 구직희망 dto 뽑기
			int hopeJobPk = e.getHope_job_pk();
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
		
	}
	

	
	
}
