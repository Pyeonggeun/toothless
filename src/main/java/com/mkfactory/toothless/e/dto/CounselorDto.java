package com.mkfactory.toothless.e.dto;

import java.util.Date;

public class CounselorDto {

	private int id;
	private String name;
	private int age;
	private String gender;
	private String phonenumber;
	private String email;
	private String address;
	private String career;
	private String profileImage;
	private Date created_at;
	
	public CounselorDto() {
		super();
	}

	public CounselorDto(int id, String name, int age, String gender, String phonenumber, String email, String address,
			String career, String profileImage, Date created_at) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.phonenumber = phonenumber;
		this.email = email;
		this.address = address;
		this.career = career;
		this.profileImage = profileImage;
		this.created_at = created_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
