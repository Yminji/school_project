package com.myspring.capstone.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.capstone.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO login(Map<String, String> loginMap) throws DataAccessException{
		MemberVO memberVO = (MemberVO) sqlSession.selectOne("mapper.member.login", loginMap);
		return memberVO;
	}
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember",memberVO);
	}
	
	@Override
	public String selectOverlappedID(String id) throws DataAccessException{
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedID",id);
		return result;
	}
	
	@Override
	public void deleteMemberID(String id) throws DataAccessException{
		sqlSession.delete("mapper.member.deleteMemberID", id);
	}
}
