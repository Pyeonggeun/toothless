package com.mkfactory.toothless.e.dto;

import java.util.Date;

public class OfflineReservationDto {
	
	private int id;
	private int student_pk;
	private int counselor_id;
	private int type_category_id;
	private int counsel_year;
	private int counsel_month;
	private int counsel_date;
	private int counsel_hour;
	private int counsel_day;
	private String text;
	private String state;
	private Date created_at;
	
	public OfflineReservationDto() {
		super();
	}

	public OfflineReservationDto(int id, int student_pk, int counselor_id, int type_category_id, int counsel_year,
			int counsel_month, int counsel_date, int counsel_hour, int counsel_day, String text, String state,
			Date created_at) {
		super();
		this.id = id;
		this.student_pk = student_pk;
		this.counselor_id = counselor_id;
		this.type_category_id = type_category_id;
		this.counsel_year = counsel_year;
		this.counsel_month = counsel_month;
		this.counsel_date = counsel_date;
		this.counsel_hour = counsel_hour;
		this.counsel_day = counsel_day;
		this.text = text;
		this.state = state;
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public int getCounselor_id() {
		return counselor_id;
	}

	public void setCounselor_id(int counselor_id) {
		this.counselor_id = counselor_id;
	}

	public int getType_category_id() {
		return type_category_id;
	}

	public void setType_category_id(int type_category_id) {
		this.type_category_id = type_category_id;
	}

	public int getCounsel_year() {
		return counsel_year;
	}

	public void setCounsel_year(int counsel_year) {
		this.counsel_year = counsel_year;
	}

	public int getCounsel_month() {
		return counsel_month;
	}

	public void setCounsel_month(int counsel_month) {
		this.counsel_month = counsel_month;
	}

	public int getCounsel_date() {
		return counsel_date;
	}

	public void setCounsel_date(int counsel_date) {
		this.counsel_date = counsel_date;
	}

	public int getCounsel_hour() {
		return counsel_hour;
	}

	public void setCounsel_hour(int counsel_hour) {
		this.counsel_hour = counsel_hour;
	}

	public int getCounsel_day() {
		return counsel_day;
	}

	public void setCounsel_day(int counsel_day) {
		this.counsel_day = counsel_day;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
}
