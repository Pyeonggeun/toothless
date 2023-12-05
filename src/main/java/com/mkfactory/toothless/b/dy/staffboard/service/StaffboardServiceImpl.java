package com.mkfactory.toothless.b.dy.staffboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mkfactory.toothless.b.dto.StaffboardDto;
import com.mkfactory.toothless.b.dy.staffboard.mapper.StaffboardSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;


@Service
public class StaffboardServiceImpl {

	@Autowired
	private StaffboardSqlMapper staffboardSqlMapper;
	
	public void StaffboardText(StaffboardDto staffboardDto) {
		
		staffboardSqlMapper.insertStaffboardText(staffboardDto);
	}
	
	public List<Map<String, Object>> getBoardContentsInfo() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<StaffboardDto> contentsDtolist = staffboardSqlMapper.selectBoardContentsInfo();
		
		for(StaffboardDto staffboardDto : contentsDtolist) {
			int userPk = staffboardDto.getStaff_pk();
			StaffInfoDto staffInfoDto = staffboardSqlMapper.selectStaffInfo(userPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("staffNoticeboardDto", staffboardDto);
			map.put("staffInfoDto", staffInfoDto);
			
			list.add(map);	
		}
		return list;
	}
	
	public Map<String, Object> readContentsDetailInfo(int staffboard_pk) {
		
		Map<String, Object> map = new HashMap<>();
		
		StaffboardDto noticeboardDto = staffboardSqlMapper.selectContentsDetailInfo(staffboard_pk);
		int userPk = noticeboardDto.getStaff_pk();
		StaffInfoDto staffInfoDto = staffboardSqlMapper.selectStaffInfo(userPk);
		
		map.put("noticeboardDto", noticeboardDto);
		map.put("staffInfoDto", staffInfoDto);
		
		return map;
	}
	
	public void createTextReadCount(int staffboard_pk) {
		staffboardSqlMapper.updateTextReadCount(staffboard_pk);
	}
	
	public void removeText(int staffboard_pk) {
		staffboardSqlMapper.deleteText(staffboard_pk);
	}
	public void modifyTextPage(StaffboardDto staffboardDto) {
		staffboardSqlMapper.updateModifyText(staffboardDto);
	}
	
}




























