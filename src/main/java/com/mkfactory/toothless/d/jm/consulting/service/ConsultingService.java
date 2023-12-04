package com.mkfactory.toothless.d.jm.consulting.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.HopeJobDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingReplyDto;
import com.mkfactory.toothless.d.jm.consulting.mapper.ConsultingMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class ConsultingService {
	
	@Autowired
	private ConsultingMapper consultingMapper ;
	
	
	//학생 구직희망신청 중복 확인
	public boolean checkOverlapHopeJobApply(int student_pk) {
		
		//int값으로 중복여부 확인
		int checkOverlap = consultingMapper.checkOverlapHopeJobApply(student_pk);
		//기존 신청x면 진행, 아니면 등록거부
		boolean isboolean = true;
		if (checkOverlap==0) {
			isboolean = false;
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
