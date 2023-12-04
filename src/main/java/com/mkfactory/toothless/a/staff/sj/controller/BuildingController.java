package com.mkfactory.toothless.a.staff.sj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tl_a/staff/*")
public class BuildingController {

	@RequestMapping("sj_something")
	public String buildingMainPage() {
		return "tl_a/staff/sj_something";
	}
}
