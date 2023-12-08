package com.mkfactory.toothless.b.hn.clinic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.b.dto.B_RestResponseDto;
import com.mkfactory.toothless.b.hn.clinic.service.ClinicServiceImpl;

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

}
