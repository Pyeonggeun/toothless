package com.mkfactory.toothless.b.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ItemApplyDto {
	
	private int item_apply_pk;
	private int student_pk;
	private int item_pk;
	private String reason;
	private String status;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date rental_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date return_date;
	private int quantity;
	private Date created_at;
	
	public ItemApplyDto() {
		super();
	}

	public ItemApplyDto(int item_apply_pk, int student_pk, int item_pk, String reason, String status, Date rental_date,
			Date return_date, int quantity, Date created_at) {
		super();
		this.item_apply_pk = item_apply_pk;
		this.student_pk = student_pk;
		this.item_pk = item_pk;
		this.reason = reason;
		this.status = status;
		this.rental_date = rental_date;
		this.return_date = return_date;
		this.quantity = quantity;
		this.created_at = created_at;
	}

	public int getItem_apply_pk() {
		return item_apply_pk;
	}

	public void setItem_apply_pk(int item_apply_pk) {
		this.item_apply_pk = item_apply_pk;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public int getItem_pk() {
		return item_pk;
	}

	public void setItem_pk(int item_pk) {
		this.item_pk = item_pk;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getRental_date() {
		return rental_date;
	}

	public void setRental_date(Date rental_date) {
		this.rental_date = rental_date;
	}

	public Date getReturn_date() {
		return return_date;
	}

	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
