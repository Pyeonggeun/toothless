package com.mkfactory.toothless.d.gw.program.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_d/gw_program/*")
public class ProgramController {

	@RequestMapping("registerProgram")
	public String registerProgram() {
		
		return "/tl_d/gw_program/registerProgram";
	}
}
