package com.mkfactory.toothless.c.dto;

import java.util.Date;

public class AjdksCompanyEvaluationDto {
	
	public int company_evaluation_pk;
	public int student_intern_pk;
	public int diligence_score;
	public int responsibility_score;
	public int coorporation_score;
	public int achievement_score;
	public String review;
	public Date created_at;
	
	public AjdksCompanyEvaluationDto() {
		super();
	}

	public AjdksCompanyEvaluationDto(int company_evaluation_pk, int student_intern_pk, int diligence_score,
			int responsibility_score, int coorporation_score, int achievement_score, String review, Date created_at) {
		super();
		this.company_evaluation_pk = company_evaluation_pk;
		this.student_intern_pk = student_intern_pk;
		this.diligence_score = diligence_score;
		this.responsibility_score = responsibility_score;
		this.coorporation_score = coorporation_score;
		this.achievement_score = achievement_score;
		this.review = review;
		this.created_at = created_at;
	}

	public int getCompany_evaluation_pk() {
		return company_evaluation_pk;
	}

	public void setCompany_evaluation_pk(int company_evaluation_pk) {
		this.company_evaluation_pk = company_evaluation_pk;
	}

	public int getStudent_intern_pk() {
		return student_intern_pk;
	}

	public void setStudent_intern_pk(int student_intern_pk) {
		this.student_intern_pk = student_intern_pk;
	}

	public int getDiligence_score() {
		return diligence_score;
	}

	public void setDiligence_score(int diligence_score) {
		this.diligence_score = diligence_score;
	}

	public int getResponsibility_score() {
		return responsibility_score;
	}

	public void setResponsibility_score(int responsibility_score) {
		this.responsibility_score = responsibility_score;
	}

	public int getCoorporation_score() {
		return coorporation_score;
	}

	public void setCoorporation_score(int coorporation_score) {
		this.coorporation_score = coorporation_score;
	}

	public int getAchievement_score() {
		return achievement_score;
	}

	public void setAchievement_score(int achievement_score) {
		this.achievement_score = achievement_score;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
