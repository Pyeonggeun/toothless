package com.mkfactory.toothless.a.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DiaryDto {

	private int diary_pk;
	private int executive_pk;
	private String content;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date created_at;
	
	public DiaryDto() {
		super();
	}
	
	public DiaryDto(int diary_pk, int executive_pk, String content, Date created_at) {
		super();
		this.diary_pk = diary_pk;
		this.executive_pk = executive_pk;
		this.content = content;
		this.created_at = created_at;
	}

	public int getDiary_pk() {
		return diary_pk;
	}

	public void setDiary_pk(int diary_pk) {
		this.diary_pk = diary_pk;
	}

	public int getExecutive_pk() {
		return executive_pk;
	}

	public void setExecutive_pk(int executive_pk) {
		this.executive_pk = executive_pk;
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
