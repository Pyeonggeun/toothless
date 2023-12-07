package com.mkfactory.toothless.d.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ConsultingDto {
	
	private int consulting_pk; 
	private int hope_job_pk;
	private int staff_pk;
	private String consulting_contents;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date consulting_date;
	private Date created_at;
	
	public ConsultingDto() {
		super();
	}

	public ConsultingDto(int consulting_pk, int hope_job_pk, int staff_pk, String consulting_contents,
			Date consulting_date, Date created_at) {
		super();
		this.consulting_pk = consulting_pk;
		this.hope_job_pk = hope_job_pk;
		this.staff_pk = staff_pk;
		this.consulting_contents = consulting_contents;
		this.consulting_date = consulting_date;
		this.created_at = created_at;
	}

	public int getConsulting_pk() {
		return consulting_pk;
	}

	public void setConsulting_pk(int consulting_pk) {
		this.consulting_pk = consulting_pk;
	}

	public int getHope_job_pk() {
		return hope_job_pk;
	}

	public void setHope_job_pk(int hope_job_pk) {
		this.hope_job_pk = hope_job_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}

	public String getConsulting_contents() {
		return consulting_contents;
	}

	public void setConsulting_contents(String consulting_contents) {
		this.consulting_contents = consulting_contents;
	}

	public Date getConsulting_date() {
		return consulting_date;
	}

	public void setConsulting_date(Date consulting_date) {
		this.consulting_date = consulting_date;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
}
