package com.mkfactory.toothless.d.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProgramDto {

	private int program_pk;
	private int staff_pk;
	private int program_category_pk;
	private String prg_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prg_schedule;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prg_apply_deadline;
	private String prg_main_image;
	private String prg_contents;
	private String prg_location;
	private int prg_apply_number;
	private String prg_is_attend;
	private Date created_at;
	
	
	public ProgramDto() {
		super();
	}


	public ProgramDto(int program_pk, int staff_pk, int program_category_pk, String prg_name, Date prg_schedule,
			Date prg_apply_deadline, String prg_main_image, String prg_contents, String prg_location,
			int prg_apply_number, String prg_is_attend, Date created_at) {
		super();
		this.program_pk = program_pk;
		this.staff_pk = staff_pk;
		this.program_category_pk = program_category_pk;
		this.prg_name = prg_name;
		this.prg_schedule = prg_schedule;
		this.prg_apply_deadline = prg_apply_deadline;
		this.prg_main_image = prg_main_image;
		this.prg_contents = prg_contents;
		this.prg_location = prg_location;
		this.prg_apply_number = prg_apply_number;
		this.prg_is_attend = prg_is_attend;
		this.created_at = created_at;
	}


	public int getProgram_pk() {
		return program_pk;
	}


	public void setProgram_pk(int program_pk) {
		this.program_pk = program_pk;
	}


	public int getStaff_pk() {
		return staff_pk;
	}


	public void setStaff_pk(int staff_pk) {
		this.staff_pk = staff_pk;
	}


	public int getProgram_category_pk() {
		return program_category_pk;
	}


	public void setProgram_category_pk(int program_category_pk) {
		this.program_category_pk = program_category_pk;
	}


	public String getPrg_name() {
		return prg_name;
	}


	public void setPrg_name(String prg_name) {
		this.prg_name = prg_name;
	}


	public Date getPrg_schedule() {
		return prg_schedule;
	}


	public void setPrg_schedule(Date prg_schedule) {
		this.prg_schedule = prg_schedule;
	}


	public Date getPrg_apply_deadline() {
		return prg_apply_deadline;
	}


	public void setPrg_apply_deadline(Date prg_apply_deadline) {
		this.prg_apply_deadline = prg_apply_deadline;
	}


	public String getPrg_main_image() {
		return prg_main_image;
	}


	public void setPrg_main_image(String prg_main_image) {
		this.prg_main_image = prg_main_image;
	}


	public String getPrg_contents() {
		return prg_contents;
	}


	public void setPrg_contents(String prg_contents) {
		this.prg_contents = prg_contents;
	}


	public String getPrg_location() {
		return prg_location;
	}


	public void setPrg_location(String prg_location) {
		this.prg_location = prg_location;
	}


	public int getPrg_apply_number() {
		return prg_apply_number;
	}


	public void setPrg_apply_number(int prg_apply_number) {
		this.prg_apply_number = prg_apply_number;
	}


	public String getPrg_is_attend() {
		return prg_is_attend;
	}


	public void setPrg_is_attend(String prg_is_attend) {
		this.prg_is_attend = prg_is_attend;
	}


	public Date getCreated_at() {
		return created_at;
	}


	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
}
