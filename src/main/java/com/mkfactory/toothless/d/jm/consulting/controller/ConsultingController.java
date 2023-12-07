package com.mkfactory.toothless.d.jm.consulting.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mkfactory.toothless.d.dto.ConsultingDto;
import com.mkfactory.toothless.d.dto.HopeJobCategoryDto;
import com.mkfactory.toothless.d.dto.HopeJobDto;
import com.mkfactory.toothless.d.dto.HopeJobFeedbackDto;
import com.mkfactory.toothless.d.dto.JobFieldCategoryDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingDto;
import com.mkfactory.toothless.d.dto.OnlineConsultingReplyDto;
import com.mkfactory.toothless.d.jm.consulting.service.ConsultingService;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_d/jm_consulting/*")
public class ConsultingController {
	
	@Autowired
	private ConsultingService consultingService;
	

	
	
	//구직희망 신청서 등록 페이지
	@RequestMapping("applyHopeJobPage")
	public String applyHopeJobPage() {
		return "tl_d/jm_consulting/applyHopeJobPage";
	}
	
	
	//구직희망신청 insert
	@RequestMapping("hopeJobApplyProcess")
	public String insertHopeJobApply(HopeJobDto par, HttpSession session, Model model) {
		
			
		//학생정보 pk 출력
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		//구직희망 프로그램을 아직 진행중인 학생이라면 등록 거부
		boolean checkOverlapHopejob = consultingService.checkOverlapHopeJobApply(studentInfoDto.getStudent_pk());
		
		//중복x시 정보 입력
		if(checkOverlapHopejob == false) {
			//학생정보 pk 입력
			par.setStudent_pk(studentInfoDto.getStudent_pk());
			
			//구직희망신청 insert 실행
			consultingService.insertHopeJobApply(par);
			return "redirect:./hopeJobConsultingPage";
		}
		//중복이면 등록거부
		else {
			model.addAttribute("checkOverlapHopejob", checkOverlapHopejob);
			return "tl_d/jm_consulting/applyHopeJobPage";
		}	
	}
	
	
	
	
	
	//insertOnConsultingPage
	//onlineConsultingPage
	//학생 온라인상담 페이지 
	@RequestMapping("insertOnConsultingPage")
	public String insertOnConsultingPage(HttpSession session, Model model) {
		
		
		//상담가능 불가능 확인
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();		
		boolean isboolean= consultingService.isOnlineconsulting(student_pk);
		if(isboolean == true) {
			model.addAttribute("isOnelineConsulting", true);
		}
		//불가능
		else {
			model.addAttribute("isOnelineConsulting", false);
		}		
		
		
		
		
		return"tl_d/jm_consulting/insertOnConsultingPage";
	}
	
	
	
	//학생 온라인상담 정보 입력
	@RequestMapping("onlineConsultingProcess")
	public String insertOnlineConsulting(OnlineConsultingDto onlineConsulting, Model model, HttpSession session) {
		
		

		
		//구직희망 신청번호 뽑아오기
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		//신청 가능or불가능
		boolean isboolean= consultingService.isOnlineconsulting(student_pk);
		
		//가능
		if(isboolean == true) {
			//학생 온라인상담 정보 입력
			HopeJobDto hopeJobDto = consultingService.getLastHopejob(student_pk);
			onlineConsulting.setHope_job_pk(hopeJobDto.getHope_job_pk());
			consultingService.insertOnlineConsulting(onlineConsulting);
			model.addAttribute("isOnelineConsulting", true);
			return "redirect:./hopeJobConsultingPage";


		}
		//불가능
		else {
			//jsp에서 true면 이미 상담중인 문의 있다고 출력
			model.addAttribute("isOnelineConsulting", false);
			return "";
		}		
	}
	
	
	
	
	
	
	
	
	
	
	//교직원 온라인 상담 답글입력 프로세스
	@RequestMapping("insertOnlineConsultingReply")
	public String insertOnlineConsultingReply(OnlineConsultingReplyDto par, HttpSession session) {
		//jsp페이지에서 on_consulting_pk, on_contents_reply받기
		//staffpk세팅
		StaffInfoDto staffInfoDto =(StaffInfoDto)session.getAttribute("sessionStaffInfo");
		int staffPk = staffInfoDto.getStaff_pk();
		par.setStaff_pk(staffPk);
		
		int on_consulting_pk = par.getOn_consulting_pk();
		
		consultingService.insertOnlineConsultingReply(par);
		
		return"redirect:./staffManageOnlineConsultingPage?on_consulting_pk="+on_consulting_pk;
	}
	
	
	
	//학생 구직희망 메인페이지 (갈림길)
	@RequestMapping("hopeJobConsultingPage")
	public String hopeJobConsultingPage(HttpSession session,Model model) {

		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto == null) {
			return"redirect:../../another/student/loginPage";
		}
		
		
		int student_pk = studentInfoDto.getStudent_pk();
		
		

		
		
		//중복확인, false면 구직희망 신청페이지로
		if(consultingService.checkOverlapHopeJobApply(student_pk)==false) {
			model.addAttribute("guide", true);
			return "tl_d/jm_consulting/applyHopeJobPage";
		}
		
		
		
		
		//마지막 상담정보 리스트
		Map<String, Object> lastOnlineConsulting = consultingService.lastOnlineConsulting(student_pk);
		//미응답 만족도 조사 갯수

		int countUnAnsweredHJF = consultingService.countUnAnsweredHJF(student_pk);
		
		
		//모델
		model.addAttribute("lastOnlineConsulting", lastOnlineConsulting);	
		model.addAttribute("countUnAnsweredHJF", countUnAnsweredHJF);
		
		
		return"tl_d/jm_consulting/hopeJobConsultingPage";
	}
	
	
	//학생 온라인 상담 자세히보기 페이지, 답글다는 페이지
	@RequestMapping("onlineConsultingViewPage")
	public String onlineConsultingViewPage(int on_consulting_pk, Model model) {
		
		Map<String, Object> onlineConsultingInfo = consultingService.getOnlineConsultingByPk(on_consulting_pk);
		
		model.addAttribute("onlineConsultingInfo", onlineConsultingInfo);
		
		return"tl_d/jm_consulting/onlineConsultingViewPage";
	}
	
	
	
	//학생 온라인 상담 전체보기(실제론 10건)보기
	//나중에 페이징처리로 쿼리 변경하자
	@RequestMapping("onlineConsultingListPage")
	public String viewOnlineConsultingList(HttpSession session, Model model,
			@RequestParam(value="isReply", defaultValue="all") String isReply
			) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		
		List<Map<String, Object>> list = consultingService.getOnlineConsultingList(student_pk, isReply);
		model.addAttribute("list", list);
		
		return"tl_d/jm_consulting/onlineConsultingListPage";
		
	}
	
	
	//만족도조사 하는 페이지	
	@RequestMapping("insertHJFPage")
	public String insertHJFPage(int hope_job_pk, Model model) {
		
		
		model.addAttribute("hope_job_pk", hope_job_pk);
		return"tl_d/jm_consulting/insertHJFPage";
	}
	
	
	//만족도조사 값 입력
	@RequestMapping("insertHJFProcess")
	public String insertHJFProcess(HopeJobFeedbackDto par) {
				
		consultingService.insertHopeJobFeedback(par);
		
		return"redirect:./unAnsweredHJFListPage";
	}
	
	
	//미응답 만족도조사 보는 페이지
	@RequestMapping("unAnsweredHJFListPage")
	public String viewUnAnsweredHJFList(HttpSession session, Model model) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		
		List<HopeJobDto> hopeJobDtoList = consultingService.getUnAnsweredHJFList(student_pk);
		
		if(hopeJobDtoList.size() == 0) {
			model.addAttribute("hopeJobDtoList", null);
		}
		else {
			model.addAttribute("hopeJobDtoList", hopeJobDtoList);
		}
		
		
		return"tl_d/jm_consulting/unAnsweredHJFListPage";
	}
	
	//구직관심 분야 등록페이지
	@RequestMapping("insertHJCPage")
	public String insertHJCPage(HttpSession session, Model model) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		
		//진행중인 구직희망 정보
		HopeJobDto hopeJobDto = consultingService.getProgressHopejob(student_pk);
		int hopeJobPk = hopeJobDto.getHope_job_pk();
		
		HopeJobCategoryDto hopeJobCategoryDto = new HopeJobCategoryDto();
		hopeJobCategoryDto.setHope_job_pk(hopeJobPk);
		
		//채용분야 리스트
		List<Map<String, Object>> jobFieldCategoryDtoList = consultingService.selectJobFieldCategoryList(hopeJobCategoryDto);
		//구직희망의 관심분야 리스트
		List<Map<String, Object>> getHopeJobCategoryList = consultingService.getHopeJobCategoryList(hopeJobPk);
		model.addAttribute("jobFieldCategoryDtoList", jobFieldCategoryDtoList);
		model.addAttribute("hopeJobPk", hopeJobPk);
		model.addAttribute("getHopeJobCategoryList", getHopeJobCategoryList);
		
		return"tl_d/jm_consulting/insertHJCPage";
	}
	
	//구직관심분야 등록
	@RequestMapping("insertHopeJobCategory")
	public String insertHopeJobCategoryProcesss(int[] job_field_category_pk, HttpSession session) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		HopeJobDto hopeJobDto = consultingService.getLastHopejob(studentInfoDto.getStudent_pk());
		int hopeJobPk = hopeJobDto.getHope_job_pk();
		
		consultingService.insertHopeJobCategory(hopeJobPk, job_field_category_pk);
		return"redirect:./insertHJCPage";
	}
	
	//구직관심분야 삭제
	@RequestMapping("deleteHopeJobCategory")
	public String deleteHopeJobCategoryProcess(int[] deleteHopeJobCategoryList) {
		
		consultingService.deleteHopeJobCategory(deleteHopeJobCategoryList);
		return"redirect:./insertHJCPage";
	}
	
	
	//임시 스태프 메인페이지
	@RequestMapping("jmTempStaffMainPage")
	public String jmTempStaffMainPage(HttpSession session) {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		if(staffInfoDto == null) {
			return"redirect:../../another/staff/loginPage";
		}
		
		
		return"tl_d/jm_consulting/jmTempStaffMainPage";
	}
	
	
	//온라인상담 리스트 페이지
	@RequestMapping("staffViewOnlineConsultingPage")
	public String staffOnlineConsultingPage(Model model, HttpSession session,
			@RequestParam(value="isAnswer", defaultValue="all") String isReply
			)
		 {
		
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		if(staffInfoDto == null) {
			return"redirect:../../another/staff/loginPage";
		}
		
		//온라인 상담	//온라인상담 오래된순 싹 출력 + 검색 및 정렬 추가

		List<Map<String, Object>> list = consultingService.getOnlineConsultingListAll(isReply);
		model.addAttribute("list", list);
		
		//현재 정렬값
		model.addAttribute("isReply", isReply);
		
		return"tl_d/jm_consulting/staffViewOnlineConsultingPage";
	}
	
	//교직원 온라인상담 자세히보기 및 답변 페이지
	@RequestMapping("staffManageOnlineConsultingPage")
	public String staffManageOnlineConsultingPage(int onlineConsultingPk, Model model) {
		
		Map<String, Object> onlineConsultingInfo = consultingService.getOnlineConsultingByPk(onlineConsultingPk);
		model.addAttribute("onlineConsultingInfo", onlineConsultingInfo);
		
		return"tl_d/jm_consulting/staffManageOnlineConsultingPage";
	}
	
	
	//교직원 학생 목록 보기 페이지
	@RequestMapping("viewStudentListPage")
	public String viewStudentListPage(Model model) {
		
		List<Map<String, Object>> hopeJobInfoList = consultingService.getHopeJobInfoList();
		model.addAttribute("hopeJobInfoList", hopeJobInfoList);
		
		return"tl_d/jm_consulting/viewStudentListPage";
	}
	
	//교직원의 학생 정보 자세히 보기 페이지
	@RequestMapping("viewDetailStudentInfoPage")
	public String viewDetailStudentInfo(Model model, int hope_job_pk){
		
		
		//구직희망 - 학생정보
		
		
		
		//구직희망신청pk로  카테고리 이름까지 싹다
		List<Map<String, Object>> getHopeJobCategoryList = consultingService.getHopeJobCategoryList(hope_job_pk);
		model.addAttribute("getHopeJobCategoryList", getHopeJobCategoryList);
		
		//학생/구직희망정보와 내역등 통계
		Map<String, Object> viewStudentDetailPageStats = consultingService.viewStudentDetailPageInfo(hope_job_pk);
		model.addAttribute("viewStudentDetailPageStats", viewStudentDetailPageStats);
		

		
		
		return"tl_d/jm_consulting/viewDetailStudentInfoPage";
	}
	
	//취업상담 입력페이지
	@RequestMapping("insertConsultingPage")
	public String insertConsultingPage(int hope_job_pk, Model model) {
		
		model.addAttribute("hope_job_pk", hope_job_pk);
		return"tl_d/jm_consulting/insertConsultingPage";
	}
	
	//취업상담 입력
	@RequestMapping("insertConsultingProcess")
	public String insertConsultingProcess(ConsultingDto par) {
	
		int hope_job_pk = par.getHope_job_pk();
	
		consultingService.insertConsultingInfo(par);
	
		return"redirect:./viewDetailStudentInfoPage?hope_job_pk="+hope_job_pk;
	}	
	
	//만족도 조사 리스트 보는 페이지
	@RequestMapping("FeedbackListPage")
	public String FeedbackListPage(Model model,
			@RequestParam(value="sortHJFScore", defaultValue="default") String sortHJFScore
			) {
		
		List<Map<String, Object>> list = consultingService.getHopeJobFeedbackListAll(sortHJFScore);
		model.addAttribute("list", list);
		
		Integer avgScore = consultingService.avgHopeJobFeedbackScore();
		model.addAttribute("avgScore", avgScore);
		model.addAttribute("sortHJFScore", sortHJFScore);

		
		return"tl_d/jm_consulting/FeedbackListPage";
	}
	
	//만족도 조사 디테일 페이지
	@RequestMapping("detailFeedbackPage")
	public String detailFeedbackPage(int hjf_pk, Model model) {
		
		Map<String, Object> detailHJFInfo = consultingService.HopeJobFeedbackDetailInfo(hjf_pk);
		model.addAttribute("detailHJFInfo", detailHJFInfo);
		
		return"tl_d/jm_consulting/detailFeedbackPage";
	}
	//구직희망 정보 수정페이지
	@RequestMapping("updateHopeJobPage")
	public String updateHopeJobPage(Model model, HttpSession session) {
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();	
		Map<String, Object> studentAndHopeJobInfoByStudentPk = consultingService.studentAndHopeJobInfoByStudentPk(student_pk);		
		model.addAttribute("map", studentAndHopeJobInfoByStudentPk);
		
		return"tl_d/jm_consulting/updateHopeJobPage";
	}
	
	//구직희망 업데이트 프로세스
	@RequestMapping("updateHopeJobProcess")
	public String updateHopeJobProcess(HopeJobDto par) {
		consultingService.updateHopeJobProcess(par);
		return"redirect:../../tl_d/jm_consulting/hopeJobConsultingPage";
	}
	
	//구직희망 종료하기
	@RequestMapping("endHopeJobProcess")
	public String endHopeJobProcess(int hope_job_pk) {
			consultingService.endHopeJobProcess(hope_job_pk);
		return"redirect:../../another/student/mainPage";
	}
	
	
}
