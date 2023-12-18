package com.mkfactory.toothless.c.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AjdksInternEduApplying {
	
	private int internedu_applying_pk;
	private int internedu_program_pk;
	private int student_pk;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date applying_date; 
	
	private String completion;

	public AjdksInternEduApplying() {
		super();
	}

	public AjdksInternEduApplying(int internedu_applying_pk, int internedu_program_pk, int student_pk,
			Date applying_date, String completion) {
		super();
		this.internedu_applying_pk = internedu_applying_pk;
		this.internedu_program_pk = internedu_program_pk;
		this.student_pk = student_pk;
		this.applying_date = applying_date;
		this.completion = completion;
	}

	public int getInternedu_applying_pk() {
		return internedu_applying_pk;
	}

	public void setInternedu_applying_pk(int internedu_applying_pk) {
		this.internedu_applying_pk = internedu_applying_pk;
	}

	public int getInternedu_program_pk() {
		return internedu_program_pk;
	}

	public void setInternedu_program_pk(int internedu_program_pk) {
		this.internedu_program_pk = internedu_program_pk;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public Date getApplying_date() {
		return applying_date;
	}

	public void setApplying_date(Date applying_date) {
		this.applying_date = applying_date;
	}

	public String getCompletion() {
		return completion;
	}

	public void setCompletion(String completion) {
		this.completion = completion;
	}
	
	
	
	
	
}
