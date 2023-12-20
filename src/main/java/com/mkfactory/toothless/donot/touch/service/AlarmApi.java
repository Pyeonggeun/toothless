package com.mkfactory.toothless.donot.touch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import com.mkfactory.toothless.donot.touch.dto.NotificationDto;
import com.mkfactory.toothless.x.ic.mapper.LifeLecturerSqlMapper;

@Component
public class AlarmApi {
	@Autowired
	LifeLecturerSqlMapper lifeLecturerSqlMapper;
	
	public void sendAlarm(int studentPk, int centerPk, String text, String url) {
		NotificationDto notificationDto = new NotificationDto();
		
		notificationDto.setStudent_pk(studentPk);
		notificationDto.setCenter_pk(centerPk);
		notificationDto.setMessage(text);
		notificationDto.setPageLink(url);
		
		lifeLecturerSqlMapper.insertNotificationDto(notificationDto);
		
	}
	
}
