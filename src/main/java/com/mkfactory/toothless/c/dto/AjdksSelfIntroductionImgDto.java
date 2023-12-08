package com.mkfactory.toothless.c.dto;

public class AjdksSelfIntroductionImgDto {

	public int tl_c_self_introduction_img_pk;
	public String self_introducrion_img;
	
	public AjdksSelfIntroductionImgDto() {
		super();
	}

	public AjdksSelfIntroductionImgDto(int tl_c_self_introduction_img_pk, String self_introducrion_img) {
		super();
		this.tl_c_self_introduction_img_pk = tl_c_self_introduction_img_pk;
		this.self_introducrion_img = self_introducrion_img;
	}

	public int getTl_c_self_introduction_img_pk() {
		return tl_c_self_introduction_img_pk;
	}

	public void setTl_c_self_introduction_img_pk(int tl_c_self_introduction_img_pk) {
		this.tl_c_self_introduction_img_pk = tl_c_self_introduction_img_pk;
	}

	public String getSelf_introducrion_img() {
		return self_introducrion_img;
	}

	public void setSelf_introducrion_img(String self_introducrion_img) {
		this.self_introducrion_img = self_introducrion_img;
	}
	
	
}
