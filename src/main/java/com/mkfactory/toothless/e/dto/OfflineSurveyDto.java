package com.mkfactory.toothless.e.dto;

import java.util.Date;

public class OfflineSurveyDto {
	
	private int id;
	private int reservation_id;
	private int score;
	private String text;
	private Date created_at;
	
	public OfflineSurveyDto() {
		super();
	}

	public OfflineSurveyDto(int id, int reservation_id, int score, String text, Date created_at) {
		super();
		this.id = id;
		this.reservation_id = reservation_id;
		this.score = score;
		this.text = text;
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getReservation_id() {
		return reservation_id;
	}

	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
