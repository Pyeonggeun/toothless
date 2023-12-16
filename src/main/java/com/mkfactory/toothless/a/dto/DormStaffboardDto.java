package com.mkfactory.toothless.a.dto;

import java.util.Date;

public class DormStaffboardDto {
	public int dorm_staffboard_pk;
	public int staff_pk;
	public String title;
	public String content;
	public Date created_at;
	public DormStaffboardDto() {
		super();
	}
	public DormStaffboardDto(int dorm_staffboard_pk, int staff_pk, String title, String content, Date created_at) {
		super();
		this.dorm_staffboard_pk = dorm_staffboard_pk;
		this.staff_pk = staff_pk;
		this.title = title;
		this.content = content;
		this.created_at = created_at;
	}
	public int getDorm_staffboard_pk() {
		return dorm_staffboard_pk;
	}
	public void setDorm_staffboard_pk(int dorm_staffboard_pk) {
		this.dorm_staffboard_pk = dorm_staffboard_pk;
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
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
