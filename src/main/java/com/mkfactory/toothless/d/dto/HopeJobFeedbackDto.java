package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class HopeJobFeedbackDto {
	
	private int hope_job_feedback_pk;
	private int hope_job_pk;
	private int hjf_score;
	private String hjf_comment;
	private Date created_at;
	
	public HopeJobFeedbackDto() {
		super();
	}

	public HopeJobFeedbackDto(int hope_job_feedback_pk, int hope_job_pk, int hjf_score, String hjf_comment,
			Date created_at) {
		super();
		this.hope_job_feedback_pk = hope_job_feedback_pk;
		this.hope_job_pk = hope_job_pk;
		this.hjf_score = hjf_score;
		this.hjf_comment = hjf_comment;
		this.created_at = created_at;
	}

	public int getHope_job_feedback_pk() {
		return hope_job_feedback_pk;
	}

	public void setHope_job_feedback_pk(int hope_job_feedback_pk) {
		this.hope_job_feedback_pk = hope_job_feedback_pk;
	}

	public int getHope_job_pk() {
		return hope_job_pk;
	}

	public void setHope_job_pk(int hope_job_pk) {
		this.hope_job_pk = hope_job_pk;
	}

	public int getHjf_score() {
		return hjf_score;
	}

	public void setHjf_score(int hjf_score) {
		this.hjf_score = hjf_score;
	}

	public String getHjf_comment() {
		return hjf_comment;
	}

	public void setHjf_comment(String hjf_comment) {
		this.hjf_comment = hjf_comment;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	} 
	
	
	
	
}
