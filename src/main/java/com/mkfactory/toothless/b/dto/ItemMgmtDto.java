package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class ItemMgmtDto {
	
	private int	item_mgmt_pk;
	private int item_pk;
	private int staff_pk;
	private String status;
	private Date created_at;
	
	public ItemMgmtDto() {
		super();
	}

	public ItemMgmtDto(int item_mgmt_pk, int item_pk, int staff_pk, String status, Date created_at) {
		super();
		this.item_mgmt_pk = item_mgmt_pk;
		this.item_pk = item_pk;
		this.staff_pk = staff_pk;
		this.status = status;
		this.created_at = created_at;
	}

	public int getItem_mgmt_pk() {
		return item_mgmt_pk;
	}

	public void setItem_mgmt_pk(int item_mgmt_pk) {
		this.item_mgmt_pk = item_mgmt_pk;
	}

	public int getItem_pk() {
		return item_pk;
	}

	public void setItem_pk(int item_pk) {
		this.item_pk = item_pk;
	}

	public int getStaff_pk() {
		return staff_pk;
	}

	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
