package com.myspring.capstone.path.vo;

import org.springframework.stereotype.Repository;

@Repository("mapVO")
public class MapVO {
	private String latitude;
	private String longitude;
	private String placeName;
	private String intro;
	private int regNO;
	private int articleNO;
	
	public void setArticleNO(int articleNO) {this.articleNO = articleNO;}
	public int getArticleNO() {return articleNO;}
	
	public void setIntro(String intro) {this.intro = intro;}
	public String getIntro() {return intro;}
	
	public void setLatitude(String latitude) {this.latitude = latitude;}
	public String getLatitude() {return latitude;}
	
	public void setLongitude(String longitude) {this.longitude = longitude;}
	public String getLongitude() {return longitude;}
	
	public void setPlaceName(String placeName) {this.placeName = placeName;}
	public String getPlaceName() {return placeName;}
	
	public void setRegNO(int regNO) {this.regNO = regNO;}
	public int getRegNO() {return regNO;}
	
	/*private String member_id;
	private String latitude;
	private String longitude;
	private String placeName;
	private int regNO;
	private int numNO;
	
	public void setNumNO(int numNO) {this.numNO = numNO;}
	public int getNumNO() {return numNO;}
	
	public void setMember_id(String member_id) {this.member_id = member_id;}
	public String getMember_id() {return member_id;}
	
	public void setLatitude(String latitude) {this.latitude = latitude;}
	public String getLatitude() {return latitude;}
	
	public void setLongitude(String longitude) {this.longitude = longitude;}
	public String getLongitude() {return longitude;}
	
	public void setPlaceName(String placeName) {this.placeName = placeName;}
	public String getPlaceName() {return placeName;}
	
	public void setRegNO(int regNO) {this.regNO = regNO;}
	public int getRegNO() {return regNO;}*/
}
