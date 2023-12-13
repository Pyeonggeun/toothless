package com.mkfactory.toothless.c.dto;

import java.util.Date;

public class AjdksInternReportDto {
	
	private int intern_report_pk;
	private int student_intern_pk;
	private String report_content;
	private Date created_at;
	
	public AjdksInternReportDto() {
		super();
	}

	public AjdksInternReportDto(int intern_report_pk, int student_intern_pk, String report_content, Date created_at) {
		super();
		this.intern_report_pk = intern_report_pk;
		this.student_intern_pk = student_intern_pk;
		this.report_content = report_content;
		this.created_at = created_at;
	}

	public int getIntern_report_pk() {
		return intern_report_pk;
	}

	public void setIntern_report_pk(int intern_report_pk) {
		this.intern_report_pk = intern_report_pk;
	}

	public int getStudent_intern_pk() {
		return student_intern_pk;
	}

	public void setStudent_intern_pk(int student_intern_pk) {
		this.student_intern_pk = student_intern_pk;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
