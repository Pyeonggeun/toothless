package com.mkfactory.toothless.b.hn.clinic.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.b.dto.B_RestResponseDto;
import com.mkfactory.toothless.b.dto.ClinicPatientDto;
import com.mkfactory.toothless.b.dto.ClinicPatientLogDto;
import com.mkfactory.toothless.b.dto.PrescriptionDto;
import com.mkfactory.toothless.b.hn.clinic.service.ClinicServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@RestController
@RequestMapping("/tl_b/hn/*")
public class RestClinicController {
	
	@Autowired
	private ClinicServiceImpl clinicService;
	
	@RequestMapping("getClinicPatientInfoList")
	public B_RestResponseDto getClinicPatientInfoList(int pageNumber, String searchWord) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(clinicService.getClinicPatientInfoList(pageNumber, searchWord));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getClinicPatientTotalPageNumber")
	public B_RestResponseDto getClinicPatientTotalPageNumber(String searchWord) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		int totalPageNumber = (int)Math.ceil(clinicService.getClinicPatientTotalPageNumber(searchWord)/(double)20);
		
		restResponseDto.setData(totalPageNumber);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("insertWaitingClinicPatientInfo")
	public B_RestResponseDto insertWaitingClinicPatientInfo(int clinic_patient_pk) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		clinicService.insertWaitingClinicPatientInfo(clinic_patient_pk);
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getWaitingClinicPatientInfoList")
	public B_RestResponseDto getWaitingClinicPatientInfoList(int pageNumber) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(clinicService.getWaitingClinicPatientInfoList(pageNumber));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getWaitingClinicPatientTotalPageNumber")
	public B_RestResponseDto getWaitingClinicPatientTotalPageNumber() {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		int totalPageNumber = (int)Math.ceil(clinicService.getWaitingClinicPatientTotalPageNumber()/(double)20);
		
		restResponseDto.setData(totalPageNumber);
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getNewClinicPatientInfo")
	public B_RestResponseDto getNewClinicPatientInfo(String resident_id) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(clinicService.getNewClinicPatientInfo(resident_id));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("insertNewClinicPatientInfo")
	public B_RestResponseDto insertNewClinicPatientInfo(ClinicPatientDto params) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		clinicService.insertNewClinicPatientInfo(params);
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getClinicPatientLogInfo")
	public B_RestResponseDto getClinicPatientLogInfo(int clinic_patient_pk) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(clinicService.getClinicPatientLogInfo(clinic_patient_pk));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getClinicPatientDetailLogInfo")
	public B_RestResponseDto getClinicPatientDetailLogInfo(int clinic_patient_log_pk) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(clinicService.getClinicPatientDetailLogInfo(clinic_patient_log_pk));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getDiseaseCodeInfoList")
	public B_RestResponseDto getDiseaseCodeInfoList() {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(clinicService.getDiseaseCodeInfoList());
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getMedicineCodeInfoList")
	public B_RestResponseDto getMedicineCodeInfoList(int[] selectMedicines) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(clinicService.getMedicineCodeInfoList(selectMedicines));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("getMedicineMaxQuantity")
	public B_RestResponseDto getMedicineMaxQuantity(int medicine_code_pk) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		restResponseDto.setData(clinicService.getMedicineMaxQuantity(medicine_code_pk));
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("insertClinicPatientLog")
	public B_RestResponseDto insertClinicPatientLog(HttpSession session, ClinicPatientLogDto params, int[] medicineCodePkList, int[] quantityList) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
//		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
//		params.setStaff_pk(staffInfoDto.getStaff_pk());
		
		List<PrescriptionDto> list = new ArrayList<>();
		
		for(int x = 0 ; x < medicineCodePkList.length ; x++) {
			PrescriptionDto prescriptionDto = new PrescriptionDto();
			prescriptionDto.setMedicine_code_pk(medicineCodePkList[x]);
			prescriptionDto.setQuantity(quantityList[x]);
			
			list.add(prescriptionDto);
		}
		
		clinicService.insertClinicPatientLogInfo(params, list);
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}
	
	@RequestMapping("updateWaitingStatus")
	public B_RestResponseDto updateWaitingStatus(int clinic_patient_pk) {
		
		B_RestResponseDto restResponseDto = new B_RestResponseDto();
		
		clinicService.updateWaitingStatus(clinic_patient_pk);
		
		restResponseDto.setResult("success");
		
		return restResponseDto;
	}

}
