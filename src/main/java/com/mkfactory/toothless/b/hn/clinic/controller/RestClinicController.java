package com.mkfactory.toothless.b.hn.clinic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.b.hn.clinic.service.ClinicServiceImpl;

@RestController
@RequestMapping("/tl_b/hn/*")
public class RestClinicController {
	
	@Autowired
	private ClinicServiceImpl clinicService;

}
