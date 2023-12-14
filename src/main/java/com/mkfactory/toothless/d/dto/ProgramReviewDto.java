package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class ProgramReviewDto {
	private int program_review_pk;
	private int program_apply_pk;
	private int prg_score;
	private String prg_comment;
	private Date created_at;
	
	public ProgramReviewDto() {
		super();
	}

	public ProgramReviewDto(int program_review_pk, int program_apply_pk, int prg_score, String prg_comment,
			Date created_at) {
		super();
		this.program_review_pk = program_review_pk;
		this.program_apply_pk = program_apply_pk;
		this.prg_score = prg_score;
		this.prg_comment = prg_comment;
		this.created_at = created_at;
	}

	public int getProgram_review_pk() {
		return program_review_pk;
	}

	public void setProgram_review_pk(int program_review_pk) {
		this.program_review_pk = program_review_pk;
	}

	public int getProgram_apply_pk() {
		return program_apply_pk;
	}

	public void setProgram_apply_pk(int program_apply_pk) {
		this.program_apply_pk = program_apply_pk;
	}

	public int getPrg_score() {
		return prg_score;
	}

	public void setPrg_score(int prg_score) {
		this.prg_score = prg_score;
	}

	public String getPrg_comment() {
		return prg_comment;
	}

	public void setPrg_comment(String prg_comment) {
		this.prg_comment = prg_comment;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
