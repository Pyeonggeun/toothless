package com.mkfactory.toothless.e.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeBoardDto {
	
	private int id;
	private int staff_pk;
	private String title;
	private String text;
	private int read_count;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date created_at;
	
	public NoticeBoardDto() {
		super();
	}

	public NoticeBoardDto(int id, int staff_pk, String title, String text, int read_count, Date created_at) {
		super();
		this.id = id;
		this.staff_pk = staff_pk;
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

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
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
