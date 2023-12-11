package com.mkfactory.toothless.e.dto;

import java.util.Date;

public class OnlineCounselSurveyDto {

	private int id;
	private int online_counsel_board_id;
	private int score;
	private String text;
	private Date created_at;
	public OnlineCounselSurveyDto() {
		super();
	}
	public OnlineCounselSurveyDto(int id, int online_counsel_board_id, int score, String text, Date created_at) {
		super();
		this.id = id;
		this.online_counsel_board_id = online_counsel_board_id;
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
	public int getOnline_counsel_board_id() {
		return online_counsel_board_id;
	}
	public void setOnline_counsel_board_id(int online_counsel_board_id) {
		this.online_counsel_board_id = online_counsel_board_id;
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
