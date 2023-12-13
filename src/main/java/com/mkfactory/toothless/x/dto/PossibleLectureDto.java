package com.mkfactory.toothless.x.dto;

import java.util.Date;

public class PossibleLectureDto {
	
	private int possible_lecture_key;
	private int lecturer_key;
	private int lecture_category_key;
	private Date created_at;
	
	
	public PossibleLectureDto() {}


	public PossibleLectureDto(int possible_lecture_key, int lecturer_key, int lecture_category_key, Date created_at) {
		
		this.possible_lecture_key = possible_lecture_key;
		this.lecturer_key = lecturer_key;
		this.lecture_category_key = lecture_category_key;
		this.created_at = created_at;
	}


	public int getPossible_lecture_key() {
		return possible_lecture_key;
	}


	public void setPossible_lecture_key(int possible_lecture_key) {
		this.possible_lecture_key = possible_lecture_key;
	}


	public int getLecturer_key() {
		return lecturer_key;
	}


	public void setLecturer_key(int lecturer_key) {
		this.lecturer_key = lecturer_key;
	}


	public int getLecture_category_key() {
		return lecture_category_key;
	}


	public void setLecture_category_key(int lecture_category_key) {
		this.lecture_category_key = lecture_category_key;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
	
	
	
}
