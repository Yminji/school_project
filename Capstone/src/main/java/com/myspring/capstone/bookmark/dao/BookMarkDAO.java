package com.myspring.capstone.bookmark.dao;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.capstone.bookmark.vo.BookMarkVO;
import com.myspring.capstone.fstvl.vo.FstvlVO;
public interface BookMarkDAO {
	public List<BookMarkVO> selectBookMarkList(BookMarkVO bookMarkVO) throws DataAccessException;
	
	public List<FstvlVO> selectFstvlList(List<BookMarkVO> bookMarkList) throws DataAccessException;
	
	public boolean selectCountInBookMark(BookMarkVO bookMarkVO) throws DataAccessException;
	
	public void insertFstvlInBookMark(BookMarkVO bookMarkVO) throws DataAccessException;
	
	public void deleteBookMarkFstvl(int regNO) throws DataAccessException;
}
