package com.mkfactory.toothless.a.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RequestRepairDto {
	public int request_repair_pk;
	public int dorm_student_pk;
	public String title;
	public String content;
	public String image_link;
	public Date request_date;
	public RequestRepairDto() {
		super();
	}
	public RequestRepairDto(int request_repair_pk, int dorm_student_pk, String title, String content, String image_link,
			Date request_date) {
		super();
		this.request_repair_pk = request_repair_pk;
		this.dorm_student_pk = dorm_student_pk;
		this.title = title;
		this.content = content;
		this.image_link = image_link;
		this.request_date = request_date;
	}
	public int getRequest_repair_pk() {
		return request_repair_pk;
	}
	public void setRequest_repair_pk(int request_repair_pk) {
		this.request_repair_pk = request_repair_pk;
	}
	public int getDorm_student_pk() {
		return dorm_student_pk;
	}
	public void setDorm_student_pk(int dorm_student_pk) {
		this.dorm_student_pk = dorm_student_pk;
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
	public String getImage_link() {
		return image_link;
	}
	public void setImage_link(String image_link) {
		this.image_link = image_link;
	}
	public Date getRequest_date() {
		return request_date;
	}
	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}
	
	
}
