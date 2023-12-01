package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class HopeJobDto {
	private int hope_job_pk;
	private int student_pk;
	private int hope_salary;
	private String hope_area;
	private String requierments;
	private String is_end_hope_job;
	private Date created_at;
	
	
	public HopeJobDto() {
		super();
	}


	public HopeJobDto(int hope_job_pk, int student_pk, int hope_salary, String hope_area, String requierments,
			String is_end_hope_job, Date created_at) {
		super();
		this.hope_job_pk = hope_job_pk;
		this.student_pk = student_pk;
		this.hope_salary = hope_salary;
		this.hope_area = hope_area;
		this.requierments = requierments;
		this.is_end_hope_job = is_end_hope_job;
		this.created_at = created_at;
	}


	public int getHope_job_pk() {
		return hope_job_pk;
	}


	public void setHope_job_pk(int hope_job_pk) {
		this.hope_job_pk = hope_job_pk;
	}


	public int getStudent_pk() {
		return student_pk;
	}


	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}


	public int getHope_salary() {
		return hope_salary;
	}


	public void setHope_salary(int hope_salary) {
		this.hope_salary = hope_salary;
	}


	public String getHope_area() {
		return hope_area;
	}


	public void setHope_area(String hope_area) {
		this.hope_area = hope_area;
	}


	public String getRequierments() {
		return requierments;
	}


	public void setRequierments(String requierments) {
		this.requierments = requierments;
	}


	public String getIs_end_hope_job() {
		return is_end_hope_job;
	}


	public void setIs_end_hope_job(String is_end_hope_job) {
		this.is_end_hope_job = is_end_hope_job;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
}
