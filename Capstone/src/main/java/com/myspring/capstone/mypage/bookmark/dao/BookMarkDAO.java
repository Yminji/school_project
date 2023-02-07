package com.myspring.capstone.mypage.bookmark.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.capstone.festival.vo.FstvlVO;
import com.myspring.capstone.mypage.bookmark.vo.BookMarkVO;

public interface BookMarkDAO {
	public List<BookMarkVO> selectBookMarkList(BookMarkVO bookMarkVO) throws DataAccessException;
	
	public List<FstvlVO> selectFstvlList(List<BookMarkVO> bookMarkList) throws DataAccessException;
	
	public boolean selectCountInBookMark(BookMarkVO bookMarkVO) throws DataAccessException;
	
	public void insertFstvlInBookMark(BookMarkVO bookMarkVO) throws DataAccessException;
	
	public void deleteBookMarkFstvl(int regNO) throws DataAccessException;
}
