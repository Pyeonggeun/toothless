package com.mkfactory.toothless.donot.touch.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.NotificationDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.StudentSqlMapper;

@Service
public class StudentServiceImpl {
	@Autowired
	private StudentSqlMapper studentSqlMapper;
	
	
	public StudentInfoDto loginByStudentIdAndPassword(StudentInfoDto studentInfoDto){
		
		return studentSqlMapper.selectStudentByIdAndPassword(studentInfoDto);
		
	}
	
	public Map<String, Object> getStudentOtherInfo(StudentInfoDto studentInfoDto) {
		
		Map<String, Object> map = new HashMap<>();
		 System.out.println(studentInfoDto.getStudent_pk());
		String departmentName = studentSqlMapper.selectStudnetDepartmentName(studentInfoDto.getDepartment_pk());
		int studentYear = studentSqlMapper.selectStudentYear(studentInfoDto.getStudent_pk());
		int graduationInfo = studentSqlMapper.selectGraduationInfo(studentInfoDto.getStudent_pk());
		
		map.put("graduationInfo", graduationInfo);
		map.put("departmentName", departmentName);
		map.put("studentYear", studentYear);
		
		
		return map;
	}
	//상단 알림카운트 
	public int getMyNotifyCount(int student_pk) {
		return studentSqlMapper.selectMyNotifyCount(student_pk);
	}
	//상단 알림카운트 클릭시 노출되는 리스트
	public List<NotificationDto> getUnreadMyNotifyList(int student_pk){
		
		List<NotificationDto> unreadNotifyList= studentSqlMapper.selectUnreadNotification(student_pk);
		
		return unreadNotifyList;
		
	}
	public void updateReadNotifyList(int student_pk) {
		studentSqlMapper.updateMyReadNotifyStatus(student_pk);
	}
	public List<NotificationDto> getReadMyNotifyList(int student_pk){
		List<NotificationDto> readNotifyList = studentSqlMapper.selectReadNotification(student_pk);
		
		return readNotifyList;
	}
	
	
	// 로그인시, 정기적으로 업데이트 알림 상태 N인  넘기는 리스트
	public List<NotificationDto> getNewNotifyList(int student_pk){
		return studentSqlMapper.reloadMyNotification(student_pk);
	}
	// 정기적으로 넘기는 리스트 동작시 알림상태 업데이트
	public void updateNewNotifyStatus(int student_pk) {
		studentSqlMapper.updateMyNewNotifyStatus(student_pk);
	}
	
	
	
	
}
