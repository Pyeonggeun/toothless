package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class StudentboardDto {

	private int studentboard_pk;
	private int staff_pk;
	private String title;
	private String content;
	private int read_count;
	private String img_link;
	private Date created_at;
	
	public StudentboardDto() {
		super();
	}
	
	public StudentboardDto(int studentboard_pk, int staff_pk, String title, String content, int read_count,
			String img_link, Date created_at) {
		super();
		this.studentboard_pk = studentboard_pk;
		this.staff_pk = staff_pk;
		this.title = title;
		this.content = content;
		this.read_count = read_count;
		this.img_link = img_link;
		this.created_at = created_at;
	}

	public int getStudentboard_pk() {
		return studentboard_pk;
	}

	public void setStudentboard_pk(int studentboard_pk) {
		this.studentboard_pk = studentboard_pk;
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

	public String getImg_link() {
		return img_link;
	}

	public void setImg_link(String img_link) {
		this.img_link = img_link;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
