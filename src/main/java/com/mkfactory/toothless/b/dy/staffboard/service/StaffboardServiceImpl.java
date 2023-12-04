package com.mkfactory.toothless.b.dy.staffboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.StaffNoticeboardDto;
import com.mkfactory.toothless.b.dy.staffboard.mapper.StaffboardSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.StaffSqlMapper;


@Service
public class StaffboardServiceImpl {

	@Autowired
	private StaffboardSqlMapper staffboardSqlMapper;
	
	public void StaffboardText(StaffNoticeboardDto staffNoticeboardDto) {
		
		staffboardSqlMapper.insertStaffboardText(staffNoticeboardDto);
	}
	
	public List<Map<String, Object>> getBoardContentsInfo() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<StaffNoticeboardDto> contentsDtolist = staffboardSqlMapper.selectBoardContentsInfo();
		
		for(StaffNoticeboardDto staffNoticeboardDto : contentsDtolist) {
			int userPk = staffNoticeboardDto.getStaff_noticeboard_pk();
			StaffInfoDto staffInfoDto = staffboardSqlMapper.selectStaffInfo(userPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("staffNoticeboardDto", staffNoticeboardDto);
			map.put("staffInfoDto", staffInfoDto);
			
			list.add(map);	
		}
		return list;
		
		
	}
	
}
