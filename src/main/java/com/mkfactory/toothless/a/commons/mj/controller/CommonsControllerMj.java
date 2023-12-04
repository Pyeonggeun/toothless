package com.mkfactory.toothless.a.commons.mj.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.commons.mj.service.CommonsServiceImpl;
import com.mkfactory.toothless.a.dto.SemesterDto;

@Controller
@RequestMapping("/tl_a/commons/*")
public class CommonsControllerMj {

    @Autowired
    private CommonsServiceImpl commonsService;

    // staff - leftCategory1 ----> LIST, MAP, LIST안에 MAP 다해봄. 안됨. 보류!(BY 민지)
    @RequestMapping("staff/leftCategory")
    public String leftCategory(Model model) {
    	List<Map<String, Object>> thisYearAllSemester = commonsService.getThisYearAllSemester();
        model.addAttribute("thisYearAllSemester", thisYearAllSemester);
        return "/tl_a/commons/staff/leftCategory";
    }
    
}
