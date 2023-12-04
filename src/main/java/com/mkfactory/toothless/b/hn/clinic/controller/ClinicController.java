package com.mkfactory.toothless.b.hn.clinic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

}
