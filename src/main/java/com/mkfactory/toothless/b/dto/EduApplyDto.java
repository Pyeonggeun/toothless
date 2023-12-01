package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class EduApplyDto {

	private int edu_apply_pk;
	private int	student_pk;
	private int edu_pk;
	private String status;
	private Date created_at;
	
	public EduApplyDto() {
		super();
	}

	public EduApplyDto(int edu_apply_pk, int student_pk, int edu_pk, String status, Date created_at) {
		super();
		this.edu_apply_pk = edu_apply_pk;
		this.student_pk = student_pk;
		this.edu_pk = edu_pk;
		this.status = status;
		this.created_at = created_at;
	}

	public int getEdu_apply_pk() {
		return edu_apply_pk;
	}

	public void setEdu_apply_pk(int edu_apply_pk) {
		this.edu_apply_pk = edu_apply_pk;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public int getEdu_pk() {
		return edu_pk;
	}

	public void setEdu_pk(int edu_pk) {
		this.edu_pk = edu_pk;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
