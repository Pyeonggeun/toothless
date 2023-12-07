package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class VolunteerDto {

	private int volunteer_pk;
	private int job_posting_pk;
	private int resume_pk;
	private String vol_phone;
	private String vol_email;
	private Date created_at;
	
	public VolunteerDto() {
		super();
	}

	public VolunteerDto(int volunteer_pk, int job_posting_pk, int resume_pk, String vol_phone, String vol_email,
			Date created_at) {
		super();
		this.volunteer_pk = volunteer_pk;
		this.job_posting_pk = job_posting_pk;
		this.resume_pk = resume_pk;
		this.vol_phone = vol_phone;
		this.vol_email = vol_email;
		this.created_at = created_at;
	}

	public int getVolunteer_pk() {
		return volunteer_pk;
	}

	public void setVolunteer_pk(int volunteer_pk) {
		this.volunteer_pk = volunteer_pk;
	}

	public int getJob_posting_pk() {
		return job_posting_pk;
	}

	public void setJob_posting_pk(int job_posting_pk) {
		this.job_posting_pk = job_posting_pk;
	}

	public int getResume_pk() {
		return resume_pk;
	}

	public void setResume_pk(int resume_pk) {
		this.resume_pk = resume_pk;
	}

	public String getVol_phone() {
		return vol_phone;
	}

	public void setVol_phone(String vol_phone) {
		this.vol_phone = vol_phone;
	}

	public String getVol_email() {
		return vol_email;
	}

	public void setVol_email(String vol_email) {
		this.vol_email = vol_email;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
