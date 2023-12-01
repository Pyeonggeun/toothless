package com.mkfactory.toothless.b.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MedicineAddDto {
	
	private int medicine_add_pk;
	private int medicine_code_pk;
	private int staff_pk;
	private int quantity;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date add_at;
	private Date created_at;
	
	public MedicineAddDto() {
		super();
	}

	public MedicineAddDto(int medicine_add_pk, int medicine_code_pk, int staff_pk, int quantity, Date add_at,
			Date created_at) {
		super();
		this.medicine_add_pk = medicine_add_pk;
		this.medicine_code_pk = medicine_code_pk;
		this.staff_pk = staff_pk;
		this.quantity = quantity;
		this.add_at = add_at;
		this.created_at = created_at;
	}

	public int getMedicine_add_pk() {
		return medicine_add_pk;
	}

	public void setMedicine_add_pk(int medicine_add_pk) {
		this.medicine_add_pk = medicine_add_pk;
	}

	public int getMedicine_code_pk() {
		return medicine_code_pk;
	}

	public void setMedicine_code_pk(int medicine_code_pk) {
		this.medicine_code_pk = medicine_code_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getAdd_at() {
		return add_at;
	}

	public void setAdd_at(Date add_at) {
		this.add_at = add_at;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
