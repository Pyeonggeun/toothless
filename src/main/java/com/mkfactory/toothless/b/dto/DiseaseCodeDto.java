package com.mkfactory.toothless.b.dto;

import java.util.Date;

public class DiseaseCodeDto {

	private int disease_code_pk;
	private String name;
	private Date created_at;
	
	public DiseaseCodeDto() {
		super();
	}

	public DiseaseCodeDto(int disease_code_pk, String name, Date created_at) {
		super();
		this.disease_code_pk = disease_code_pk;
		this.name = name;
		this.created_at = created_at;
	}

	public int getDisease_code_pk() {
		return disease_code_pk;
	}

	public void setDisease_code_pk(int disease_code_pk) {
		this.disease_code_pk = disease_code_pk;
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
