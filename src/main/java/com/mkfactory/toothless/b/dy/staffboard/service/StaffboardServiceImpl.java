package com.mkfactory.toothless.b.dy.staffboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.StaffNoticeboardDto;
import com.mkfactory.toothless.b.dy.staffboard.mapper.StaffboardSqlMapper;


@Service
public class StaffboardServiceImpl {

	@Autowired
	private StaffboardSqlMapper staffboardSqlMapper;
	
	public void StaffboardText(StaffNoticeboardDto staffNoticeboardDto) {
		
		staffboardSqlMapper.insertStaffboardText(staffNoticeboardDto);
	}
	
	
}
