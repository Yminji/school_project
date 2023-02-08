package com.myspring.capstone.fstvl.vo;

import java.sql.Date;

public class ImageFileVO {
	private int image_id; //이미지 번호
	private int fstvl_id; //축제 번호
	private String fileName; //이미지파일명
	private String reg_id; //등록자 아이디
	private String fileType; //이미지 파일 종류
	private Date creDate; //등록일
	
	public void setImage_id(int image_id) {this.image_id = image_id;}
	public int getImage_id() {return image_id;}
	
	public void setFstvl_id(int fstvl_id) {this.fstvl_id = fstvl_id;}
	public int getFstvl_id() {return fstvl_id;}
	
	public void setFileName(String fileName) {this.fileName = fileName;}
	public String getFileName() {return fileName;}
	
	public void setReg_id(String reg_id) {this.reg_id = reg_id;}
	public String getReg_id() {return reg_id;}
	
	public void setFileType(String fileType) {this.fileType = fileType;}
	public String getFileType() {return fileType;}
	
	public void setCreDate(Date creDate) {this.creDate = creDate;}
	public Date getCreDate() {return creDate;}
}
