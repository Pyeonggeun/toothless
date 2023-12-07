package com.mkfactory.toothless.d.dto;

public class InterestPostingDto {
	
	public int interest_posting_pk;
	public int job_posting_pk;
	public int student_pk;
	
	public InterestPostingDto() {
		super();
	}

	public InterestPostingDto(int interest_posting_pk, int job_posting_pk, int student_pk) {
		super();
		this.interest_posting_pk = interest_posting_pk;
		this.job_posting_pk = job_posting_pk;
		this.student_pk = student_pk;
	}

	public int getInterest_posting_pk() {
		return interest_posting_pk;
	}

	public void setInterest_posting_pk(int interest_posting_pk) {
		this.interest_posting_pk = interest_posting_pk;
	}

	public int getJob_posting_pk() {
		return job_posting_pk;
	}

	public void setJob_posting_pk(int job_posting_pk) {
		this.job_posting_pk = job_posting_pk;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}
	

}
