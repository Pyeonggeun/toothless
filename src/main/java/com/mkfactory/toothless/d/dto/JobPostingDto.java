package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class JobPostingDto {
	
	public int job_posting_pk;
	public int com_pk;
	public int staff_pk;
	public int job_field_category_pk;
	public String posting_name;
	public String job_position;
	public String posting_mainimage;
	public String posting_contents;
	public String preference;
	public int hire_number;
	public Date posting_deadline;
	public Date created_at;
	
	public JobPostingDto() {
		super();
	}

	public JobPostingDto(int job_posting_pk, int com_pk, int staff_pk, int job_field_category_pk, String posting_name,
			String job_position, String posting_mainimage, String posting_contents, String preference, int hire_number,
			Date posting_deadline, Date created_at) {
		super();
		this.job_posting_pk = job_posting_pk;
		this.com_pk = com_pk;
		this.staff_pk = staff_pk;
		this.job_field_category_pk = job_field_category_pk;
		this.posting_name = posting_name;
		this.job_position = job_position;
		this.posting_mainimage = posting_mainimage;
		this.posting_contents = posting_contents;
		this.preference = preference;
		this.hire_number = hire_number;
		this.posting_deadline = posting_deadline;
		this.created_at = created_at;
	}

	public int getJob_posting_pk() {
		return job_posting_pk;
	}

	public void setJob_posting_pk(int job_posting_pk) {
		this.job_posting_pk = job_posting_pk;
	}

	public int getCom_pk() {
		return com_pk;
	}

	public void setCom_pk(int com_pk) {
		this.com_pk = com_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}

	public int getJob_field_category_pk() {
		return job_field_category_pk;
	}

	public void setJob_field_category_pk(int job_field_category_pk) {
		this.job_field_category_pk = job_field_category_pk;
	}

	public String getPosting_name() {
		return posting_name;
	}

	public void setPosting_name(String posting_name) {
		this.posting_name = posting_name;
	}

	public String getJob_position() {
		return job_position;
	}

	public void setJob_position(String job_position) {
		this.job_position = job_position;
	}

	public String getPosting_mainimage() {
		return posting_mainimage;
	}

	public void setPosting_mainimage(String posting_mainimage) {
		this.posting_mainimage = posting_mainimage;
	}

	public String getPosting_contents() {
		return posting_contents;
	}

	public void setPosting_contents(String posting_contents) {
		this.posting_contents = posting_contents;
	}

	public String getPreference() {
		return preference;
	}

	public void setPreference(String preference) {
		this.preference = preference;
	}

	public int getHire_number() {
		return hire_number;
	}

	public void setHire_number(int hire_number) {
		this.hire_number = hire_number;
	}

	public Date getPosting_deadline() {
		return posting_deadline;
	}

	public void setPosting_deadline(Date posting_deadline) {
		this.posting_deadline = posting_deadline;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
