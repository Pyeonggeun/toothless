package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class StaffNoticeboardDto {
	
	private int staff_noticeboard_pk;
	private int staff_pk;
	private String title;
	private String content;
	private int read_count;
	private Date created_at;
	
	public StaffNoticeboardDto() {
		super();
	}

	public StaffNoticeboardDto(int staff_noticeboard_pk, int staff_pk, String title, String content, int read_count,
			Date created_at) {
		super();
		this.staff_noticeboard_pk = staff_noticeboard_pk;
		this.staff_pk = staff_pk;
		this.title = title;
		this.content = content;
		this.read_count = read_count;
		this.created_at = created_at;
	}

	public int getStaff_noticeboard_pk() {
		return staff_noticeboard_pk;
	}

	public void setStaff_noticeboard_pk(int staff_noticeboard_pk) {
		this.staff_noticeboard_pk = staff_noticeboard_pk;
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
