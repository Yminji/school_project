package com.myspring.capstone.member.vo;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String member_id;
	
	public void setMember_id(String member_id) {this.member_id = member_id;}
	public String getMember_id() {return member_id;}
}
