package com.mkfactory.toothless.e.offlinecounsel.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.e.offlinecounsel.mapper.OfflineCounselMapper;

@Service
public class OfflineCounselServiceImpl {
	
	@Autowired
	OfflineCounselMapper offlineCounselMapper;
	
	public List<Map<String, Object>> sevenDaysDateExtraction() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		LocalDate today = LocalDate.now();
		
		for(int i = 0; i < 7; i++) {
			
			int year = today.getYear();
			int month = today.getMonthValue();
			int date = today.getDayOfMonth();
			DayOfWeek dayOfWeek = today.getDayOfWeek();
			int day = dayOfWeek.getValue();
			
			List<Integer> timeList = new ArrayList<>();
			
			for(int j = 9; j < 18; j++) {
				timeList.add(j);
			}
			
			Map<String, Object> map = new HashMap<>();
			map.put("year", year);
			map.put("month", month);
			map.put("date", date);
			map.put("day", day); // jsp에서 choose,when,otherwise로 요일 이름 변경
			map.put("timeList", timeList);
			
			list.add(map);
			
			today = today.plusDays(1);
		}
		return list;
		
	}
	
	
	
}
