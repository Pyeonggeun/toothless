package com.mkfactory.toothless.a.dto;

public class DormBuildingDto {
	private int dorm_pk;
	private String name;
	private String main_img;
	private String address;
	
	public DormBuildingDto() {
		super();
	}

	public DormBuildingDto(int dorm_pk, String name, String main_img, String address) {
		super();
		this.dorm_pk = dorm_pk;
		this.name = name;
		this.main_img = main_img;
		this.address = address;
	}

	public int getDorm_pk() {
		return dorm_pk;
	}

	public void setDorm_pk(int dorm_pk) {
		this.dorm_pk = dorm_pk;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
