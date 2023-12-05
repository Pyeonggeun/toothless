package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class StaffboardDto {

	private int staffboard_pk;
	private int staff_pk;
	private String title;
	private String content;
	private int read_count;
	private Date created_at;
	
	public StaffboardDto() {
		super();
	}

	public StaffboardDto(int staffboard_pk, int staff_pk, String title, String content, int read_count,
			Date created_at) {
		super();
		this.staffboard_pk = staffboard_pk;
		this.staff_pk = staff_pk;
		this.title = title;
		this.content = content;
		this.read_count = read_count;
		this.created_at = created_at;
	}

	public int getStaffboard_pk() {
		return staffboard_pk;
	}

	public void setStaffboard_pk(int staffboard_pk) {
		this.staffboard_pk = staffboard_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
