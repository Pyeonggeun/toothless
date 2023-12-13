package com.mkfactory.toothless.x.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OpenLectureDto {
	
	private int open_lecture_key;
	private int lecture_info_key;
	private int lecturer_key;
	private int max_student;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date start_apply;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date end_apply;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date open_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date close_date;
	private Date created_at;
	
	
	public OpenLectureDto() {}


	public OpenLectureDto(int open_lecture_key, int lecture_info_key, int lecturer_key, int max_student,
			Date start_apply, Date end_apply, Date open_date, Date close_date, Date created_at) {
		
		this.open_lecture_key = open_lecture_key;
		this.lecture_info_key = lecture_info_key;
		this.lecturer_key = lecturer_key;
		this.max_student = max_student;
		this.start_apply = start_apply;
		this.end_apply = end_apply;
		this.open_date = open_date;
		this.close_date = close_date;
		this.created_at = created_at;
	}


	public int getOpen_lecture_key() {
		return open_lecture_key;
	}


	public void setOpen_lecture_key(int open_lecture_key) {
		this.open_lecture_key = open_lecture_key;
	}


	public int getLecture_info_key() {
		return lecture_info_key;
	}


	public void setLecture_info_key(int lecture_info_key) {
		this.lecture_info_key = lecture_info_key;
	}


	public int getLecturer_key() {
		return lecturer_key;
	}


	public void setLecturer_key(int lecturer_key) {
		this.lecturer_key = lecturer_key;
	}


	public int getMax_student() {
		return max_student;
	}


	public void setMax_student(int max_student) {
		this.max_student = max_student;
	}


	public Date getStart_apply() {
		return start_apply;
	}


	public void setStart_apply(Date start_apply) {
		this.start_apply = start_apply;
	}


	public Date getEnd_apply() {
		return end_apply;
	}


	public void setEnd_apply(Date end_apply) {
		this.end_apply = end_apply;
	}


	public Date getOpen_date() {
		return open_date;
	}


	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}


	public Date getClose_date() {
		return close_date;
	}


	public void setClose_date(Date close_date) {
		this.close_date = close_date;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
	
	
	
	

}
