package com.myspring.capstone.path.vo;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository("pathVO")
public class PathVO {
	private int articleNO;
	private String member_id;
	private Date s_date;
	private Date e_dete;
	private String title;
	private String intro;
	private Date w_date;
	
	public void setArticleNO(int articleNO) {this.articleNO = articleNO;}
	public int getArticleNO() {return articleNO;}
	
	public void setMember_id(String member_id) {this.member_id = member_id;}
	public String getMember_id() {return member_id;}
	
	public void setS_date(Date s_date) {this.s_date = s_date;}
	public Date getS_date() {return s_date;}
	
	public void setE_date(Date e_dete) {this.e_dete = e_dete;}
	public Date getE_date() {return e_dete;}
	
	public void setTitle(String title) {this.title = title;}
	public String getTitle() {return title;}
	
	public void setIntro(String intro) {this.intro = intro;}
	public String getIntro() {return intro;}
	
	public void setW_date(Date w_date) {this.w_date = w_date;}
	public Date getW_date() {return w_date;}
	
}
