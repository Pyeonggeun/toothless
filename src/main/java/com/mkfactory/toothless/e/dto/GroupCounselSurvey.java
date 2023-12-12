package com.mkfactory.toothless.e.dto;

import java.util.Date;

public class GroupCounselSurvey {

	private int id;
	private int group_reservation_id;
	private int score;
	private String text;
	private Date created_at;
	
	public GroupCounselSurvey() {
		super();
	}

	public GroupCounselSurvey(int id, int group_reservation_id, int score, String text, Date created_at) {
		super();
		this.id = id;
		this.group_reservation_id = group_reservation_id;
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

	public int getGroup_reservation_id() {
		return group_reservation_id;
	}

	public void setGroup_reservation_id(int group_reservation_id) {
		this.group_reservation_id = group_reservation_id;
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
