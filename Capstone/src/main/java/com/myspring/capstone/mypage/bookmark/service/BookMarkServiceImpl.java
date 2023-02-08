package com.myspring.capstone.mypage.bookmark.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.capstone.fstvl.vo.FstvlVO;
import com.myspring.capstone.mypage.bookmark.dao.BookMarkDAO;
import com.myspring.capstone.mypage.bookmark.vo.BookMarkVO;

@Service("BookService")
@Transactional(propagation = Propagation.REQUIRED)
public class BookMarkServiceImpl implements BookMarkService{
	@Autowired
	private BookMarkDAO bookMarkDAO;
	
	public Map<String, List> bookMarkList(BookMarkVO bookMarkVO) throws Exception{
		Map<String, List> bookMarkMap = new HashMap<String, List>();
		List<BookMarkVO> bookMarkList = bookMarkDAO.selectBookMarkList(bookMarkVO); //북마크 정보 조회
		
		if(bookMarkList.size() == 0)
			return null;
		
		List<FstvlVO> fstvlList = bookMarkDAO.selectFstvlList(bookMarkList); //축제 정보 조회
		bookMarkMap.put("bookMarkList", bookMarkList);
		bookMarkMap.put("fstvlList", fstvlList);
		return bookMarkMap;
	}
	
	public boolean findBookMarkFstvl(BookMarkVO bookMarkVO) throws Exception{
		return bookMarkDAO.selectCountInBookMark(bookMarkVO);
	}
	
	public void addFstvlInBookMark(BookMarkVO bookMarkVO) throws Exception{
		bookMarkDAO.insertFstvlInBookMark(bookMarkVO);
	}
	
	public void removeBookMarkFstvl(int regNO) throws Exception{
		bookMarkDAO.deleteBookMarkFstvl(regNO);
	}
}
