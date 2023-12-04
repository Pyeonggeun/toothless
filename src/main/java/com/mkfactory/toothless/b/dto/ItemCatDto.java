package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class ItemCatDto {

	private int item_cat_pk;
	private String name;
	private Date created_at;
	
	public ItemCatDto() {
		super();
	}

	public ItemCatDto(int item_cat_pk, String name, Date created_at) {
		super();
		this.item_cat_pk = item_cat_pk;
		this.name = name;
		this.created_at = created_at;
	}

	public int getItem_cat_pk() {
		return item_cat_pk;
	}

	public void setItem_cat_pk(int item_cat_pk) {
		this.item_cat_pk = item_cat_pk;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
}
