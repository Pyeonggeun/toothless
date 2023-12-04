package com.mkfactory.toothless.a.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class JoinDormApplicationDto {

	private int dorm_application_pk;
	private int student_pk;
	private int dorm_info_pk;
	private Date created_at;
	private String priority_select;
	private String selection_status;
	private String payment_status;
	
	
	
	public JoinDormApplicationDto() {}



	public JoinDormApplicationDto(int dorm_application_pk, int student_pk, int dorm_info_pk, Date created_at,
			String priority_select, String selection_status, String payment_status) {
		
		this.dorm_application_pk = dorm_application_pk;
		this.student_pk = student_pk;
		this.dorm_info_pk = dorm_info_pk;
		this.created_at = created_at;
		this.priority_select = priority_select;
		this.selection_status = selection_status;
		this.payment_status = payment_status;
	}



	public int getDorm_application_pk() {
		return dorm_application_pk;
	}



	public void setDorm_application_pk(int dorm_application_pk) {
		this.dorm_application_pk = dorm_application_pk;
	}



	public int getStudent_pk() {
		return student_pk;
	}



	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}



	public int getDorm_info_pk() {
		return dorm_info_pk;
	}



	public void setDorm_info_pk(int dorm_info_pk) {
		this.dorm_info_pk = dorm_info_pk;
	}



	public Date getCreated_at() {
		return created_at;
	}



	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}



	public String getPriority_select() {
		return priority_select;
	}



	public void setPriority_select(String priority_select) {
		this.priority_select = priority_select;
	}



	public String getSelection_status() {
		return selection_status;
	}



	public void setSelection_status(String selection_status) {
		this.selection_status = selection_status;
	}



	public String getPayment_status() {
		return payment_status;
	}



	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	
	
	
	
	
	
	
	
	
	
	
}
