package com.myspring.capstone.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.capstone.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(Map<String, String> loginMap) throws DataAccessException;
	
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	
	public String selectOverlappedID(String Id) throws DataAccessException;
	
	public void deleteMemberID(String id) throws DataAccessException;
}
