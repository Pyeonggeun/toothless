package com.mkfactory.toothless.b.hn.clinic.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mkfactory.toothless.b.dto.ClinicPatientDto;
import com.mkfactory.toothless.b.dto.ClinicPatientLogDto;
import com.mkfactory.toothless.b.dto.PrescriptionDto;
import com.mkfactory.toothless.b.hn.clinic.service.ClinicServiceImpl;

@Controller
@RequestMapping("/tl_b/hn/*")
public class ClinicController {
	
	@Autowired
	private ClinicServiceImpl clinicService;
	
	@RequestMapping("clinicPage")
	public String clinicPage(Model model, @RequestParam(required = false, defaultValue = "0") int clinic_patient_pk) {
		
		model.addAttribute("allClinicPatientInfoList", clinicService.getAllClinicPatientInfoList());
		model.addAttribute("clinicPatientLogInfo", clinicService.getClinicPatientInfo(clinic_patient_pk));
		model.addAttribute("medicineInfoList", clinicService.getMedicineInfoList());
		
		return "tl_b/hn/clinicPage";
	}
	
	@RequestMapping("ClinicInfoRegisterProcess")
	public String ClinicInfoRegisterProcess(String firstResidentId, String secondResidentId, String firstPhone, String secondPhone, String thirdPhone,
			ClinicPatientDto clinicPatientDto, ClinicPatientLogDto clinicPatientLogDto, int[] medicineCodePkList, int[] quantityList, int prescriptionCount) {
		
		String resident_id = firstResidentId + "-" + secondResidentId;
		String phone = firstPhone + "-" + secondPhone + "-" + thirdPhone;
		clinicPatientDto.setResident_id(resident_id);
		clinicPatientDto.setPhone(phone);
		
		List<PrescriptionDto> list = new ArrayList<>();
		
		for(int x = 0 ; x < prescriptionCount ; x++) {
			PrescriptionDto prescriptionDto = new PrescriptionDto();
			prescriptionDto.setMedicine_code_pk(medicineCodePkList[x]);
			prescriptionDto.setQuantity(quantityList[x]);
			
			list.add(prescriptionDto);
		}
		
		 clinicService.insertClinicPatientInfo(clinicPatientDto, clinicPatientLogDto, list);
		
		return "redirect:./clinicPage";
	}

}
