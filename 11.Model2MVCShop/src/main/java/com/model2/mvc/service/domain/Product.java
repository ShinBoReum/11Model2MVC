package com.model2.mvc.service.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;


public class Product {
	
	private MultipartFile imgFile;
	private String fileName;
	private String manuDate;
	private int price;
	private String prodDetail;
	private String prodName;
	private int prodNo;
	private Date regDate;
	private String proTranCode;
	private int tran_no;
	private Brand brandId;
	private Brand brandName;
	
	public Product(){
	}
	
	public String getProTranCode() {
		return proTranCode;
	}
	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getManuDate() {
		return manuDate;
	}
	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public int getTran_no() {
		return tran_no;
	}

	public void setTran_no(int tran_no) {
		this.tran_no = tran_no;
	}

	public MultipartFile getImgFile() {
		return imgFile;
	}

	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}

	public Brand getBrandId() {
		return brandId;
	}

	public void setBrandId(Brand brandId) {
		this.brandId = brandId;
	}

	public Brand getBrandName() {
		return brandName;
	}

	public void setBrandName(Brand brandName) {
		this.brandName = brandName;
	}

	@Override
	public String toString() {
		return "Product [imgFile=" + imgFile + ", fileName=" + fileName + ", manuDate=" + manuDate + ", price=" + price
				+ ", prodDetail=" + prodDetail + ", prodName=" + prodName + ", prodNo=" + prodNo + ", regDate="
				+ regDate + ", proTranCode=" + proTranCode + ", tran_no=" + tran_no + ", brandId=" + brandId
				+ ", brandName=" + brandName + "]";
	}

	

}