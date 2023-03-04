package com.myspring.capstone.path.vo;

import org.springframework.stereotype.Repository;

@Repository("pathVO")
public class PathVO {
	private String member_id;
	private String start_date;
	private String end_date;
	private String title;
	private String latitude;
	private String longitude;
	private String content;
	
	public void setMember_id(String member_id) {this.member_id = member_id;}
	public String getMember_id() {return member_id;}
	
	public void setStart_date(String start_date) {this.start_date = start_date;}
	public String getStart_date() {return start_date;}
	
	public void setEnd_date(String end_date) {this.end_date = end_date;}
	public String getEnd_date() {return end_date;}
	
	public void setTitle(String title) {this.title = title;}
	public String getTitle() {return title;}
	
	public void setLatitude(String latitude) {this.latitude = latitude;}
	public String getLatitude() {return latitude;}
	
	public void setLongitude(String longitude) {this.longitude = longitude;}
	public String getLongitude() {return longitude;}
	
	public void setContent(String content) {this.content = content;}
	public String getContent() {return content;}
	
}