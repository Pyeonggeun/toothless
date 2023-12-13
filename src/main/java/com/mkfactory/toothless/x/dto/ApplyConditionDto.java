package com.mkfactory.toothless.x.dto;

import java.util.Date;

public class ApplyConditionDto {
	
	private int condition_key;
	private int lecture_info_key;
	private int condition_lecture_key;
	private Date created_at;
	
	
	public ApplyConditionDto() {}


	public ApplyConditionDto(int condition_key, int lecture_info_key, int condition_lecture_key, Date created_at) {
		
		this.condition_key = condition_key;
		this.lecture_info_key = lecture_info_key;
		this.condition_lecture_key = condition_lecture_key;
		this.created_at = created_at;
	}


	public int getCondition_key() {
		return condition_key;
	}


	public void setCondition_key(int condition_key) {
		this.condition_key = condition_key;
	}


	public int getLecture_info_key() {
		return lecture_info_key;
	}


	public void setLecture_info_key(int lecture_info_key) {
		this.lecture_info_key = lecture_info_key;
	}


	public int getCondition_lecture_key() {
		return condition_lecture_key;
	}


	public void setCondition_lecture_key(int condition_lecture_key) {
		this.condition_lecture_key = condition_lecture_key;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
	
}
