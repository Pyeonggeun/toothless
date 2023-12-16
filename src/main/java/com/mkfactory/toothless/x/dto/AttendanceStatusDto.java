package com.mkfactory.toothless.x.dto;

import java.util.Date;

public class AttendanceStatusDto {
	private int attendance_status_key;
	private int attendance_book_key;
	private int lecture_student_key;
	private String status;
	private Date created_at;
	public AttendanceStatusDto() {
		super();
	}
	public AttendanceStatusDto(int attendance_status_key, int attendance_book_key, int lecture_student_key,
			String status, Date created_at) {
		super();
		this.attendance_status_key = attendance_status_key;
		this.attendance_book_key = attendance_book_key;
		this.lecture_student_key = lecture_student_key;
		this.status = status;
		this.created_at = created_at;
	}
	public int getAttendance_status_key() {
		return attendance_status_key;
	}
	public void setAttendance_status_key(int attendance_status_key) {
		this.attendance_status_key = attendance_status_key;
	}
	public int getAttendance_book_key() {
		return attendance_book_key;
	}
	public void setAttendance_book_key(int attendance_book_key) {
		this.attendance_book_key = attendance_book_key;
	}
	public int getLecture_student_key() {
		return lecture_student_key;
	}
	public void setLecture_student_key(int lecture_student_key) {
		this.lecture_student_key = lecture_student_key;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
