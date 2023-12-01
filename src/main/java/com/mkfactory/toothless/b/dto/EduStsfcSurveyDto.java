package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class EduStsfcSurveyDto {

	private int edu_stsfc_survey_pk;
	private int edu_apply_pk;
	private int star_rated;
	private String content;
	private Date created_at;
	
	public EduStsfcSurveyDto() {
		super();
	}

	public EduStsfcSurveyDto(int edu_stsfc_survey_pk, int edu_apply_pk, int star_rated, String content,
			Date created_at) {
		super();
		this.edu_stsfc_survey_pk = edu_stsfc_survey_pk;
		this.edu_apply_pk = edu_apply_pk;
		this.star_rated = star_rated;
		this.content = content;
		this.created_at = created_at;
	}

	public int getEdu_stsfc_survey_pk() {
		return edu_stsfc_survey_pk;
	}

	public void setEdu_stsfc_survey_pk(int edu_stsfc_survey_pk) {
		this.edu_stsfc_survey_pk = edu_stsfc_survey_pk;
	}

	public int getEdu_apply_pk() {
		return edu_apply_pk;
	}

	public void setEdu_apply_pk(int edu_apply_pk) {
		this.edu_apply_pk = edu_apply_pk;
	}

	public int getStar_rated() {
		return star_rated;
	}

	public void setStar_rated(int star_rated) {
		this.star_rated = star_rated;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
