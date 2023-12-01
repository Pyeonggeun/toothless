package com.mkfactory.toothless.c.dto;

import java.util.Date;

public class AjdksCompanyTimecardDto {
	
	public int company_timecard_pk;
	public int student_intern_pk;
	public int timecard_category_pk;
	public int timecard_year;
	public int timecard_month;
	public int timecard_date;
	public int getin_hour;
	public int getin_minute;
	public int getoff_hour;
	public int getoff_minute;
	public String company_log;
	public Date created_at;
	
	public AjdksCompanyTimecardDto() {
		super();
	}

	public AjdksCompanyTimecardDto(int company_timecard_pk, int student_intern_pk, int timecard_category_pk,
			int timecard_year, int timecard_month, int timecard_date, int getin_hour, int getin_minute, int getoff_hour,
			int getoff_minute, String company_log, Date created_at) {
		super();
		this.company_timecard_pk = company_timecard_pk;
		this.student_intern_pk = student_intern_pk;
		this.timecard_category_pk = timecard_category_pk;
		this.timecard_year = timecard_year;
		this.timecard_month = timecard_month;
		this.timecard_date = timecard_date;
		this.getin_hour = getin_hour;
		this.getin_minute = getin_minute;
		this.getoff_hour = getoff_hour;
		this.getoff_minute = getoff_minute;
		this.company_log = company_log;
		this.created_at = created_at;
	}

	public int getCompany_timecard_pk() {
		return company_timecard_pk;
	}

	public void setCompany_timecard_pk(int company_timecard_pk) {
		this.company_timecard_pk = company_timecard_pk;
	}

	public int getStudent_intern_pk() {
		return student_intern_pk;
	}

	public void setStudent_intern_pk(int student_intern_pk) {
		this.student_intern_pk = student_intern_pk;
	}

	public int getTimecard_category_pk() {
		return timecard_category_pk;
	}

	public void setTimecard_category_pk(int timecard_category_pk) {
		this.timecard_category_pk = timecard_category_pk;
	}

	public int getTimecard_year() {
		return timecard_year;
	}

	public void setTimecard_year(int timecard_year) {
		this.timecard_year = timecard_year;
	}

	public int getTimecard_month() {
		return timecard_month;
	}

	public void setTimecard_month(int timecard_month) {
		this.timecard_month = timecard_month;
	}

	public int getTimecard_date() {
		return timecard_date;
	}

	public void setTimecard_date(int timecard_date) {
		this.timecard_date = timecard_date;
	}

	public int getGetin_hour() {
		return getin_hour;
	}

	public void setGetin_hour(int getin_hour) {
		this.getin_hour = getin_hour;
	}

	public int getGetin_minute() {
		return getin_minute;
	}

	public void setGetin_minute(int getin_minute) {
		this.getin_minute = getin_minute;
	}

	public int getGetoff_hour() {
		return getoff_hour;
	}

	public void setGetoff_hour(int getoff_hour) {
		this.getoff_hour = getoff_hour;
	}

	public int getGetoff_minute() {
		return getoff_minute;
	}

	public void setGetoff_minute(int getoff_minute) {
		this.getoff_minute = getoff_minute;
	}

	public String getCompany_log() {
		return company_log;
	}

	public void setCompany_log(String company_log) {
		this.company_log = company_log;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
