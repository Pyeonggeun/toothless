package com.mkfactory.toothless.x.dto;

import java.util.Date;

public class LectureReviewDto {
	
	private int	lecture_review_key;
	private int lecture_student_key;
	private int star_count;
	private String review;
	private Date created_at;
	
	public LectureReviewDto() {
		super();
	}

	public LectureReviewDto(int lecture_review_key, int lecture_student_key, int star_count, String review,
			Date created_at) {
		super();
		this.lecture_review_key = lecture_review_key;
		this.lecture_student_key = lecture_student_key;
		this.star_count = star_count;
		this.review = review;
		this.created_at = created_at;
	}

	public int getLecture_review_key() {
		return lecture_review_key;
	}

	public void setLecture_review_key(int lecture_review_key) {
		this.lecture_review_key = lecture_review_key;
	}

	public int getLecture_student_key() {
		return lecture_student_key;
	}

	public void setLecture_student_key(int lecture_student_key) {
		this.lecture_student_key = lecture_student_key;
	}

	public int getStar_count() {
		return star_count;
	}

	public void setStar_count(int star_count) {
		this.star_count = star_count;
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
