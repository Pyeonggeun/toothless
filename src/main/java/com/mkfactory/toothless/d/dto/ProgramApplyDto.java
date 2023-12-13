package com.mkfactory.toothless.d.dto;

import java.util.Date;

public class ProgramApplyDto {
	private int program_apply_pk;
	private int student_pk;
	private int program_pk;
	private String prg_student_phone;
	private String prg_is_student_attend;
	private Date created_at;
	
	public ProgramApplyDto() {
		super();
	}

	public ProgramApplyDto(int program_apply_pk, int student_pk, int program_pk, String prg_student_phone,
			String prg_is_student_attend, Date created_at) {
		super();
		this.program_apply_pk = program_apply_pk;
		this.student_pk = student_pk;
		this.program_pk = program_pk;
		this.prg_student_phone = prg_student_phone;
		this.prg_is_student_attend = prg_is_student_attend;
		this.created_at = created_at;
	}

	public int getProgram_apply_pk() {
		return program_apply_pk;
	}

	public void setProgram_apply_pk(int program_apply_pk) {
		this.program_apply_pk = program_apply_pk;
	}

	public int getStudent_pk() {
		return student_pk;
	}

	public void setStudent_pk(int student_pk) {
		this.student_pk = student_pk;
	}

	public int getProgram_pk() {
		return program_pk;
	}

	public void setProgram_pk(int program_pk) {
		this.program_pk = program_pk;
	}

	public String getPrg_student_phone() {
		return prg_student_phone;
	}

	public void setPrg_student_phone(String prg_student_phone) {
		this.prg_student_phone = prg_student_phone;
	}

	public String getPrg_is_student_attend() {
		return prg_is_student_attend;
	}

	public void setPrg_is_student_attend(String prg_is_student_attend) {
		this.prg_is_student_attend = prg_is_student_attend;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	};
	
	
}
