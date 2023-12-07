package com.mkfactory.toothless.donot.touch.dto;

import java.util.Date;

public class NotificationDto {
	private int notification_pk;
	private int student_pk;
	private int center_pk;
	private String message;
	private String pageLink;
	private String checkRead;
	private String checkNotify;
	private Date created_at;
	public NotificationDto() {
		super();
	}
	public NotificationDto(int notification_pk, int student_pk,int center_pk, String message, String pageLink, String checkRead,
			String checkNotify, Date created_at) {
		super();
		this.notification_pk = notification_pk;
		this.student_pk = student_pk;
		this.center_pk = center_pk;
		this.message = message;
		this.pageLink = pageLink;
		this.checkRead = checkRead;
		this.checkNotify = checkNotify;
		this.created_at = created_at;
	}
	public int getNotification_pk() {
		return notification_pk;
	}
	public int getCenter_pk() {
		return center_pk;
	}
	public void setCenter_pk(int center_pk) {
		this.center_pk = center_pk;
	}
	public void setNotification_pk(int notification_pk) {
		this.notification_pk = notification_pk;
	}
	public int getStudent_pk() {
		return student_pk;
	}
	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPageLink() {
		return pageLink;
	}
	public void setPageLink(String pageLink) {
		this.pageLink = pageLink;
	}
	public String getCheckRead() {
		return checkRead;
	}
	public void setCheckRead(String checkRead) {
		this.checkRead = checkRead;
	}
	public String getCheckNotify() {
		return checkNotify;
	}
	public void setCheckNotify(String checkNotify) {
		this.checkNotify = checkNotify;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
