package com.myspring.capstone.fstvl.vo;

import org.springframework.stereotype.Repository;

@Repository("fstvlVO")
public class FstvlVO {
	private int fstvl_id;
	private String fstvlNm;
	private String opar;
	private String fstvlStartDate;
	private String fstvlEndDate;
	private String fstvlCo;
	private String mnst;
	private String auspclnstt;
	private String suprtlnstt;
	private String phoneNumber;
	private String homepageUrl;
	private String relateInfo;
	private String rdnmadr;
	private String lnmadr;
	private int latitude;
	private int longitude;
	
	public void setFstvl_id(int fstvl_id) {this.fstvl_id = fstvl_id;}
	public int getFstvl_id() {return fstvl_id;}
	
	public void setFstvlNm(String fstvlNm) {this.fstvlNm = fstvlNm;}
	public String getFstvlNm() {return fstvlNm;}
	
	public void setOpar(String opar) {this.opar = opar;}
	public String getOpar() {return opar;}
	
	public void setFstvlStartDate(String fstvlStartDate) {this.fstvlStartDate = fstvlStartDate;}
	public String getFstvlStartDate() {return fstvlStartDate;}
	
	public void setFstvlEndDate(String fstvlEndDate) {this.fstvlEndDate = fstvlEndDate;}
	public String getFstvlEndDate() {return fstvlEndDate;}
	
	public void setFstvlCo(String fstvlCo) {this.fstvlCo = fstvlCo;}
	public String getFstvlCo() {return fstvlCo;}
	
	public void setMnst(String mnst) {this.mnst = mnst;}
	public String getMnst() {return mnst;}
	
	public void setAuspclnstt(String auspclnstt) {this.auspclnstt = auspclnstt;}
	public String getAuspclnstt() {return auspclnstt;}
	
	public void setSuprtlnstt(String suprtlnstt) {this.suprtlnstt = suprtlnstt;}
	public String getSuprtlnstt() {return suprtlnstt;}
	
	public void setPhoneNumber(String phoneNumber) {this.phoneNumber = phoneNumber;}
	public String getPhoneNumber() {return phoneNumber;}
	
	public void setHomepageUrl(String homepageUrl) {this.homepageUrl = homepageUrl;}
	public String getHomepageUrl() {return homepageUrl;}
	
	public void setRelateInfo(String relateInfo) {this.relateInfo = relateInfo;}
	public String getRelateInfo() {return relateInfo;}
	
	public void setRdnmadr(String rdnmadr) {this.rdnmadr = rdnmadr;}
	public String getRdnmadr() {return rdnmadr;}
	
	public void setLnmadr(String lnmadr) {this.lnmadr = lnmadr;}
	public String getLnmadr() {return lnmadr;}
	
	public void setLatitude(int latitude) {this.latitude = latitude;}
	public int getLatitude() {return latitude;}
	
	public void setLongitude(int longitude) {this.longitude = longitude;}
	public int getLongitude() {return longitude;}
	
}
