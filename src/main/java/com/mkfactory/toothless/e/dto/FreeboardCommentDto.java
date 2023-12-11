package com.mkfactory.toothless.e.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FreeboardCommentDto {
	
	private int id;
	private int freeboard_id;
	private int student_pk;
	private String text; 
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private Date created_At;
	
	public FreeboardCommentDto() {
		super();
	}

	public FreeboardCommentDto(int id, int freeboard_id, int student_pk, String text, Date created_At) {
		super();
		this.id = id;
		this.freeboard_id = freeboard_id;
		this.student_pk = student_pk;
		this.text = text;
		this.created_At = created_At;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFreeboard_id() {
		return freeboard_id;
	}

	public void setFreeboard_id(int freeboard_id) {
		this.freeboard_id = freeboard_id;
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

	public Date getCreated_At() {
		return created_At;
	}

	public void setCreated_At(Date created_At) {
		this.created_At = created_At;
	}
	
	
	
	
	
	

}
