package com.mkfactory.toothless.d.jm.consulting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.HopeJobDto;
import com.mkfactory.toothless.d.jm.consulting.mapper.ConsultingMapper;

@Service
public class ConsultingService {
	
	@Autowired
	private ConsultingMapper consultingMapper ;
	
	//dto넣기
	public void insertHopeJobApply(HopeJobDto par) {
		consultingMapper.insertHopeJobApply(par);
	}
}
