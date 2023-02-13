package com.myspring.capstone.bookmark.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("bookMarkVO")
public class BookMarkVO {
	private int regNO; //북마크 등록번호
	private int fstvl_id; //축제 번호
	private String member_id; //회원 아이디
	private Date regDate; //북마크 등록 날짜
	private String content;
	
	public BookMarkVO() {}
	public BookMarkVO(int regNO, int fstvl_id, String member_id, String content) {
		this.regNO = regNO;
		this.fstvl_id = fstvl_id;
		this.member_id = member_id;
		this.content = content;
	}
	
	public void setRegNO(int regNO) {this.regNO = regNO;}
	public int getRegNO() {return regNO;}
	
	public void setFstvl_id(int fstvl_id) {this.fstvl_id = fstvl_id;}
	public int getFstvl_id() {return fstvl_id;}
	
	public void setMember_id(String member_id) {this.member_id = member_id;}
	public String getMember_id() {return member_id;}
	
	public void setRegDate(Date regDate) {this.regDate = regDate;}
	public Date getRegDate() {return regDate;}
	
	public void setContent(String content) {this.content = content;}
	public String getContent() {return content;}
}
