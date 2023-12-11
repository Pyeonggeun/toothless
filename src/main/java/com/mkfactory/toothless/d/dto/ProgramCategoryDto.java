package com.mkfactory.toothless.d.dto;

public class ProgramCategoryDto {

	private int program_category_pk;
	private String program_category_name;
	
	
	public ProgramCategoryDto() {
		super();
	}


	public ProgramCategoryDto(int program_category_pk, String program_category_name) {
		super();
		this.program_category_pk = program_category_pk;
		this.program_category_name = program_category_name;
	}


	public int getProgram_category_pk() {
		return program_category_pk;
	}


	public void setProgram_category_pk(int program_category_pk) {
		this.program_category_pk = program_category_pk;
	}


	public String getProgram_category_name() {
		return program_category_name;
	}


	public void setProgram_category_name(String program_category_name) {
		this.program_category_name = program_category_name;
	}
	
	
}
