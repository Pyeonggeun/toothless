package com.mkfactory.toothless.e.dto;

import java.util.Date;

public class CounselDocumentDto {
	
	private int id;
	private int reservation_id;
	private String text;
	private Date created_at;
	
	public CounselDocumentDto() {
		super();
	}

	public CounselDocumentDto(int id, int reservation_id, String text, Date created_at) {
		super();
		this.id = id;
		this.reservation_id = reservation_id;
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
