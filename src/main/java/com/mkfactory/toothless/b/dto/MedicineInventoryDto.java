package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class MedicineInventoryDto {

	private int medicine_inventory_pk;
	private int medicine_code_pk;
	private int medicine_mgmt_cat_pk;
	private int staff_pk;
	private int quantity;
	private String reason;
	private Date created_at;
	
	public MedicineInventoryDto() {
		super();
	}

	public MedicineInventoryDto(int medicine_inventory_pk, int medicine_code_pk, int medicine_mgmt_cat_pk, int staff_pk,
			int quantity, String reason, Date created_at) {
		super();
		this.medicine_inventory_pk = medicine_inventory_pk;
		this.medicine_code_pk = medicine_code_pk;
		this.medicine_mgmt_cat_pk = medicine_mgmt_cat_pk;
		this.staff_pk = staff_pk;
		this.quantity = quantity;
		this.reason = reason;
		this.created_at = created_at;
	}

	public int getMedicine_inventory_pk() {
		return medicine_inventory_pk;
	}

	public void setMedicine_inventory_pk(int medicine_inventory_pk) {
		this.medicine_inventory_pk = medicine_inventory_pk;
	}

	public int getMedicine_code_pk() {
		return medicine_code_pk;
	}

	public void setMedicine_code_pk(int medicine_code_pk) {
		this.medicine_code_pk = medicine_code_pk;
	}

	public int getMedicine_mgmt_cat_pk() {
		return medicine_mgmt_cat_pk;
	}

	public void setMedicine_mgmt_cat_pk(int medicine_mgmt_cat_pk) {
		this.medicine_mgmt_cat_pk = medicine_mgmt_cat_pk;
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

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
