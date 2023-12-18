package com.mkfactory.toothless.x.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AttendanceBookDto {
	private int attendance_book_key;
	private int open_lecture_key;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date date_created;
	private String study_log;
	private Date created_at;
	public AttendanceBookDto() {
		super();
	}
	public AttendanceBookDto(int attendance_book_key, int open_lecture_key, Date date_created, String study_log,
			Date created_at) {
		super();
		this.attendance_book_key = attendance_book_key;
		this.open_lecture_key = open_lecture_key;
		this.date_created = date_created;
		this.study_log = study_log;
		this.created_at = created_at;
	}
	public int getAttendance_book_key() {
		return attendance_book_key;
	}
	public void setAttendance_book_key(int attendance_book_key) {
		this.attendance_book_key = attendance_book_key;
	}
	public int getOpen_lecture_key() {
		return open_lecture_key;
	}
	public void setOpen_lecture_key(int open_lecture_key) {
		this.open_lecture_key = open_lecture_key;
	}
	public Date getDate_created() {
		return date_created;
	}
	public void setDate_created(Date date_created) {
		this.date_created = date_created;
	}
	public String getStudy_log() {
		return study_log;
	}
	public void setStudy_log(String study_log) {
		this.study_log = study_log;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
