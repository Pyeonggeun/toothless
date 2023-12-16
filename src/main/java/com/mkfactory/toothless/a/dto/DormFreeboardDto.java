package com.mkfactory.toothless.a.dto;

import java.util.Date;

public class DormFreeboardDto {
	public int dorm_freeboard_pk;
	public int student_pk;
	public String title;
	public String content;
	public Date created_at;
	public DormFreeboardDto() {
		super();
	}
	public DormFreeboardDto(int dorm_freeboard_pk, int student_pk, String title, String content, Date created_at) {
		super();
		this.dorm_freeboard_pk = dorm_freeboard_pk;
		this.student_pk = student_pk;
		this.title = title;
		this.content = content;
		this.created_at = created_at;
	}
	public int getDorm_freeboard_pk() {
		return dorm_freeboard_pk;
	}
	public void setDorm_freeboard_pk(int dorm_freeboard_pk) {
		this.dorm_freeboard_pk = dorm_freeboard_pk;
	}
	public int getStudent_pk() {
		return student_pk;
	}
	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
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
