package com.mkfactory.toothless.b.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class EduDto {
	
	private int edu_pk;
	private int edu_cat_pk;
	private int staff_pk;
	private String name;
	private String content;
	private String img_link;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date apply_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date apply_end_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edu_date;
	private String place;
	private int capacity;
	private Date created_at;
	
	public EduDto() {
		super();
	}

	public EduDto(int edu_pk, int edu_cat_pk, int staff_pk, String name, String content, String img_link,
			Date apply_start_date, Date apply_end_date, Date edu_date, String place, int capacity, Date created_at) {
		super();
		this.edu_pk = edu_pk;
		this.edu_cat_pk = edu_cat_pk;
		this.staff_pk = staff_pk;
		this.name = name;
		this.content = content;
		this.img_link = img_link;
		this.apply_start_date = apply_start_date;
		this.apply_end_date = apply_end_date;
		this.edu_date = edu_date;
		this.place = place;
		this.capacity = capacity;
		this.created_at = created_at;
	}

	public int getEdu_pk() {
		return edu_pk;
	}

	public void setEdu_pk(int edu_pk) {
		this.edu_pk = edu_pk;
	}

	public int getEdu_cat_pk() {
		return edu_cat_pk;
	}

	public void setEdu_cat_pk(int edu_cat_pk) {
		this.edu_cat_pk = edu_cat_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg_link() {
		return img_link;
	}

	public void setImg_link(String img_link) {
		this.img_link = img_link;
	}

	public Date getApply_start_date() {
		return apply_start_date;
	}

	public void setApply_start_date(Date apply_start_date) {
		this.apply_start_date = apply_start_date;
	}

	public Date getApply_end_date() {
		return apply_end_date;
	}

	public void setApply_end_date(Date apply_end_date) {
		this.apply_end_date = apply_end_date;
	}

	public Date getEdu_date() {
		return edu_date;
	}

	public void setEdu_date(Date edu_date) {
		this.edu_date = edu_date;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
