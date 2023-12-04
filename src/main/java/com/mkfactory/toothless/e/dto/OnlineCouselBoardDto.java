package com.mkfactory.toothless.e.dto;

import java.sql.Date;

public class OnlineCouselBoardDto {

	private int id;
	private int student_id;
	private int type_category_id;
	private String text;
	private String title;
	private Date created_at;
	public OnlineCouselBoardDto() {
		super();
	}
	public OnlineCouselBoardDto(int id, int student_id, int type_category_id, String text, String title,
			Date created_at) {
		super();
		this.id = id;
		this.student_id = student_id;
		this.type_category_id = type_category_id;
		this.text = text;
		this.title = title;
		this.created_at = created_at;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public int getType_category_id() {
		return type_category_id;
	}
	public void setType_category_id(int type_category_id) {
		this.type_category_id = type_category_id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
}
