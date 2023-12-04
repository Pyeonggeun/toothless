package com.mkfactory.toothless.e.dto;

public class TypeCategoryDto {

	private int id;
	private String name;
	
		public TypeCategoryDto() {
		super();
	}

		public TypeCategoryDto(int id, String name) {
			super();
			this.id = id;
			this.name = name;
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
	
	
}
