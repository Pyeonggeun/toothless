package com.mkfactory.toothless.c.dto;

import java.util.Date;

public class AjdksInternEduReviewDto {
	
	private int internedu_review_pk;
	private int internedu_applying_pk;
	private int rating;
	private String review;
	private Date created_at;
	
	public AjdksInternEduReviewDto() {
		super();
	}
	
	public AjdksInternEduReviewDto(int internedu_review_pk, int internedu_applying_pk, int rating, String review,
			Date created_at) {
		super();
		this.internedu_review_pk = internedu_review_pk;
		this.internedu_applying_pk = internedu_applying_pk;
		this.rating = rating;
		this.review = review;
		this.created_at = created_at;
	}
	public int getInternedu_review_pk() {
		return internedu_review_pk;
	}
	public void setInternedu_review_pk(int internedu_review_pk) {
		this.internedu_review_pk = internedu_review_pk;
	}
	public int getInternedu_applying_pk() {
		return internedu_applying_pk;
	}
	public void setInternedu_applying_pk(int internedu_applying_pk) {
		this.internedu_applying_pk = internedu_applying_pk;
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
