package com.myspring.capstone.bookmark.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.capstone.bookmark.vo.BookMarkVO;
import com.myspring.capstone.fstvl.vo.FstvlVO;

@Repository("bookMarkDAO")
public class BookMarkDAOImpl implements BookMarkDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<BookMarkVO> selectBookMarkList(BookMarkVO bookMarkVO) throws DataAccessException{
		List<BookMarkVO> bookMarkList = (List)sqlSession.selectList("mapper.bookmark.selectBookMarkList", bookMarkVO);
		return bookMarkList;
	}
	
	public List<FstvlVO> selectFstvlList(List<BookMarkVO> bookMarkList) throws DataAccessException{
		List<FstvlVO> fstvlList;
		fstvlList = sqlSession.selectList("mapper.bookmark.selectFstvlList", bookMarkList);
		return fstvlList;
	}
	
	public boolean selectCountInBookMark(BookMarkVO bookMarkVO) throws DataAccessException{
		String result = sqlSession.selectOne("mapper.bookmark.selectCountInBookMark", bookMarkVO);
		return Boolean.parseBoolean(result);
	}
	
	public void insertFstvlInBookMark(BookMarkVO bookMarkVO) throws DataAccessException{
		int regNO = selectMaxBookMarkId();
		bookMarkVO.setRegNO(regNO);
		sqlSession.insert("mapper.bookmark.insertFstvlInBookMark", bookMarkVO);
	}
	
	public int selectMaxBookMarkId() throws DataAccessException{
		int regNO = sqlSession.selectOne("mapper.bookmark.selectMaxBookMarkId");
		return regNO;
	}
	
	public void deleteBookMarkFstvl(int regNO) throws DataAccessException{
		sqlSession.delete("mapper.bookmark.deleteBookMarkFstvl", regNO);
	}
}

