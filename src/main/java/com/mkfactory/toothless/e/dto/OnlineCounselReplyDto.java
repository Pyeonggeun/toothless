package com.mkfactory.toothless.e.dto;

import java.util.Date;

public class OnlineCounselReplyDto {

	private int id;
	private int counselor_id;
	private int online_counsel_board_id;
	private String text;
	private Date created_at;
	public OnlineCounselReplyDto() {
		super();
	}
	public OnlineCounselReplyDto(int id, int counselor_id, int online_counsel_board_id, String text, Date created_at) {
		super();
		this.id = id;
		this.counselor_id = counselor_id;
		this.online_counsel_board_id = online_counsel_board_id;
		this.text = text;
		this.created_at = created_at;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCounselor_id() {
		return counselor_id;
	}
	public void setCounselor_id(int counselor_id) {
		this.counselor_id = counselor_id;
	}
	public int getOnline_counsel_board_id() {
		return online_counsel_board_id;
	}
	public void setOnline_counsel_board_id(int online_counsel_board_id) {
		this.online_counsel_board_id = online_counsel_board_id;
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
