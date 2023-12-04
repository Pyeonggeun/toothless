package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class OnlineConsultingReplyDto {
	
	private int on_consulting_reply_pk ;
	private int on_consulting_pk;
	private int staff_pk;
	private String on_contents_reply;
	private Date created_at;
	
	
	public OnlineConsultingReplyDto() {
		super();
	}


	public OnlineConsultingReplyDto(int on_consulting_reply_pk, int on_consulting_pk, int staff_pk,
			String on_contents_reply, Date created_at) {
		super();
		this.on_consulting_reply_pk = on_consulting_reply_pk;
		this.on_consulting_pk = on_consulting_pk;
		this.staff_pk = staff_pk;
		this.on_contents_reply = on_contents_reply;
		this.created_at = created_at;
	}


	public int getOn_consulting_reply_pk() {
		return on_consulting_reply_pk;
	}


	public void setOn_consulting_reply_pk(int on_consulting_reply_pk) {
		this.on_consulting_reply_pk = on_consulting_reply_pk;
	}


	public int getOn_consulting_pk() {
		return on_consulting_pk;
	}


	public void setOn_consulting_pk(int on_consulting_pk) {
		this.on_consulting_pk = on_consulting_pk;
	}


	public int getStaff_pk() {
		return staff_pk;
	}


	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}


	public String getOn_contents_reply() {
		return on_contents_reply;
	}


	public void setOn_contents_reply(String on_contents_reply) {
		this.on_contents_reply = on_contents_reply;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
