package com.mkfactory.toothless.a.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class JoinDormInfoDto {

	private int dorm_info_pk;
	private int semester_pk;
	private String title;
	private String detail_expln;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date apply_start_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date apply_end_date;
	private int selection_amount;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date pass_anncm_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date payment_start_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date payment_end_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date asgnm_anncm_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date join_dorm_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date created_at;
	
	
	
	public JoinDormInfoDto() {}



	public JoinDormInfoDto(int dorm_info_pk, int semester_pk, String title, String detail_expln, Date apply_start_date,
			Date apply_end_date, int selection_amount, Date pass_anncm_date, Date payment_start_date,
			Date payment_end_date, Date asgnm_anncm_date, Date join_dorm_date, Date created_at) {
		
		this.dorm_info_pk = dorm_info_pk;
		this.semester_pk = semester_pk;
		this.title = title;
		this.detail_expln = detail_expln;
		this.apply_start_date = apply_start_date;
		this.apply_end_date = apply_end_date;
		this.selection_amount = selection_amount;
		this.pass_anncm_date = pass_anncm_date;
		this.payment_start_date = payment_start_date;
		this.payment_end_date = payment_end_date;
		this.asgnm_anncm_date = asgnm_anncm_date;
		this.join_dorm_date = join_dorm_date;
		this.created_at = created_at;
	}



	public int getDorm_info_pk() {
		return dorm_info_pk;
	}



	public void setDorm_info_pk(int dorm_info_pk) {
		this.dorm_info_pk = dorm_info_pk;
	}



	public int getSemester_pk() {
		return semester_pk;
	}



	public void setSemester_pk(int semester_pk) {
		this.semester_pk = semester_pk;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getDetail_expln() {
		return detail_expln;
	}



	public void setDetail_expln(String detail_expln) {
		this.detail_expln = detail_expln;
	}



	public Date getApply_start_date() {
		return apply_start_date;
	}



	public void setApply_start_date(Date apply_start_date) {
		this.apply_start_date = apply_start_date;
	}



	public Date getApply_end_date() {
		return apply_end_date;
	}



	public void setApply_end_date(Date apply_end_date) {
		this.apply_end_date = apply_end_date;
	}



	public int getSelection_amount() {
		return selection_amount;
	}



	public void setSelection_amount(int selection_amount) {
		this.selection_amount = selection_amount;
	}



	public Date getPass_anncm_date() {
		return pass_anncm_date;
	}



	public void setPass_anncm_date(Date pass_anncm_date) {
		this.pass_anncm_date = pass_anncm_date;
	}



	public Date getPayment_start_date() {
		return payment_start_date;
	}



	public void setPayment_start_date(Date payment_start_date) {
		this.payment_start_date = payment_start_date;
	}



	public Date getPayment_end_date() {
		return payment_end_date;
	}



	public void setPayment_end_date(Date payment_end_date) {
		this.payment_end_date = payment_end_date;
	}



	public Date getAsgnm_anncm_date() {
		return asgnm_anncm_date;
	}



	public void setAsgnm_anncm_date(Date asgnm_anncm_date) {
		this.asgnm_anncm_date = asgnm_anncm_date;
	}



	public Date getJoin_dorm_date() {
		return join_dorm_date;
	}



	public void setJoin_dorm_date(Date join_dorm_date) {
		this.join_dorm_date = join_dorm_date;
	}



	public Date getCreated_at() {
		return created_at;
	}



	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
	
	
	
	
	
}
