package com.mkfactory.toothless.e.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FreeboardDto {

	private int id;
	private int student_pk;
	private String title;
	private String text;
	private String read_count;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date created_at;
	
	public FreeboardDto() {
		super();
	}

	public FreeboardDto(int id, int student_pk, String title, String text, String read_count, Date created_at) {
		super();
		this.id = id;
		this.student_pk = student_pk;
		this.title = title;
		this.text = text;
		this.read_count = read_count;
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getRead_count() {
		return read_count;
	}

	public void setRead_count(String read_count) {
		this.read_count = read_count;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	
	
	
}
