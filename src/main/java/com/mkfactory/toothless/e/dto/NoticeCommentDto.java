package com.mkfactory.toothless.e.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeCommentDto {

	private int id;
	private int notice_id;
	private int student_pk;
	private String text;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date created_at;
	
	public NoticeCommentDto() {
		super();
	}

	public NoticeCommentDto(int id, int notice_id, int student_pk, String text, Date created_at) {
		super();
		this.id = id;
		this.notice_id = notice_id;
		this.student_pk = student_pk;
		this.text = text;
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
