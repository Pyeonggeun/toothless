package com.mkfactory.toothless.e.dto;

import java.util.Date;

public class ImpossibleDateDto {
	
	private int id;
	private int counselor_id;
	private int start_year;
	private int start_month;
	private int start_date;
	private int start_hour;
	private int end_year;
	private int end_month;
	private int end_date;
	private int end_hour;
	private String reason;
	private Date created_at;
	
	public ImpossibleDateDto() {
		super();
	}

	public ImpossibleDateDto(int id, int counselor_id, int start_year, int start_month, int start_date, int start_hour,
			int end_year, int end_month, int end_date, int end_hour, String reason, Date created_at) {
		super();
		this.id = id;
		this.counselor_id = counselor_id;
		this.start_year = start_year;
		this.start_month = start_month;
		this.start_date = start_date;
		this.start_hour = start_hour;
		this.end_year = end_year;
		this.end_month = end_month;
		this.end_date = end_date;
		this.end_hour = end_hour;
		this.reason = reason;
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCounselor_id() {
		return counselor_id;
	}

	public void setCounselor_id(int counselor_id) {
		this.counselor_id = counselor_id;
	}

	public int getStart_year() {
		return start_year;
	}

	public void setStart_year(int start_year) {
		this.start_year = start_year;
	}

	public int getStart_month() {
		return start_month;
	}

	public void setStart_month(int start_month) {
		this.start_month = start_month;
	}

	public int getStart_date() {
		return start_date;
	}

	public void setStart_date(int start_date) {
		this.start_date = start_date;
	}

	public int getStart_hour() {
		return start_hour;
	}

	public void setStart_hour(int start_hour) {
		this.start_hour = start_hour;
	}

	public int getEnd_year() {
		return end_year;
	}

	public void setEnd_year(int end_year) {
		this.end_year = end_year;
	}

	public int getEnd_month() {
		return end_month;
	}

	public void setEnd_month(int end_month) {
		this.end_month = end_month;
	}

	public int getEnd_date() {
		return end_date;
	}

	public void setEnd_date(int end_date) {
		this.end_date = end_date;
	}

	public int getEnd_hour() {
		return end_hour;
	}

	public void setEnd_hour(int end_hour) {
		this.end_hour = end_hour;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
