package com.mkfactory.toothless.d.dto;

import java.util.Date;

//온라인상담 Dto
public class OnlineConsultingDto {
	
	private int on_consulting_pk;
	private int hope_job_pk ;
	private String on_consulting_contents;
	private Date created_at;
	
	
	
	
	public OnlineConsultingDto() {
		super();
	}


	public OnlineConsultingDto(int on_consulting_pk, int hope_job_pk, String on_consulting_contents, Date created_at) {
		super();
		this.on_consulting_pk = on_consulting_pk;
		this.hope_job_pk = hope_job_pk;
		this.on_consulting_contents = on_consulting_contents;
		this.created_at = created_at;
	}


	public int getOn_consulting_pk() {
		return on_consulting_pk;
	}


	public void setOn_consulting_pk(int on_consulting_pk) {
		this.on_consulting_pk = on_consulting_pk;
	}


	public int getHope_job_pk() {
		return hope_job_pk;
	}


	public void setHope_job_pk(int hope_job_pk) {
		this.hope_job_pk = hope_job_pk;
	}


	public String getOn_consulting_contents() {
		return on_consulting_contents;
	}


	public void setOn_consulting_contents(String on_consulting_contents) {
		this.on_consulting_contents = on_consulting_contents;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
}
