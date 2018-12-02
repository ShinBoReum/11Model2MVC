package com.model2.mvc.service.domain;

public class Brand {
	private int 		brand_id; 
	private String		brandNam;
	private String 		national;
	
	
	public Brand() {
		
	}


	public int getBrand_id() {
		return brand_id;
	}


	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}
	
	public String getBrandNam() {
		return brandNam;
	}


	public void setBrandNam(String brandNam) {
		this.brandNam = brandNam;
	}


	public String getNational() {
		return national;
	}


	public void setNational(String national) {
		this.national = national;
	}


	@Override
	public String toString() {
		return "Brand [brand_id=" + brand_id + ", BrandName=" + brandNam + ", national=" + national + "]";
	}



	
	

}
