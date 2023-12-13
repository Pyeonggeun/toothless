package com.mkfactory.toothless.c.dto;

import java.util.Date;

public class AjdksInternSatisfactionDto {
	
	private int intern_satisfaction_pk;
	private int student_intern_pk;
	private int rating;
	private String review;
	private Date created_at;
	
	public AjdksInternSatisfactionDto() {
		super();
	}

	public AjdksInternSatisfactionDto(int intern_satisfaction_pk, int student_intern_pk, int rating, String review,
			Date created_at) {
		super();
		this.intern_satisfaction_pk = intern_satisfaction_pk;
		this.student_intern_pk = student_intern_pk;
		this.rating = rating;
		this.review = review;
		this.created_at = created_at;
	}

	public int getIntern_satisfaction_pk() {
		return intern_satisfaction_pk;
	}

	public void setIntern_satisfaction_pk(int intern_satisfaction_pk) {
		this.intern_satisfaction_pk = intern_satisfaction_pk;
	}

	public int getStudent_intern_pk() {
		return student_intern_pk;
	}

	public void setStudent_intern_pk(int student_intern_pk) {
		this.student_intern_pk = student_intern_pk;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
