package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class ItemDto {
	
	private int item_pk;
	private int item_cat_pk;
	private String name;
	private String img_link;
	private String content;
	private Date created_at;
	
	public ItemDto() {
		super();
	}

	public ItemDto(int item_pk, int item_cat_pk, String name, String img_link, String content, Date created_at) {
		super();
		this.item_pk = item_pk;
		this.item_cat_pk = item_cat_pk;
		this.name = name;
		this.img_link = img_link;
		this.content = content;
		this.created_at = created_at;
	}

	public int getItem_pk() {
		return item_pk;
	}

	public void setItem_pk(int item_pk) {
		this.item_pk = item_pk;
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

	public String getImg_link() {
		return img_link;
	}

	public void setImg_link(String img_link) {
		this.img_link = img_link;
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
