package com.mkfactory.toothless.e.offlinecounsel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.ImpossibleDateDto;
import com.mkfactory.toothless.e.dto.OfflineReservationDto;
import com.mkfactory.toothless.e.dto.OfflineSurveyDto;
import com.mkfactory.toothless.e.offlinecounsel.service.OfflineCounselServiceImpl;

@Controller
@RequestMapping("/tl_e/offlineCounsel/*")
public class OfflineCounselController {
	
	@Autowired
	OfflineCounselServiceImpl offlineCounselService; 
	
	@RequestMapping("selectCounselorPage")
	public String selectCounselorPage(Model model) {
		
		List<Map<String, Object>> list = offlineCounselService.getCounselorListByTypeCategory();
		model.addAttribute("list", list);
		
		return "tl_e/offlineCounsel/selectCounselorPage";
	}
	
	@RequestMapping("counselReservationPage")
	public String counselReservationPage(Model model,
 			@RequestParam(value = "type_category_id") int type_category_id, 
			@RequestParam(value = "counselor_id") int counselor_id) {
		
		CounselorDto counselorDto = offlineCounselService.getCounselorInfo(counselor_id);
		model.addAttribute("counselorDto", counselorDto);
		model.addAttribute("type_category_id", type_category_id);
		
		List<Map<String, Object>> sevenDaysList = offlineCounselService.sevenDaysDateExtraction(counselor_id);
		model.addAttribute("sevenDaysList", sevenDaysList);
		
		return "tl_e/offlineCounsel/counselReservationPage";
	}
	
	@RequestMapping("counselReservationProcess")
	public String counselReservationProcess(
			Model model,
			OfflineReservationDto params, 
			String reservationDate) {
		
		int offlineReservationPk = offlineCounselService.getOfflineReservationPk();
		params.setId(offlineReservationPk);
		Map<String, Object> map = offlineCounselService.insertOfflineReservationInfo(params, reservationDate);
		model.addAttribute("map", map);
		
		return "tl_e/offlineCounsel/counselReservationCompletedPage";
	}
	
	@RequestMapping("offlineCounselReservationCheckPage")
	public String offlineCounselReservationCheckPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int external_pk = externalInfoDto.getExternal_pk();
		System.out.println(external_pk);
		
		List<Map<String, Object>> list = offlineCounselService.getReservationListByCounselorId(external_pk);
		model.addAttribute("list", list);
		
		return "tl_e/offlineCounsel/offlineCounselReservationCheckPage";
	}
	
	@RequestMapping("offlineCounselHistoryCheckPage")
	public String offlineCounselHistoryCheckPage() {
		
		
		return "tl_e/offlineCounsel/offlineCounselHistoryCheckPage";
	}
	
	@RequestMapping("createCounselReportPage")
	public String createCounselReportPage(Model model, 
			@RequestParam(value = "reservationPk") int reservationPk, 
			@RequestParam(value = "studentPk") int studentPk, 
			@RequestParam(value = "categoryPk") int categoryPk) {
		
		Map<String, Object> map = offlineCounselService.createReportInfo(reservationPk, studentPk, categoryPk);
		model.addAttribute("map", map);
		
		return "tl_e/offlineCounsel/createCounselReportPage";
	}
	
	@RequestMapping("counselReportRegisterProcess")
	public String counselReportRegisterProcess(
			@RequestParam("id") int id, 
			@RequestParam("state") String state, 
			@RequestParam("text") String text) {
		
		// update, insert
		offlineCounselService.updateCounselReservationState(id, state);
		offlineCounselService.insertCounselDocumentInfo(id, text);
		
		return "redirect:./offlineCounselReservationCheckPage";
	}
	
	
	@RequestMapping("checkOfflineCounselReservationStudentPage")
	public String checkOfflineCounselReservationStudentPage(HttpSession session, Model model) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		
		List<Map<String, Object>> list = offlineCounselService.getCounselReservationList(student_pk);
		model.addAttribute("list", list);
		
		return "tl_e/offlineCounsel/checkOfflineCounselReservationStudentPage";
	}
	
	@RequestMapping("counselReviewPage")
	public String counselReviewPage(Model model, int reservation_id) {
		
		Map<String, Object> map = offlineCounselService.getOfflineSurveyPageInfo(reservation_id);
		model.addAttribute("map", map);
		
		return "tl_e/offlineCounsel/counselReviewPage";
	}
	
	@RequestMapping("counselReviewProcess")
	public String counselReviewProcess(OfflineSurveyDto params) {
		
		offlineCounselService.insertOfflineSurveyInfo(params);
		
		return "redirect:./checkOfflineCounselReservationStudentPage";
	}
	
	@RequestMapping("counselCancelPage")
	public String counselCancelPage(Model model, int reservation_id) {
		
		Map<String, Object> map = offlineCounselService.getOfflineReservationCancelPageInfo(reservation_id);
		model.addAttribute("map", map);
		
		return "tl_e/offlineCounsel/counselCancelPage";
	}
	
	@RequestMapping("reservationCancelProcess")
	public String reservationCancelProcess(int reservation_id) {
		
		offlineCounselService.updateReservationStateToCancel(reservation_id);
		
		return "redirect:./checkOfflineCounselReservationStudentPage";
	}
	
	@RequestMapping("scheduleManagePage")
	public String scheduleManagePage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		
		List<ImpossibleDateDto> list = offlineCounselService.getImpossibleDateByExternalId(externalInfoDto.getExternal_pk());
		model.addAttribute("list", list);
		
		return "tl_e/offlineCounsel/scheduleManagePage";
	}
	
	
	@RequestMapping("vacationRegisterPage")
	public String vacationRegisterPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		CounselorDto counselorDto = offlineCounselService.getCounselorPk(externalInfoDto.getExternal_pk());
		model.addAttribute("counselorDto", counselorDto);
		
		return "tl_e/offlineCounsel/vacationRegisterPage";
	}
	
	@RequestMapping("vacationRegisterProcess")
	public String vacationRegisterProcess(ImpossibleDateDto params) {
		
		offlineCounselService.insertImpossibleDateInfo(params);
		
		return "redirect:./scheduleManagePage";
	}
	
	
}
