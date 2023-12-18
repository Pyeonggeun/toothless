package com.mkfactory.toothless.x.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class LectureTestDto {
	
	private int	lecture_test_key;
	private int open_lecture_key;
	private String test_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date open_test_day;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date close_test_day;
	private Date created_at;
	
	public LectureTestDto() {
		super();
	}

	public LectureTestDto(int lecture_test_key, int open_lecture_key, String test_name, Date open_test_day,
			Date close_test_day, Date created_at) {
		super();
		this.lecture_test_key = lecture_test_key;
		this.open_lecture_key = open_lecture_key;
		this.test_name = test_name;
		this.open_test_day = open_test_day;
		this.close_test_day = close_test_day;
		this.created_at = created_at;
	}

	public int getLecture_test_key() {
		return lecture_test_key;
	}

	public void setLecture_test_key(int lecture_test_key) {
		this.lecture_test_key = lecture_test_key;
	}

	public int getOpen_lecture_key() {
		return open_lecture_key;
	}

	public void setOpen_lecture_key(int open_lecture_key) {
		this.open_lecture_key = open_lecture_key;
	}

	public String getTest_name() {
		return test_name;
	}

	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}

	public Date getOpen_test_day() {
		return open_test_day;
	}

	public void setOpen_test_day(Date open_test_day) {
		this.open_test_day = open_test_day;
	}

	public Date getClose_test_day() {
		return close_test_day;
	}

	public void setClose_test_day(Date close_test_day) {
		this.close_test_day = close_test_day;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
