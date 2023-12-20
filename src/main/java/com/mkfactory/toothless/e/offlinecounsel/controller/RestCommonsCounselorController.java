package com.mkfactory.toothless.e.offlinecounsel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.e.dto.RestResponseOfflineDto;
import com.mkfactory.toothless.e.offlinecounsel.service.OfflineCounselServiceImpl;

@RestController
@RequestMapping("/tl_e/commons/*")
public class RestCommonsCounselorController {

	
	@Autowired
	private OfflineCounselServiceImpl offlineCounselService;

	@RequestMapping("getSessionExternalInfo")
	public RestResponseOfflineDto getSessionExternalInfo(HttpSession session) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		
		restResponseOfflineDto.setResult("success");
		
		restResponseOfflineDto.setData(externalInfoDto);
		
		return restResponseOfflineDto;
		
	}
	
	@RequestMapping("twoWeekStatisticsData")
	public RestResponseOfflineDto twoWeekStatisticsData(int external_pk) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getTwoWeekStatisticsData(external_pk));
		
		return restResponseOfflineDto;
		
	}
	
	@RequestMapping("getOfflineMainList")
	public RestResponseOfflineDto getOfflineMainList(int external_pk) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		
		restResponseOfflineDto.setData(offlineCounselService.getOfflineMainList(external_pk));
		
		return restResponseOfflineDto;
	}

	
	@RequestMapping("getMainListCount")
	public RestResponseOfflineDto getMainListCount(int external_pk) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		
		restResponseOfflineDto.setData(offlineCounselService.getMainListCount(external_pk));
		
		return restResponseOfflineDto;
		
	}

	@RequestMapping("getOnlineMainList")
	public RestResponseOfflineDto getOnlineMainList(int external_pk) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		
		restResponseOfflineDto.setData(offlineCounselService.getOnlineMainList(external_pk));
		
		return restResponseOfflineDto;
	}

	@RequestMapping("getGroupMainList")
	public RestResponseOfflineDto getGroupMainList(int external_pk) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		
		restResponseOfflineDto.setData(offlineCounselService.getGroupMainList(external_pk));
		
		return restResponseOfflineDto;
	}
	
	@RequestMapping("getMainLineChart")
	public RestResponseOfflineDto getMainLineChart(int external_pk) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getMainLineChart(external_pk));
		
		return restResponseOfflineDto;
	}

	@RequestMapping("getMainPieChart")
	public RestResponseOfflineDto getMainPieChart(int external_pk) {
		
		RestResponseOfflineDto restResponseOfflineDto = new RestResponseOfflineDto();
		restResponseOfflineDto.setResult("success");
		restResponseOfflineDto.setData(offlineCounselService.getMainPieChart(external_pk));
		
		return restResponseOfflineDto;
	}
	
	
}
