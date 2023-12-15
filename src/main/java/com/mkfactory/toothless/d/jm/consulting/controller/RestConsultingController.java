package com.mkfactory.toothless.d.jm.consulting.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.d.dto.D_RestResponseDto;
import com.mkfactory.toothless.d.dto.HopeJobCategoryDto;
import com.mkfactory.toothless.d.dto.HopeJobDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingDto;
import com.mkfactory.toothless.d.jm.consulting.service.ConsultingService;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@RestController
@RequestMapping("/tl_d/jm_consulting/*")
public class RestConsultingController {

	@Autowired
	private ConsultingService consultingService;
	
	//학생 본인 상담 리스트 출력
	@RequestMapping("reloadMyOnlineConsultingList")
	public D_RestResponseDto reloadMyOnlineConsultingList(HttpSession session, Model model,
			@RequestParam(value="isReply", defaultValue="all") String isReply				
			) {
		
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();		
		List<Map<String, Object>> list = consultingService.getMyOnlineConsultingList(student_pk, isReply);
		
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(list);
		
	
		return d_RestResponseDto;
	}
	
	
	//온라인컨설팅 등록 프로세스
	@RequestMapping("onlineConsultingProcess")
	public D_RestResponseDto insertOnlineConsulting(OnlineConsultingDto onlineConsulting, Model model, HttpSession session) {
		

		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();

		
		//구직희망 신청번호 뽑아오기
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		//신청 가능or불가능 이미 페이지에서 막음
//		boolean isboolean= consultingService.isOnlineconsulting(student_pk);
		
		//학생 온라인상담 정보 입력
		HopeJobDto hopeJobDto = consultingService.getLastHopejob(student_pk);
		onlineConsulting.setHope_job_pk(hopeJobDto.getHope_job_pk());
		consultingService.insertOnlineConsulting(onlineConsulting);
		
		d_RestResponseDto.setResult("success");
		
		return d_RestResponseDto;
		
		}	
	
	
	//온라인상담 가능여부 리로딩
	@RequestMapping("reloadOnlineConsultingState")
	public D_RestResponseDto isOnlineconsulting(HttpSession session) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
	
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		
		boolean isboolean = consultingService.isOnlineconsulting(student_pk);
		
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(isboolean);
		
		return d_RestResponseDto;
	}
	



	//학생입장
	//구직관심 분야 등록페이지
	@RequestMapping("getHopeJobCategoryList")
	public D_RestResponseDto getHopeJobCategoryList(HttpSession session, Model model) {
		
		
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();

		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		
		//진행중인 구직희망 정보
		HopeJobDto hopeJobDto = consultingService.getProgressHopejob(student_pk);
		int hopeJobPk = hopeJobDto.getHope_job_pk();
		
		HopeJobCategoryDto hopeJobCategoryDto = new HopeJobCategoryDto();
		hopeJobCategoryDto.setHope_job_pk(hopeJobPk);
		
		//채용분야 리스트
		List<Map<String, Object>> jobFieldCategoryDtoList = consultingService.selectJobFieldCategoryList(hopeJobCategoryDto);

		
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(jobFieldCategoryDtoList);
		
		return d_RestResponseDto;
	}
	
	//내 구직관심 리스트
	@RequestMapping("getMyHopeJobCategoryList")
	public D_RestResponseDto getMyHopeJobCategoryList(HttpSession session, Model model) {
		
		
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();

		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		
		//진행중인 구직희망 정보
		HopeJobDto hopeJobDto = consultingService.getProgressHopejob(student_pk);
		int hopeJobPk = hopeJobDto.getHope_job_pk();
		
		//구직희망의 관심분야 리스트
		List<Map<String, Object>> getHopeJobCategoryList = consultingService.getHopeJobCategoryList(hopeJobPk);
		
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(getHopeJobCategoryList);
		
		return d_RestResponseDto;
	}
	
	
	//내 구직관심분야 등록
	@RequestMapping("insertHopeJobCategory")
	public D_RestResponseDto insertHopeJobCategoryProcesss(int[] checkBoxValues, HttpSession session) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();

		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		HopeJobDto hopeJobDto = consultingService.getLastHopejob(studentInfoDto.getStudent_pk());
		int hopeJobPk = hopeJobDto.getHope_job_pk();
		
		consultingService.insertHopeJobCategory(hopeJobPk, checkBoxValues);
		
		d_RestResponseDto.setResult("success");
		
		return d_RestResponseDto;
	}


	//내 구직관심분야 삭제
	@RequestMapping("deleteMyHopeJobCategory")
	public D_RestResponseDto deleteMyHopeJobCategory(int[] checkBoxValues) {
		
		for(int e : checkBoxValues) {
		}
		
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();

		
		consultingService.deleteHopeJobCategory(checkBoxValues);
		
		d_RestResponseDto.setResult("success");

		
		return d_RestResponseDto;
		
		
	}
	
	//내 구직희망정보
	@RequestMapping("myHopeJobInfo")
	public D_RestResponseDto myHopeJobInfo(Model model, HttpSession session) {
		
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();

		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();	
		Map<String, Object> studentAndHopeJobInfoByStudentPk = consultingService.studentAndHopeJobInfoByStudentPk(student_pk);		
		
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(studentAndHopeJobInfoByStudentPk);

		
		return d_RestResponseDto;

	}
	
	
	//내 구직희망정보 업뎃
	//구직희망 업데이트 프로세스
	@RequestMapping("updateHopeJobProcess")
	public D_RestResponseDto updateHopeJobProcess(HopeJobDto par) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		
		consultingService.updateHopeJobProcess(par);
		
		d_RestResponseDto.setResult("success");
		
		return d_RestResponseDto;
	}

	
	//내 구직희망 프로그램 종료
	@RequestMapping("endHopeJobConsulting")
	public D_RestResponseDto endHopeJobConsulting(int hope_job_pk) {
		
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		
		consultingService.endHopeJobProcess(hope_job_pk);
		
		d_RestResponseDto.setResult("success");
		
		return d_RestResponseDto;
	}
	
	

}	
	
	

