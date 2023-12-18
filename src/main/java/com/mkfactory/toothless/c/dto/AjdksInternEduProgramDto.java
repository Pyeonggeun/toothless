package com.mkfactory.toothless.c.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AjdksInternEduProgramDto {

	private int internedu_program_pk;
	private int staff_pk;
	private String title;
	private String content;
	private String place; 	
	private String lecturer;
	private int maximum_applicant;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date deadline_date;
	private String progress_date;
	private String poster_image;
	private Date created_at;
	
	public AjdksInternEduProgramDto() {
		super();
	}

	public AjdksInternEduProgramDto(int internedu_program_pk, int staff_pk, String title, String content, String place,
			String lecturer, int maximum_applicant, Date deadline_date, String progress_date, String poster_image,
			Date created_at) {
		super();
		this.internedu_program_pk = internedu_program_pk;
		this.staff_pk = staff_pk;
		this.title = title;
		this.content = content;
		this.place = place;
		this.lecturer = lecturer;
		this.maximum_applicant = maximum_applicant;
		this.deadline_date = deadline_date;
		this.progress_date = progress_date;
		this.poster_image = poster_image;
		this.created_at = created_at;
	}

	public int getInternedu_program_pk() {
		return internedu_program_pk;
	}

	public void setInternedu_program_pk(int internedu_program_pk) {
		this.internedu_program_pk = internedu_program_pk;
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

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getLecturer() {
		return lecturer;
	}

	public void setLecturer(String lecturer) {
		this.lecturer = lecturer;
	}

	public int getMaximum_applicant() {
		return maximum_applicant;
	}

	public void setMaximum_applicant(int maximum_applicant) {
		this.maximum_applicant = maximum_applicant;
	}

	public Date getDeadline_date() {
		return deadline_date;
	}

	public void setDeadline_date(Date deadline_date) {
		this.deadline_date = deadline_date;
	}

	public String getProgress_date() {
		return progress_date;
	}

	public void setProgress_date(String progress_date) {
		this.progress_date = progress_date;
	}

	public String getPoster_image() {
		return poster_image;
	}

	public void setPoster_image(String poster_image) {
		this.poster_image = poster_image;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	


}