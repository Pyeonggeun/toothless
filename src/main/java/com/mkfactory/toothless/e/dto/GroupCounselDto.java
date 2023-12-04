package com.mkfactory.toothless.e.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class GroupCounselDto {
	
	public int id;
	public String title;
	public String text;
	public String posterImage;
	public String location;
	public int amount;
	@DateTimeFormat(pattern = "yyyy-MM-dd") //만약 input type="date" 가 날라 오는 경우 무조건 얘 붙여야됨
	public Date counsel_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date start_apply_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date end_apply_date;
	public Date created_at;
	
	public GroupCounselDto() {
		super();
	}

	public GroupCounselDto(int id, String title, String text, String posterImage, String location, int amount,
			Date counsel_date, Date start_apply_date, Date end_apply_date, Date created_at) {
		super();
		this.id = id;
		this.title = title;
		this.text = text;
		this.posterImage = posterImage;
		this.location = location;
		this.amount = amount;
		this.counsel_date = counsel_date;
		this.start_apply_date = start_apply_date;
		this.end_apply_date = end_apply_date;
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getPosterImage() {
		return posterImage;
	}

	public void setPosterImage(String posterImage) {
		this.posterImage = posterImage;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getCounsel_date() {
		return counsel_date;
	}

	public void setCounsel_date(Date counsel_date) {
		this.counsel_date = counsel_date;
	}

	public Date getStart_apply_date() {
		return start_apply_date;
	}

	public void setStart_apply_date(Date start_apply_date) {
		this.start_apply_date = start_apply_date;
	}

	public Date getEnd_apply_date() {
		return end_apply_date;
	}

	public void setEnd_apply_date(Date end_apply_date) {
		this.end_apply_date = end_apply_date;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
